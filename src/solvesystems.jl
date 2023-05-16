using ModelingToolkit
using DifferentialEquations

"""
   `compose(systems::Vector{ODESystem}, connection_eqs::Vector{Equation})`

Return the ODE system obtained by composing the ODE systems in the vector `systems` and by making use of the variable equalities in `connection_eqs`. Normally, each ODE systems in `systems` corresponds to a subsystem of a system in the World3 model, and the variable equalities specify which variables are shared between the subsystems.
"""
function compose(systems::Vector{ODESystem}, connection_eqs::Vector{Equation})
    @variables t

    @named _model = ODESystem(connection_eqs, t)
    @named model = ModelingToolkit.compose(_model, systems)

    return model
end

"""
   `solve(system::ODESystem, timespan; solver=AutoVern9(Rodas5())`

Return the solution of the `system` ODE system in the `timespan` interval (for the available different ODE system solvers, see the documentation of `DifferentialEquations.jl`).

We use the AutoVern9(Rodas5()) solver since it is among the suggested ones in the documentation of `DifferentialEquations.jl`, and among those we tested, it is the one that works best.
"""
function solve(system::ODESystem, timespan; solver=AutoVern9(Rodas5()), kwargs...)
    sys = structural_simplify(system)

    prob = ODEProblem(sys, [], timespan)
    sol = ModelingToolkit.solve(prob, solver; kwargs...)

    return sol
end

"""
   `variable_connections(systems::Vector{ODESystem})`
Return the set of variable equalities establishing the connections between the variables in the ODE systems included in the vector `systems`. The function assumes that no two distinct variables have the same name (even if they are defined in different ODE systems).
"""
function variable_connections(systems::Vector{ODESystem})
    @variables t
    @named _model = ODESystem([], t)
    @named model = ModelingToolkit.compose(_model, systems)
    connection_eqs::Set{Equation} = Set{Equation}()
    var2sys = Dict{String,String}()
    var2fullvar = Dict()
    g = variable_dependencies(model)
    al = g.fadjlist
    for u in 1:lastindex(al)
        @assert length(al[u]) <= 1 "Error in the variable dependencies binary graph: one node has more than one neighbor"
        if (length(al[u]) > 0)
            s, v = split(string(states(model)[u]), "₊")
            var2sys[v] = s
            var2fullvar[v] = states(model)[u]
        end
    end
    ed = equation_dependencies(model)
    for u in eachindex(ed)
        vl = ed[u]
        for v in 1:lastindex(vl)
            subs, var = split(string(vl[v]), "₊")
            if (var2sys[var] != subs)
                push!(connection_eqs, vl[v] ~ var2fullvar[var])
            end
        end
    end
    return collect(connection_eqs)
end
