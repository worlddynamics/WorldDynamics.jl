"""
   `variable_connections(systems::Vector{ODESystem})`
Return the set of variable equalities establishing the connections between the variables in the ODE systems included in the vector `systems`. The function assumes that no two distinct variables have the same name (even if they are defined in different ODE systems).
"""
function variable_connections(systems::Vector{ODESystem})
    @variables t
    @named _model = ODESystem([], t)
    @named model = ModelingToolkit.compose(_model, systems)
    connection_eqs::Set{Equation} = Set{Equation}()
    var2sys::Dict{String,String} = Dict{String,String}()
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
