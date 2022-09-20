using WorldDynamics

include("../scenarios/pop4_historicalrun.jl")


system = pop4_historicalrun()
sol = WorldDynamics.solve(system, (1900, 2100))


@named pop = WorldDynamics.World3.Pop4.population()
@named br = WorldDynamics.World3.Pop4.birth_rate()
@named dr = WorldDynamics.World3.Pop4.death_rate()
@named so = WorldDynamics.World3.Pop4.service_output()
@named io = WorldDynamics.World3.Pop4.industrial_output()
@named f = WorldDynamics.World3.Pop4.food()

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

plotvariables(sol, (t, 1900, 1970), fig_2_84_variables, name="Fig. 2.84b", showlegend=true, showaxis=true, colored=true)


fig_2_85_variables = [
    (pop.p1 ./ (pop.p1 + pop.p2 + pop.p3 + pop.p4), 0, 1,   "p1"),
    (pop.p2 ./ (pop.p1 + pop.p2 + pop.p3 + pop.p4), 0, 1,   "p2"),
    (pop.p3 ./ (pop.p1 + pop.p2 + pop.p3 + pop.p4), 0, 1,   "p3"),
    (pop.p4 ./ (pop.p1 + pop.p2 + pop.p3 + pop.p4), 0, 1,   "p4"),
    (dr.lmf,                                        0, 2,   "lmf"),
    (dr.lmhs,                                       0, 2,   "lmhs"),
    (dr.lmp,                                        0, 2,   "lmp"),
    (dr.lmc,                                        0, 2,   "lmc"),
    (dr.hsapc,                                      0, 250, "hsapc"),
    (dr.ehspc,                                      0, 250, "ehspc"),
]

plotvariables(sol, (t, 1900, 1970), fig_2_85_variables, name="Fig. 2.85b", showlegend=true, showaxis=true, colored=true)


fig_2_86_variables = [
    (br.tf,   0, 15,   "tf"),
    (br.mtf,  0, 15,   "mtf"),
    (br.dtf,   0, 15,   "dtf"),
    (br.dcfs,   0, 15,   "dcfs"),
    (br.frsn, 0.6, 1.4, "frsn"),
    (br.sfsn, 0.75, 1.25, "sfsn"),
    (br.cmple, 1, 4, "cmple"),
]

plotvariables(sol, (t, 1900, 1970), fig_2_86_variables, name="Fig. 2.86b", showlegend=true, showaxis=true, colored=true)


parameters_2_87 = WorldDynamics.World3.Pop4.getparameters()
parameters_2_87[:iphst] = 4000
parameters_2_87[:lt2] = 1900

system = pop4_historicalrun(params=parameters_2_87)
sol_2_87 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_87, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.87b", showlegend=true, showaxis=true, colored=true)


parameters_2_88 = WorldDynamics.World3.Pop4.getparameters()
parameters_2_88[:iphst] = 4000
parameters_2_88[:lt2] = 1900
parameters_2_88[:cio] = 1000
parameters_2_88[:cso] = 1500
parameters_2_88[:cfood] = 2500

system = pop4_historicalrun(params=parameters_2_88)
sol_2_88 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_88, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.88b", showlegend=true, showaxis=true, colored=true)


parameters_2_89 = WorldDynamics.World3.Pop4.getparameters()
parameters_2_89[:lt2] = 1900

