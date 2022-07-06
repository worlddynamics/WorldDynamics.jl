using ModelingToolkit
using DifferentialEquations

function compose(systems::Vector{ODESystem}, connection_eqs::Vector{Equation})
    @variables t

    @named _model = ODESystem(connection_eqs, t)
    @named model = ModelingToolkit.compose(_model, systems)

    return model
end

function solve(system::ODESystem, timespan; solver=Tsit5())
    sys = structural_simplify(system)

    prob = ODEProblem(sys, [], timespan)
    sol = ModelingToolkit.solve(prob, solver)

    return sol
end
