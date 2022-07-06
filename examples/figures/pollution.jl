using WorldDynamics

include("../scenarios/pollution_historicalrun.jl")


system = pollution_historicalrun()
sol = WorldDynamics.solve(system, (1900.0, 2100.0))


@named nr = WorldDynamics.World3.Pollution.non_renewable()
@named pop = WorldDynamics.World3.Pollution.population()
@named ag = WorldDynamics.World3.Pollution.agriculture()
@named pp = WorldDynamics.World3.Pollution.persistent_pollution()
@named pd = WorldDynamics.World3.Pollution.pollution_damage()

@variables t


fig_6_28_variables = [
    (nr.pcrum, 0, 1  , "pcrum"),
    (pop.pop,  0, 4e9, "pop"),
    (ag.al,    0, 2e9, "al"),
    (ag.aiph,  0, 50 , "aiph"),
    (pp.ppgr,  0, 2e8, "ppgr"),
]

plotvariables(sol, (t, 1900.0, 1970.0), fig_6_28_variables, name="Fig. 6.28", showlegend=true, showaxis=true, colored=true)


fig_6_29_variables = [
    (pp.ppgr,  0, 2e8, "ppgr"),
    (pp.ppapr, 0, 2e8, "ppapr"),
    (pp.ppasr, 0, 2e8, "ppasr"),
    (pp.ppolx, 0, 1,   "ppolx"),
    (pp.ahl,   0, 2,   "ahl"),
    (pd.lmp,   0, 1,   "lmp"),
    (pd.lfdr,  0, 0.5, "lfdr"),
]

plotvariables(sol, (t, 1900.0, 1970.0), fig_6_29_variables, name="Fig. 6.29", showlegend=true, showaxis=true, colored=true)


fig_6_30_variables = [
    (nr.pcrum, 0, 8,      "pcrum"),
    (pop.pop,  0, 1.6e10, "pop"),
    (ag.al,    0, 4e9,    "al"),
    (ag.aiph,  0, 1.5e3,  "aiph"),
    (pp.ppgr,  0, 8e9,    "ppgr"),
]

plotvariables(sol, (t, 1900.0, 2100.0), fig_6_30_variables, name="Fig. 6.30", showlegend=true, showaxis=true, colored=true)


fig_6_31_variables = [
    (pp.ppgr,  0, 2e9, "ppgr"),
    (pp.ppapr, 0, 2e9, "ppapr"),
    (pp.ppasr, 0, 2e9, "ppasr"),
    (pp.ppolx, 0, 1e2, "ppolx"),
    (pp.ahl,   0, 40,  "ahl"),
    (pd.lmp,   0, 1,   "lmp"),
    (pd.lfdr,  0, 0.5, "lfdr"),
]

plotvariables(sol, (t, 1900.0, 2100.0), fig_6_31_variables, name="Fig. 6.31", showlegend=true, showaxis=true, colored=true)


parameters = copy(WorldDynamics.World3.Pollution.params)
parameters[:imti] = 1
parameters[:amti] = 0.5
parameters[:ppol70] = 4.03e7

system = pollution_historicalrun(params=parameters)
sol_decreased_toxity = WorldDynamics.solve(system, (1900.0, 2100.0))

plotvariables(sol_decreased_toxity, (t, 1900.0, 2100.0), fig_6_31_variables, name="Fig. 6.32", showlegend=true, showaxis=true, colored=true)
