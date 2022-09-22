using WorldDynamics

include("../scenarios/pollution_historicalrun.jl")


system = pollution_historicalrun()
sol = WorldDynamics.solve(system, (1900, 2100))


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

plotvariables(sol, (t, 1900, 1970), fig_6_28_variables, name="Fig. 6.28", showlegend=true, showaxis=true, colored=true)


fig_6_29_variables = [
    (pp.ppgr,  0, 2e8, "ppgr"),
    (pp.ppapr, 0, 2e8, "ppapr"),
    (pp.ppasr, 0, 2e8, "ppasr"),
    (pp.ppolx, 0, 1,   "ppolx"),
    (pp.ahl,   0, 2,   "ahl"),
    (pd.lmp,   0, 1,   "lmp"),
    (pd.lfdr,  0, 0.5, "lfdr"),
]

plotvariables(sol, (t, 1900, 1970), fig_6_29_variables, name="Fig. 6.29", showlegend=true, showaxis=true, colored=true)


fig_6_30_variables = [
    (nr.pcrum, 0, 8,      "pcrum"),
    (pop.pop,  0, 1.6e10, "pop"),
    (ag.al,    0, 4e9,    "al"),
    (ag.aiph,  0, 1.5e3,  "aiph"),
    (pp.ppgr,  0, 8e9,    "ppgr"),
]

plotvariables(sol, (t, 1900, 2100), fig_6_30_variables, name="Fig. 6.30", showlegend=true, showaxis=true, colored=true)


fig_6_31_variables = [
    (pp.ppgr,  0, 2e9, "ppgr"),
    (pp.ppapr, 0, 2e9, "ppapr"),
    (pp.ppasr, 0, 2e9, "ppasr"),
    (pp.ppolx, 0, 1e2, "ppolx"),
    (pp.ahl,   0, 40,  "ahl"),
    (pd.lmp,   0, 1,   "lmp"),
    (pd.lfdr,  0, 0.5, "lfdr"),
]

plotvariables(sol, (t, 1900, 2100), fig_6_31_variables, name="Fig. 6.31", showlegend=true, showaxis=true, colored=true)


parameters_6_32 = WorldDynamics.World3.Pollution.getparameters()
parameters_6_32[:imti] = 1
parameters_6_32[:amti] = 0.5
parameters_6_32[:ppol70] = 4.03e7

system = pollution_historicalrun(params=parameters_6_32)
sol_6_32 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_6_32, (t, 1900, 2100), fig_6_31_variables, name="Fig. 6.32", showlegend=true, showaxis=true, colored=true)


parameters_6_33 = WorldDynamics.World3.Pollution.getparameters()
parameters_6_33[:pptd1] = 40
parameters_6_33[:pptd2] = 40
parameters_6_33[:ppol70] = 8.19e7

system = pollution_historicalrun(params=parameters_6_33)
sol_6_33 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_6_33, (t, 1900, 2100), fig_6_31_variables, name="Fig. 6.33", showlegend=true, showaxis=true, colored=true)


parameters_6_34 = WorldDynamics.World3.Pollution.getparameters()
parameters_6_34[:pptd1] = 10
parameters_6_34[:pptd2] = 10
parameters_6_34[:ppol70] = 1.9e8

system = pollution_historicalrun(params=parameters_6_34)
sol_6_34 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_6_34, (t, 1900, 2100), fig_6_31_variables, name="Fig. 6.34", showlegend=true, showaxis=true, colored=true)


tables_6_35 = World3.Pollution.gettables()
tables_6_35[:ahlm] = (1, 21, 41, 61, 81)

system = pollution_historicalrun(tables=tables_6_35)
sol_6_35 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_6_35, (t, 1900, 2100), fig_6_31_variables, name="Fig. 6.35", showlegend=true, showaxis=true, colored=true)


tables_6_36 = World3.Pollution.gettables()
tables_6_36[:ahlm] = (1, 1, 1, 1, 1)

system = pollution_historicalrun(tables=tables_6_36)
sol_6_36 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_6_36, (t, 1900, 2100), fig_6_31_variables, name="Fig. 6.36", showlegend=true, showaxis=true, colored=true)


parameters_6_37 = WorldDynamics.World3.Pollution.getparameters()
parameters_6_37[:pptd2] = 40

system = pollution_historicalrun(params=parameters_6_37)
sol_6_37 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_6_37, (t, 1900, 2100), fig_6_31_variables, name="Fig. 6.37", showlegend=true, showaxis=true, colored=true)


