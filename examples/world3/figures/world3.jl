using WorldDynamics

include("../scenarios/world3_historicalrun.jl")


system = world3_historicalrun()
sol = WorldDynamics.solve(system, (1900, 2100))


@named pop = World3.Pop4.population()
@named br = World3.Pop4.birth_rate()
@named dr = World3.Pop4.death_rate()
@named is = World3.Capital.industrial_subsector()
@named ss = World3.Capital.service_subsector()
@named ld = World3.Agriculture.land_development()
@named nr = World3.NonRenewable.non_renewable()
@named pp = World3.Pollution.persistent_pollution()
@named se = World3.SupplementaryEquations.supplementary_equations()

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

plotvariables(sol, (t, 1900, 1970), fig_7_2_variables, name="Fig. 7.2", showlegend=true, showaxis=true, colored=true)


fig_7_3_variables = [
    (is.ic,   0, 4e12, "ic"),
    (is.io,   0, 4e12, "io"),
    (is.iopc, 0, 400,  "iopc"),
    (ss.sopc, 0, 400,  "sopc"),
    (se.foa,  0, 1,    "foa"),
    (se.foi,  0, 1,    "foi"),
    (se.fos,  0, 1,    "fos"),
]

plotvariables(sol, (t, 1900, 1970), fig_7_3_variables, name="Fig. 7.3", showlegend=true, showaxis=true, colored=true)


fig_7_7_variables = [
    (nr.nrfr,  0, 1,    "nrfr"),
    (is.iopc,  0, 1000, "iopc"),
    (ld.fpc,   0, 1000, "fpc"),
    (pop.pop,  0, 16e9, "pop"),
    (pp.ppolx, 0, 32,   "ppolx"),
    (br.cbr,   0, 50,   "cbr"),
    (dr.cdr,   0, 50,   "cdr"),
]

plotvariables(sol, (t, 1900, 2100), fig_7_7_variables, name="Fig. 7.7", showlegend=true, showaxis=true, colored=true)


nr_parameters_7_10 = World3.NonRenewable.getparameters()
nr_parameters_7_10[:nri] = 2e12

system = world3_historicalrun(nonrenewable_params=nr_parameters_7_10)
sol_7_10 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_7_10, (t, 1900, 2100), fig_7_7_variables, name="Fig. 7.10", showlegend=true, showaxis=true, colored=true)


nr_parameters_7_11 = World3.NonRenewable.getparameters()
nr_parameters_7_11[:nri] = 1e13

system = world3_historicalrun(nonrenewable_params=nr_parameters_7_11)
sol_7_11 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_7_11, (t, 1900, 2100), fig_7_7_variables, name="Fig. 7.11", showlegend=true, showaxis=true, colored=true)


agr_tables_7_13 = World3.Agriculture.gettables()
agr_tables_7_13[:fioaa1] = (0.5, 0.3, 0.1, 0.0, 0.0, 0.0)
agr_tables_7_13[:fioaa2] = (0.5, 0.3, 0.1, 0.0, 0.0, 0.0)

system = world3_historicalrun(agriculture_tables=agr_tables_7_13)
sol_7_13 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_7_13, (t, 1900, 2100), fig_7_7_variables, name="Fig. 7.13", showlegend=true, showaxis=true, colored=true)
