using ModelingToolkit, DifferentialEquations


function solvesystems(systems, connection_eqs, timespan)
    @variables t

    @named _model = ODESystem(connection_eqs, t)
    @named model = compose(_model, systems)

    sys = structural_simplify(model)

    prob = ODEProblem(sys, [], timespan)
    sol = solve(prob, Tsit5())

    return sol
end
