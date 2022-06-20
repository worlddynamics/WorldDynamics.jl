include("../../src/plotvariables.jl")
include("../solutions/solvepollution.jl")


sol = solvepollution()


@named nr = Pollution.non_renewable()
@named pop = Pollution.population()
@named ag = Pollution.agriculture()
@named pp = Pollution.persistent_pollution()
@named pd = Pollution.pollution_damage()

@variables t


fig_6_28_variables = [
    (nr.pcrum, 0, 1  , "pcrum"), 
    (pop.pop,  0, 4e9, "pop"), 
    (ag.al,    0, 2e9, "al"), 
    (ag.aiph,  0, 50 , "aiph"), 
    (pp.ppgr,  0, 2e8, "ppgr")
]

plotvariables(sol, t, fig_6_28_variables, name="Fig. 6.28", showlegend=true, showaxis=true, colored=true)


fig_6_29_variables = [
    (pp.ppgr,  0, 2e8, "ppgr"),
    (pp.ppapr, 0, 2e8, "ppapr"),
    (pp.ppasr, 0, 2e8, "ppasr"),
    (pp.ppolx, 0, 1,   "ppolx"),
    (pp.ahl,   0, 2,   "ahl"),
    (pd.lmp,   0, 1,   "lmp"),
    (pd.lfdr,  0, 0.5, "lfdr"),
]

plotvariables(sol, t, fig_6_29_variables, name="Fig. 6.29", showlegend=true, showaxis=true, colored=true)