system = pop4_historicalrun(params=parameters_2_89)
sol_2_89 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_89, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.89b", showlegend=true, showaxis=true, colored=true)
plotvariables(sol, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.90b", showlegend=true, showaxis=true, colored=true)
plotvariables(sol, (t, 1900, 2100), fig_2_85_variables, name="Fig. 2.91b", showlegend=true, showaxis=true, colored=true)
plotvariables(sol, (t, 1900, 2100), fig_2_86_variables, name="Fig. 2.93b", showlegend=true, showaxis=true, colored=true)


parameters_2_96 = WorldDynamics.World3.Pop4.getparameters()
parameters_2_96[:fcest] = 75

system = pop4_historicalrun(params=parameters_2_96)
sol_2_96 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_96, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.96b", showlegend=true, showaxis=true, colored=true)


parameters_2_97 = WorldDynamics.World3.Pop4.getparameters()
parameters_2_97[:fcest] = 75
parameters_2_97[:zpgt] = 75

system = pop4_historicalrun(params=parameters_2_97)
sol_2_97 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_97, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.97b", showlegend=true, showaxis=true, colored=true)


parameters_2_98 = WorldDynamics.World3.Pop4.getparameters()
parameters_2_98[:lt] = 2000

system = pop4_historicalrun(params=parameters_2_98)
sol_2_98 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_98, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.98b", showlegend=true, showaxis=true, colored=true)


parameters_2_99 = WorldDynamics.World3.Pop4.getparameters()
parameters_2_99[:lt] = 2000
parameters_2_99[:fcest] = 75

system = pop4_historicalrun(params=parameters_2_99)
sol_2_99 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_99, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.99b", showlegend=true, showaxis=true, colored=true)


parameters_2_100 = WorldDynamics.World3.Pop4.getparameters()
parameters_2_100[:lt] = 2000
parameters_2_100[:fcest] = 75
parameters_2_100[:zpgt] = 75

system = pop4_historicalrun(params=parameters_2_100)
sol_2_100 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_100, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.100b", showlegend=true, showaxis=true, colored=true)


parameters_2_101 = WorldDynamics.World3.Pop4.getparameters()
parameters_2_101[:lt] = 2000

system = pop4_historicalrun(params=parameters_2_101)
sol_2_101 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_101, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.101a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_2_101, (t, 1900, 2100), fig_2_85_variables, name="Fig. 2.101b", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_2_101, (t, 1900, 2100), fig_2_86_variables, name="Fig. 2.101c", showlegend=true, showaxis=true, colored=true)


parameters_2_102 = WorldDynamics.World3.Pop4.getparameters()
parameters_2_102[:lt] = 2000

tables_2_102 = WorldDynamics.World3.Pop4.gettables()
tables_2_102[:lmft] = (0.0, 1.4, 1.4, 1.4, 1.4, 1.4)

system = pop4_historicalrun(params=parameters_2_102, tables=tables_2_102)
sol_2_102 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_102, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.102a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_2_102, (t, 1900, 2100), fig_2_85_variables, name="Fig. 2.102b", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_2_102, (t, 1900, 2100), fig_2_86_variables, name="Fig. 2.102c", showlegend=true, showaxis=true, colored=true)


parameters_2_104 = WorldDynamics.World3.Pop4.getparameters()
parameters_2_104[:lt] = 2000

tables_2_104 = WorldDynamics.World3.Pop4.gettables()
tables_2_104[:hsapc] = (0.0, 125.0, 250.0, 375.0, 500.0, 625.0, 750.0, 875.0, 1000.0)

system = pop4_historicalrun(params=parameters_2_104, tables=tables_2_104)
sol_2_104 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_104, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.104a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_2_104, (t, 1900, 2100), fig_2_85_variables, name="Fig. 2.104b", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_2_104, (t, 1900, 2100), fig_2_86_variables, name="Fig. 2.104c", showlegend=true, showaxis=true, colored=true)


parameters_2_105 = WorldDynamics.World3.Pop4.getparameters()
parameters_2_105[:lt] = 2000

tables_2_105 = WorldDynamics.World3.Pop4.gettables()
tables_2_105[:cmi] = (0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)

system = pop4_historicalrun(params=parameters_2_105, tables=tables_2_105)
sol_2_105 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_105, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.105a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_2_105, (t, 1900, 2100), fig_2_85_variables, name="Fig. 2.105b", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_2_105, (t, 1900, 2100), fig_2_86_variables, name="Fig. 2.105c", showlegend=true, showaxis=true, colored=true)


parameters_2_106 = WorldDynamics.World3.Pop4.getparameters()
parameters_2_106[:lt] = 2000

tables_2_106 = WorldDynamics.World3.Pop4.gettables()
tables_2_106[:fm] = (1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0)

system = pop4_historicalrun(params=parameters_2_106, tables=tables_2_106)
sol_2_106 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_106, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.106a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_2_106, (t, 1900, 2100), fig_2_85_variables, name="Fig. 2.106b", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_2_106, (t, 1900, 2100), fig_2_86_variables, name="Fig. 2.106c", showlegend=true, showaxis=true, colored=true)


parameters_2_107 = WorldDynamics.World3.Pop4.getparameters()
parameters_2_107[:lt] = 2000

