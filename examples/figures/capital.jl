using WorldDynamics

include("../scenarios/capital_historicalrun.jl")


system = capital_historicalrun()
sol = WorldDynamics.solve(system, (1900, 2100))


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
    (ag.aiph,  0, 50,    "aiph"),
]

plotvariables(sol, (t, 1900, 1970), fig_3_36_variables, name="Fig. 3.36", showlegend=true, showaxis=true, colored=true)


fig_3_37_variables = [
    (is.iopc,  0, 1000, "iopc"),
    (ss.sopc,  0, 1000, "sopc"),
    (is.io,    0, 4e12, "io"),
    (ss.fioas, 0, 0.4, "fioas"),
    (js.cuf,   0, 1, "cuf"),
]

plotvariables(sol, (t, 1900, 2000), fig_3_37_variables, name="Fig. 3.37", showlegend=true, showaxis=true, colored=true)


parameters_3_38 = WorldDynamics.World3.Capital.getparameters()
parameters_3_38[:alic1] = 21

system = capital_historicalrun(params=parameters_3_38)
sol_3_38 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_3_38, (t, 1900, 2000), fig_3_37_variables, name="Fig. 3.38", showlegend=true, showaxis=true, colored=true)


fig_3_41_variables = [
    (is.iopc,  0, 100, "iopc"),
    (ss.sopc,  0, 100, "sopc"),
    (is.io,    0, 400e9, "io"),
    (ss.fioas, 0, 0.4, "fioas"),
    (js.cuf,   0, 1, "cuf"),
]

cap_tables_3_41 = WorldDynamics.World3.Capital.gettables()
cap_tables_3_41[:fcaor] = (0.35, 0.35, 0.35, 0.35, 0.35, 0.35, 0.35, 0.35, 0.35, 0.35, 0.35)

system = capital_historicalrun(tables=cap_tables_3_41)
sol_3_41 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_3_41, (t, 1900, 2000), fig_3_41_variables, name="Fig. 3.41", showlegend=true, showaxis=true, colored=true)