tables_6_38 = World3.Pollution.gettables()
tables_6_38[:ahlm] = (1, 6, 11, 16, 21)

system = pollution_historicalrun(tables=tables_6_38)
sol_6_38 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_6_38, (t, 1900, 2100), fig_6_31_variables, name="Fig. 6.38", showlegend=true, showaxis=true, colored=true)


tables_6_39 = World3.Pollution.gettables()
tables_6_39[:lmp2] = (1, 1, 0.99, 0.98, 0.95, 0.92, 0.88, 0.82, 0.77, 0.70, 0.60)
tables_6_39[:lfdr2] = (0, 0.05, 0.15, 0.25)

system = pollution_historicalrun(tables=tables_6_39)
sol_6_39 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_6_39, (t, 1900, 2100), fig_6_31_variables, name="Fig. 6.39", showlegend=true, showaxis=true, colored=true)


parameters_6_40 = WorldDynamics.World3.Pollution.getparameters()
parameters_6_40[:ppgf21] = 0.2

system = pollution_historicalrun(params=parameters_6_40)
sol_6_40 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_6_40, (t, 1900, 2100), fig_6_31_variables, name="Fig. 6.40", showlegend=true, showaxis=true, colored=true)


parameters_6_41 = WorldDynamics.World3.Pollution.getparameters()
parameters_6_41[:swat] = 1

system = pollution_historicalrun(params=parameters_6_41)
sol_6_41 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_6_41, (t, 1900, 2100), fig_6_31_variables, name="Fig. 6.41", showlegend=true, showaxis=true, colored=true)


parameters_6_43 = WorldDynamics.World3.Pollution.getparameters()
parameters_6_43[:swat] = 1
parameters_6_43[:pptd1] = 2
parameters_6_43[:pptd2] = 2

system = pollution_historicalrun(params=parameters_6_43)
sol_6_43 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_6_43, (t, 1900, 2100), fig_6_31_variables, name="Fig. 6.43", showlegend=true, showaxis=true, colored=true)


tables_6_44 = World3.Pollution.gettables()
tables_6_44[:pcrum] = (17, 30, 52, 79, 138, 280, 280, 280, 280, 280, 280)
tables_6_44[:pop] = (16, 19, 22, 31, 42, 53, 53, 53, 53, 53, 53)
tables_6_44[:aiph] = (6.6, 11, 20, 34, 51, 97, 97, 97, 97, 97, 97)
tables_6_44[:al] = (9, 10, 11, 13, 16, 20, 20, 20, 20, 20, 20)

system = pollution_historicalrun(tables=tables_6_44)
sol_6_44 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_6_44, (t, 1900, 2100), fig_6_31_variables, name="Fig. 6.44", showlegend=true, showaxis=true, colored=true)


tables_6_45 = World3.Pollution.gettables()
tables_6_45[:pcrum] = (17, 30, 52, 78, 138, 280, 480, 480, 480, 480, 480)
tables_6_45[:pop] = (16, 19, 22, 31, 42, 53, 67, 67, 67, 67, 67)
tables_6_45[:aiph] = (6.6, 11, 20, 34, 51, 97, 168, 168, 168, 168, 168)
tables_6_45[:al] = (9, 10, 11, 13, 16, 20, 24, 24, 24, 24, 24)

system = pollution_historicalrun(tables=tables_6_45)
sol_6_45 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_6_45, (t, 1900, 2100), fig_6_31_variables, name="Fig. 6.45", showlegend=true, showaxis=true, colored=true)


parameters_6_46 = WorldDynamics.World3.Pollution.getparameters()
parameters_6_46[:swat] = 1

tables_6_46 = World3.Pollution.gettables()
tables_6_46[:pcrum] = (17, 30, 52, 78, 138, 280, 480, 480, 480, 480, 480)
tables_6_46[:pop] = (16, 19, 22, 31, 42, 53, 67, 67, 67, 67, 67)
tables_6_46[:aiph] = (6.6, 11, 20, 34, 57, 97, 168, 168, 168, 168, 168)
tables_6_46[:al] = (9, 10, 11, 13, 16, 20, 24, 24, 24, 24, 24)

system = pollution_historicalrun(params=parameters_6_46, tables=tables_6_46)
sol_6_46 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_6_46, (t, 1900, 2100), fig_6_31_variables, name="Fig. 6.46", showlegend=true, showaxis=true, colored=true)