tables_2_107 = WorldDynamics.World3.Pop4.gettables()
tables_2_107[:sfsn] = (1.0, 1.9, 1.7, 1.6, 1.5)

system = pop4_historicalrun(params=parameters_2_107, tables=tables_2_107)
sol_2_107 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_107, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.107a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_2_107, (t, 1900, 2100), fig_2_85_variables, name="Fig. 2.107b", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_2_107, (t, 1900, 2100), fig_2_86_variables, name="Fig. 2.107c", showlegend=true, showaxis=true, colored=true)


parameters_2_108 = WorldDynamics.World3.Pop4.getparameters()
parameters_2_108[:lt] = 2000

tables_2_108 = WorldDynamics.World3.Pop4.gettables()
tables_2_108[:sfsn] = (0.75, 0.75, 0.75, 0.75, 0.75)

system = pop4_historicalrun(params=parameters_2_108, tables=tables_2_108)
sol_2_108 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_108, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.108a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_2_108, (t, 1900, 2100), fig_2_85_variables, name="Fig. 2.108b", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_2_108, (t, 1900, 2100), fig_2_86_variables, name="Fig. 2.108c", showlegend=true, showaxis=true, colored=true)


parameters_2_109 = WorldDynamics.World3.Pop4.getparameters()
parameters_2_109[:lt] = 2000
parameters_2_109[:sad] = 50

system = pop4_historicalrun(params=parameters_2_109)
sol_2_109 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_109, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.109a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_2_109, (t, 1900, 2100), fig_2_85_variables, name="Fig. 2.109b", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_2_109, (t, 1900, 2100), fig_2_86_variables, name="Fig. 2.109c", showlegend=true, showaxis=true, colored=true)


parameters_2_110 = WorldDynamics.World3.Pop4.getparameters()
parameters_2_110[:lt] = 2000

tables_2_110 = WorldDynamics.World3.Pop4.gettables()
tables_2_110[:frsn] = (1.0, 1.0, 1.0, 1.0, 1.0)

system = pop4_historicalrun(params=parameters_2_110, tables=tables_2_110)
sol_2_110 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_110, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.110a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_2_110, (t, 1900, 2100), fig_2_85_variables, name="Fig. 2.110b", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_2_110, (t, 1900, 2100), fig_2_86_variables, name="Fig. 2.110c", showlegend=true, showaxis=true, colored=true)


parameters_2_111 = WorldDynamics.World3.Pop4.getparameters()
parameters_2_111[:lt] = 2000

tables_2_111 = WorldDynamics.World3.Pop4.gettables()
tables_2_111[:cmple] = (5.0, 5.0, 2.5, 1.8, 1.6, 1.4, 1.3, 1.15, 1.1)

system = pop4_historicalrun(params=parameters_2_111, tables=tables_2_111)
sol_2_111 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_111, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.111a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_2_111, (t, 1900, 2100), fig_2_85_variables, name="Fig. 2.111b", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_2_111, (t, 1900, 2100), fig_2_86_variables, name="Fig. 2.111c", showlegend=true, showaxis=true, colored=true)


parameters_2_112 = WorldDynamics.World3.Pop4.getparameters()
parameters_2_112[:lt] = 2000
parameters_2_112[:lpd] = 10

system = pop4_historicalrun(params=parameters_2_112)
sol_2_112 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_112, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.112a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_2_112, (t, 1900, 2100), fig_2_85_variables, name="Fig. 2.112b", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_2_112, (t, 1900, 2100), fig_2_86_variables, name="Fig. 2.112c", showlegend=true, showaxis=true, colored=true)


parameters_2_113 = WorldDynamics.World3.Pop4.getparameters()
parameters_2_113[:lt] = 2000

tables_2_113 = WorldDynamics.World3.Pop4.gettables()
tables_2_113[:fce] = (0.5, 0.7, 0.8, 0.9, 0.95, 0.98, 0.98)

system = pop4_historicalrun(params=parameters_2_113, tables=tables_2_113)
sol_2_113 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_2_113, (t, 1900, 2100), fig_2_84_variables, name="Fig. 2.113a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_2_113, (t, 1900, 2100), fig_2_85_variables, name="Fig. 2.113b", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_2_113, (t, 1900, 2100), fig_2_86_variables, name="Fig. 2.113c", showlegend=true, showaxis=true, colored=true)
