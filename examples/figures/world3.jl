using WorldDynamics

include("../scenarios/world3_historicalrun.jl")


sol = world3_historicalrun()


@named pop = WorldDynamics.World3.Pop4.population()
@named br = WorldDynamics.World3.Pop4.birth_rate()
@named dr = WorldDynamics.World3.Pop4.death_rate()
@named is = WorldDynamics.World3.Capital.industrial_subsector()
@named ss = WorldDynamics.World3.Capital.service_subsector()
@named ld = WorldDynamics.World3.Agriculture.land_development()
@named nr = WorldDynamics.World3.NonRenewable.non_renewable()
@named pp = WorldDynamics.World3.Pollution.persistent_pollution()
@named se = WorldDynamics.World3.SupplementaryEquations.supplementary_equations()


@variables t


fig_7_2_variables = [
    (pop.pop, 0,    4e9,  "pop"),
    (br.cbr,  0,    50,   "cbr"),
    (dr.cdr,  0,    50,   "cdr"),
    (dr.le,   0,    60,   "le"),
    (dr.lmf,  0.75, 1.75, "lmf"),
    (dr.lmp,  0.75, 1.75, "lmp"),
    (dr.lmhs, 0.75, 1.75, "lmhs"),
    (dr.lmc,  0.75, 1.75, "lmc"),
    (br.tf,   0,    8,    "tf"),
    (br.dtf,  0,    8,    "dtf"),
]

plotvariables(sol, (t, 1900.0, 1970.0), fig_7_2_variables, name="Fig. 7.2", showlegend=true, showaxis=true, colored=true)


fig_7_3_variables = [
    (is.ic,   0, 4e12, "ic"),
    (is.io,   0, 4e12, "io"),
    (is.iopc, 0, 400,  "iopc"),
    (ss.sopc, 0, 400,  "sopc"),
    (se.foa,  0, 1,    "foa"),
    (se.foi,  0, 1,    "foi"),
    (se.fos,  0, 1,    "fos"),
]

plotvariables(sol, (t, 1900.0, 1970.0), fig_7_3_variables, name="Fig. 7.3", showlegend=true, showaxis=true, colored=true)


fig_7_7_variables = [
    (nr.nrfr,  0, 1,    "nrfr"),
    (is.iopc,  0, 1000, "iopc"),
    (ld.fpc,   0, 1000, "fpc"),
    (pop.pop,  0, 16e9, "pop"),
    (pp.ppolx, 0, 32,   "ppolx"),
    (br.cbr,   0, 50,   "cbr"),
    (dr.cdr,   0, 50,   "cdr"),
]

plotvariables(sol, (t, 1900.0, 2100.0), fig_7_7_variables, name="Fig. 7.7", showlegend=true, showaxis=true, colored=true)


nr_parameters_7_10 = copy(WorldDynamics.World3.NonRenewable.params)
nr_parameters_7_10[:nri] = 2e12

sol_7_10 = world3_historicalrun(nonrenewable_params=nr_parameters_7_10)

plotvariables(sol_7_10, (t, 1900.0, 2100.0), fig_7_7_variables, name="Fig. 7.10", showlegend=true, showaxis=true, colored=true)
