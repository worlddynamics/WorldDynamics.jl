using WorldDynamics

include("../scenarios/pop1_historicalrun.jl")


system = pop1_historicalrun()
sol = WorldDynamics.solve(system, (1900, 2100))


@named pop = WorldDynamics.World3.Pop1.population()
@named br = WorldDynamics.World3.Pop1.birth_rate()
@named dr = WorldDynamics.World3.Pop1.death_rate()
@named so = WorldDynamics.World3.Pop1.service_output()
@named io = WorldDynamics.World3.Pop1.industrial_output()
@named f = WorldDynamics.World3.Pop1.food()

@variables t


fig_2_84_variables = [
    (so.sopc, 0,   1000,   "sopc"),
    (io.iopc, 0,   1000,   "iopc"),
    (f.fpc,   0,   1000,   "fpc"),
    (pop.pop, 0,   1.6e10, "pop"),
    (br.cbr,  0,   50,     "cbr"),
    (dr.cdr,  0,   50,     "cdr"),
    (dr.le,   0,   80,     "le"),
    (dr.fpu,  0,   1,      "fpu"),
    (br.fce,  0.5, 1,      "fce"),
]

plotvariables(sol, (t, 1900, 1970), fig_2_84_variables, name="Fig. 2.84a", showlegend=true, showaxis=true, colored=true)


fig_2_85_variables = [
    (dr.lmf,   0, 2,   "lmf"),
    (dr.lmhs,  0, 2,   "lmhs"),
    (dr.lmp,   0, 2,   "lmp"),
    (dr.lmc,   0, 2,   "lmc"),
    (dr.hsapc, 0, 250, "hsapc"),
    (dr.ehspc, 0, 250, "ehspc"),
]

plotvariables(sol, (t, 1900, 1970), fig_2_85_variables, name="Fig. 2.85a", showlegend=true, showaxis=true, colored=true)


fig_2_86_variables = [
    (br.tf,   0, 15,   "tf"),
    (br.mtf,  0, 15,   "mtf"),
    (br.dtf,   0, 15,   "dtf"),
    (br.dcfs,   0, 15,   "dcfs"),
    (br.frsn, 0.6, 1.4, "frsn"),
    (br.sfsn, 0.75, 1.25, "sfsn"),
    (br.cmple, 1, 4, "cmple"),
]

plotvariables(sol, (t, 1900, 1970), fig_2_86_variables, name="Fig. 2.86a", showlegend=true, showaxis=true, colored=true)


parameters_2_87 = WorldDynamics.World3.Pop1.getparameters()
parameters_2_87[:iphst] = 4000
parameters_2_87[:lt2] = 1900

system = pop1_historicalrun(params=parameters_2_87)
sol_2_87 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_87, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.87a", showlegend=true, showaxis=true, colored=true)


parameters_2_88 = WorldDynamics.World3.Pop1.getparameters()
parameters_2_88[:iphst] = 4000
parameters_2_88[:lt2] = 1900
parameters_2_88[:cio] = 1000
parameters_2_88[:cso] = 1500
parameters_2_88[:cfood] = 2500

system = pop1_historicalrun(params=parameters_2_88)
sol_2_88 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_88, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.88a", showlegend=true, showaxis=true, colored=true)


parameters_2_89 = WorldDynamics.World3.Pop1.getparameters()
parameters_2_89[:lt2] = 1900

system = pop1_historicalrun(params=parameters_2_89)
sol_2_89 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_89, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.89a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.90a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol, (t, 1900, 2100), fig_2_85_variables, name="Fig. 2.91a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol, (t, 1900, 2100), fig_2_86_variables, name="Fig. 2.93a", showlegend=true, showaxis=true, colored=true)


parameters_2_96 = WorldDynamics.World3.Pop1.getparameters()
parameters_2_96[:fcest] = 75

system = pop1_historicalrun(params=parameters_2_96)
sol_2_96 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_96, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.96a", showlegend=true, showaxis=true, colored=true)


parameters_2_97 = WorldDynamics.World3.Pop1.getparameters()
parameters_2_97[:fcest] = 75
parameters_2_97[:zpgt] = 75

system = pop1_historicalrun(params=parameters_2_97)
sol_2_97 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_97, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.97a", showlegend=true, showaxis=true, colored=true)


parameters_2_98 = WorldDynamics.World3.Pop1.getparameters()
parameters_2_98[:lt] = 2000

system = pop1_historicalrun(params=parameters_2_98)
sol_2_98 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_98, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.98a", showlegend=true, showaxis=true, colored=true)


parameters_2_99 = WorldDynamics.World3.Pop1.getparameters()
parameters_2_99[:lt] = 2000
parameters_2_99[:fcest] = 75

system = pop1_historicalrun(params=parameters_2_99)
sol_2_99 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_99, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.99a", showlegend=true, showaxis=true, colored=true)


parameters_2_100 = WorldDynamics.World3.Pop1.getparameters()
parameters_2_100[:lt] = 2000
parameters_2_100[:fcest] = 75
parameters_2_100[:zpgt] = 75

system = pop1_historicalrun(params=parameters_2_100)
sol_2_100 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_100, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.100a", showlegend=true, showaxis=true, colored=true)


parameters_2_103 = WorldDynamics.World3.Pop1.getparameters()
parameters_2_103[:lt] = 2000

tables_2_103 = WorldDynamics.World3.Pop1.gettables()
tables_2_103[:lmhs2] = (1.0, 1.5, 1.8, 2.0, 2.2, 2.35)

system = pop1_historicalrun(params=parameters_2_103, tables=tables_2_103)
sol_2_103 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_103, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.103a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_2_103, (t, 1900, 2100), fig_2_85_variables, name="Fig. 2.103b", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_2_103, (t, 1900, 2100), fig_2_86_variables, name="Fig. 2.103c", showlegend=true, showaxis=true, colored=true)
