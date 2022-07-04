using ModelingToolkit
using DifferentialEquations

function solvesystems(systems, connection_eqs, timespan; solver=Tsit5())
    @variables t

    @named _model = ODESystem(connection_eqs, t)
    @named model = compose(_model, systems)

    sys = structural_simplify(model)

    prob = ODEProblem(sys, [], timespan)
    sol = solve(prob, solver)

    return sol
end
