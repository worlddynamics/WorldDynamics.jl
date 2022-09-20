using WorldDynamics

include("../scenarios/pop15_historicalrun.jl")


system = pop15_historicalrun()
sol = WorldDynamics.solve(system, (1900, 2100))


@named pop = WorldDynamics.World3.Pop15.population()
@named br = WorldDynamics.World3.Pop15.birth_rate()
@named dr = WorldDynamics.World3.Pop15.death_rate()
@named so = WorldDynamics.World3.Pop15.service_output()
@named io = WorldDynamics.World3.Pop15.industrial_output()
@named f = WorldDynamics.World3.Pop15.food()

@variables t


fig_2_84_variables = [
    (pop.pop, 0,   1.6e10, "pop"),
    (br.cbr,  0,   50,     "cbr"),
    (dr.cdr,  0,   50,     "cdr"),
    (so.sopc, 0,   1000,   "sopc"),
    (dr.fpu,  0,   1,      "fpu"),
    (f.fpc,   0,   1000,   "fpc"),
    (dr.le,   0,   80,     "le"),
    (br.fce,  0.5, 1,      "fce"),
    (io.iopc, 0,   1000,   "iopc"),
]

plotvariables(sol, (t, 1900, 1970), fig_2_84_variables, name="Fig. 2.84c", showlegend=true, showaxis=true, colored=true)


fig_2_85_variables = [
    (pop.pc,   0, 1,   "pc"),
    (pop.pf,   0, 1,   "pf"),
    (pop.pw,   0, 1,   "pw"),
    (pop.pe,   0, 1,   "pe"),
    (dr.lmf,   0, 2,   "lmf"),
    (dr.lmhs,  0, 2,   "lmhs"),
    (dr.lmp,   0, 2,   "lmp"),
    (dr.lmc,   0, 2,   "lmc"),
    (dr.hsapc, 0, 250, "hsapc"),
    (dr.ehspc, 0, 250, "ehspc"),
]

plotvariables(sol, (t, 1900, 1970), fig_2_85_variables, name="Fig. 2.85c", showlegend=true, showaxis=true, colored=true)


fig_2_86_variables = [
    (br.tf,   0, 15,   "tf"),
    (br.mtf,  0, 15,   "mtf"),
    (br.dtf,   0, 15,   "dtf"),
    (br.dcfs,   0, 15,   "dcfs"),
    (br.frsn, 0.6, 1.4, "frsn"),
    (br.sfsn, 0.75, 1.25, "sfsn"),
    (br.cmple, 1, 4, "cmple"),
]

plotvariables(sol, (t, 1900, 1970), fig_2_86_variables, name="Fig. 2.86c", showlegend=true, showaxis=true, colored=true)


parameters_2_87 = WorldDynamics.World3.Pop15.getparameters()
parameters_2_87[:iphst] = 4000
parameters_2_87[:lt2] = 1900

system = pop15_historicalrun(params=parameters_2_87)
sol_2_87 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_87, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.87c", showlegend=true, showaxis=true, colored=true)


parameters_2_88 = WorldDynamics.World3.Pop15.getparameters()
parameters_2_88[:iphst] = 4000
parameters_2_88[:lt2] = 1900
parameters_2_88[:cio] = 1000
parameters_2_88[:cso] = 1500
parameters_2_88[:cfood] = 2500

system = pop15_historicalrun(params=parameters_2_88)
sol_2_88 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_88, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.88c", showlegend=true, showaxis=true, colored=true)


parameters_2_89 = WorldDynamics.World3.Pop15.getparameters()
parameters_2_89[:lt2] = 1900

system = pop15_historicalrun(params=parameters_2_89)
sol_2_89 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_89, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.89c", showlegend=true, showaxis=true, colored=true)


plotvariables(sol, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.90c", showlegend=true, showaxis=true, colored=true)


plotvariables(sol, (t, 1900, 2100), fig_2_85_variables, name="Fig. 2.91c", showlegend=true, showaxis=true, colored=true)


plotvariables(sol, (t, 1900, 2100), fig_2_86_variables, name="Fig. 2.93c", showlegend=true, showaxis=true, colored=true)


parameters_2_96 = WorldDynamics.World3.Pop15.getparameters()
parameters_2_96[:fcest] = 75

system = pop15_historicalrun(params=parameters_2_96)
sol_2_96 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_96, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.96c", showlegend=true, showaxis=true, colored=true)


parameters_2_97 = WorldDynamics.World3.Pop15.getparameters()
parameters_2_97[:fcest] = 75
parameters_2_97[:zpgt] = 75

system = pop15_historicalrun(params=parameters_2_97)
sol_2_97 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_97, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.97c", showlegend=true, showaxis=true, colored=true)


parameters_2_98 = WorldDynamics.World3.Pop15.getparameters()
parameters_2_98[:lt] = 2000

system = pop15_historicalrun(params=parameters_2_98)
sol_2_98 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_98, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.98c", showlegend=true, showaxis=true, colored=true)


parameters_2_99 = WorldDynamics.World3.Pop15.getparameters()
parameters_2_99[:lt] = 2000
parameters_2_99[:fcest] = 75

system = pop15_historicalrun(params=parameters_2_99)
sol_2_99 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_99, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.99c", showlegend=true, showaxis=true, colored=true)


parameters_2_100 = WorldDynamics.World3.Pop15.getparameters()
parameters_2_100[:lt] = 2000
parameters_2_100[:fcest] = 75
parameters_2_100[:zpgt] = 75

system = pop15_historicalrun(params=parameters_2_100)
sol_2_100 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_100, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.100c", showlegend=true, showaxis=true, colored=true)
