using WorldDynamics

include("../scenarios/capital_historicalrun.jl")


sol = capital_historicalrun()


@named pop = WorldDynamics.World3.Capital.population()
@named ag = WorldDynamics.World3.Capital.agriculture()
@named nr = WorldDynamics.World3.Capital.non_renewable()
@named is = WorldDynamics.World3.Capital.industrial_subsector()
@named ss = WorldDynamics.World3.Capital.service_subsector()
@named js = WorldDynamics.World3.Capital.job_subsector()

@variables t


fig_3_36_variables = [
    (pop.pop,  0, 5e9,   "pop"),
    (ag.al,    0, 1.5e9, "al"),
    (ag.fioaa, 0, 0.5,   "fioaa"),
    (nr.fcaor, 0, 0.25,  "fcaor"),
    (ag.aiph,  0, 50,    "aiph")
]

plotvariables(sol, (t, 1900.0, 1970.0), fig_3_36_variables, name="Fig. 3.36", showlegend=true, showaxis=true, colored=true)


fig_3_37_variables = [
    (is.iopc,  0, 1000, "iopc"),
    (ss.sopc,  0, 1000, "sopc"),
    (is.io,    0, 4e12, "io"),
    (ss.fioas, 0, 0.4, "fioas"),
    (js.cuf,   0, 1, "cuf"),
]

plotvariables(sol, (t, 1900.0, 2000.0), fig_3_37_variables, name="Fig. 3.37", showlegend=true, showaxis=true, colored=true)
