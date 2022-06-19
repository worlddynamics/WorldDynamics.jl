using ModelingToolkit, DifferentialEquations

include("../../src/Pollution.jl")


function solvepollution()
    @named pop = Pollution.population()
    @named nr = Pollution.non_renewable()
    @named ag = Pollution.agriculture()
    @named pd = Pollution.pollution_damage()
    @named atcc = Pollution.adaptive_technological_control_cards()
    @named pp = Pollution.persistent_pollution()

    connection_eqs = [
        pd.ppolx ~ pp.ppolx
        atcc.lmp ~ pd.lmp
        pp.ppgf22 ~ atcc.ppgf22
        pp.pcrum ~ nr.pcrum
        pp.pop ~ pop.pop
        pp.aiph ~ ag.aiph
        pp.al ~ ag.al
    ]

    @variables t

    @named _pp_model = ODESystem(connection_eqs, t)
    @named pp_model = compose(_pp_model, [pop, nr, ag, pd, atcc, pp])

    pp_sys = structural_simplify(pp_model)

    prob = ODEProblem(pp_sys, [], (1900.0, 1970.0))
    sol = solve(prob, Tsit5())

    return sol
end
