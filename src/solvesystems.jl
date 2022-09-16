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
   `solve(system::ODESystem, timespan; solver=Tsit5())`

Return the solution of the `system` ODE system in the `timespan` interval (for the available different ODE system solvers, see the documentation of `DifferentialEquations.jl`).
"""
function solve(system::ODESystem, timespan; solver=Tsit5())
    sys = structural_simplify(system)

    prob = ODEProblem(sys, [], timespan)
    sol = ModelingToolkit.solve(prob, solver)

    return sol
end
