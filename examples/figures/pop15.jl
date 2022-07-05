using WorldDynamics

include("../scenarios/pop15_historicalrun.jl")


sol = pop15_historicalrun()


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

plotvariables(sol, (t, 1900.0, 1970.0), fig_2_84_variables, name="Fig. 2.84", showlegend=true, showaxis=true, colored=true)


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

plotvariables(sol, (t, 1900.0, 1970.0), fig_2_85_variables, name="Fig. 2.85", showlegend=true, showaxis=true, colored=true)


parameters_2_87 = copy(WorldDynamics.World3.Pop15.params)
parameters_2_87[:iphst] = 4000
parameters_2_87[:lt2] = 0

sol_2_87 = pop15_historicalrun(params=parameters_2_87)

plotvariables(sol_2_87, (t, 1900.0, 2100.0), fig_2_84_variables, name="Fig. 2.87", showlegend=true, showaxis=true, colored=true)
