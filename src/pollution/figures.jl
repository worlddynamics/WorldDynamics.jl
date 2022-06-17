include("../plotvariables.jl")
include("Pollution.jl")
include("odesystem.jl")


sol = solvepollution()


@named nr = Pollution.non_renewable()
@named pop = Pollution.population()
@named ag = Pollution.agriculture()
@named pp = Pollution.persistent_pollution()
@named pd = Pollution.pollution_damage()

@variables t


fig_6_28_variables = [
    (nr.pcrum, 0, 1), 
    (pop.pop, 0, 4e9), 
    (ag.al, 0, 2e9), 
    (ag.aiph, 0, 50), 
    (pp.ppgr, 0, 2e8)
]

plotvariables(sol, t, fig_6_28_variables, name="Fig. 6.28", showlegend=true, showaxis=true, colored=true)


fig_6_29_variables = [
    (pp.ppgr, 0, 2e8),
    (pp.ppapr, 0, 2e8),
    (pp.ppasr, 0, 2e8),
    (pp.ppolx, 0, 1),
    (pp.ahl, 0, 2),
    (pd.lmp, 0, 1),
    (pd.lfdr, 0, 0.5),
]

plotvariables(sol, t, fig_6_29_variables, name="Fig. 6.29", showlegend=true, showaxis=true, colored=true)
