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


parameters_3_39 = WorldDynamics.World3.Capital.getparameters()
parameters_3_39[:icor1] = 2

system = capital_historicalrun(params=parameters_3_39)
sol_3_39 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_3_39, (t, 1900, 2000), fig_3_37_variables, name="Fig. 3.39", showlegend=true, showaxis=true, colored=true)


fig_3_40_variables = [
    (is.iopc,  0, 100, "iopc"),
    (ss.sopc,  0, 100, "sopc"),
    (is.io,    0, 400e9, "io"),
    (ss.fioas, 0, 0.4, "fioas"),
    (js.cuf,   0, 1, "cuf"),
]

parameters_3_40 = WorldDynamics.World3.Capital.getparameters()
parameters_3_40[:icor1] = 4

system = capital_historicalrun(params=parameters_3_40)
sol_3_40 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_3_40, (t, 1900, 2000), fig_3_40_variables, name="Fig. 3.40", showlegend=true, showaxis=true, colored=true)


cap_tables_3_41 = WorldDynamics.World3.Capital.gettables()
cap_tables_3_41[:fcaor] = (0.35, 0.35, 0.35, 0.35, 0.35, 0.35, 0.35, 0.35, 0.35, 0.35, 0.35)

system = capital_historicalrun(tables=cap_tables_3_41)
sol_3_41 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_3_41, (t, 1900, 2000), fig_3_40_variables, name="Fig. 3.41", showlegend=true, showaxis=true, colored=true)


parameters_3_42 = WorldDynamics.World3.Capital.getparameters()
parameters_3_42[:scor1] = 2

system = capital_historicalrun(params=parameters_3_42)
sol_3_42 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_3_42, (t, 1900, 2000), fig_3_37_variables, name="Fig. 3.42", showlegend=true, showaxis=true, colored=true)


fig_3_43_variables = [
    (pop.pop,  0, 5e9, "pop"),
    (nr.fcaor,  0, 1, "fcaor"),
    (ag.fioaa,    0, 0.5, "fioaa"),
]

cap_tables_3_43 = WorldDynamics.World3.Capital.gettables()
cap_tables_3_43[:fcaor] = (0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.4, 0.6, 0.8)

system = capital_historicalrun(tables=cap_tables_3_43)
sol_3_43 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_3_43, (t, 1900, 2000), fig_3_43_variables, name="Fig. 3.43", showlegend=true, showaxis=true, colored=true)


cap_tables_3_44 = WorldDynamics.World3.Capital.gettables()
cap_tables_3_44[:fcaor] = (0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.4, 0.6, 0.8)

system = capital_historicalrun(tables=cap_tables_3_44)
sol_3_44 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_3_44, (t, 1900, 2000), fig_3_37_variables, name="Fig. 3.44", showlegend=true, showaxis=true, colored=true)


fig_3_45_variables = [
    (pop.pop,  0, 5e9, "pop"),
    (nr.fcaor,  0, 0.25, "fcaor"),
    (ag.fioaa,    0, 0.5, "fioaa"),
]

cap_tables_3_45 = WorldDynamics.World3.Capital.gettables()
cap_tables_3_45[:fioaa] = (0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.3, 0.3, 0.3)

system = capital_historicalrun(tables=cap_tables_3_45)
sol_3_45 = WorldDynamics.solve(system, (1900, 2100))
plotvariables(sol_3_45, (t, 1900, 2000), fig_3_45_variables, name="Fig. 3.45", showlegend=true, showaxis=true, colored=true)

cap_tables_3_46 = WorldDynamics.World3.Capital.gettables()
cap_tables_3_46[:fcaor] = (0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.3, 0.3, 0.3)

system = capital_historicalrun(tables=cap_tables_3_46)
sol_3_46 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_3_46, (t, 1900, 2000), fig_3_37_variables, name="Fig. 3.46", showlegend=true, showaxis=true, colored=true)


cap_tables_3_47 = WorldDynamics.World3.Capital.gettables()
cap_tables_3_47[:pop] = (1.65, 1.73, 1.8, 2.1, 2.3, 2.55, 3, 3.65, 2, 0.5, 0.2)

system = capital_historicalrun(tables=cap_tables_3_47)
sol_3_47 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_3_47, (t, 1900, 2000), fig_3_45_variables, name="Fig. 3.47", showlegend=true, showaxis=true, colored=true)


cap_tables_3_48 = WorldDynamics.World3.Capital.gettables()
cap_tables_3_48[:pop] = (1.65, 1.73, 1.8, 2.1, 2.3, 2.55, 3, 3.65, 2, 0.5, 0.2)

system = capital_historicalrun(tables=cap_tables_3_48)
sol_3_48 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_3_48, (t, 1900, 2000), fig_3_37_variables, name="Fig. 3.48", showlegend=true, showaxis=true, colored=true)
