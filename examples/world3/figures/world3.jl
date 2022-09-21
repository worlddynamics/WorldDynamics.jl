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
@named ai = World3.Agriculture.agricultural_inputs()
@named lfd = World3.Agriculture.land_fertility_degradation()

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


fig_7_4_variables = [
    (ld.f, 0, 2e12, "f"),
    (ld.fpc, 0, 800, "fpc"),
    (ld.al, 0, 1.6e9, "al"),
    (ai.ly, 0, 2000, "ly"),
    (ai.aiph, 0, 80, "aiph"),
    (lfd.lfert, 0, 800, "lfert")
]

plotvariables(sol, (t, 1900, 1970), fig_7_4_variables, name="Fig. 7.4", showlegend=true, showaxis=true, colored=true)


fig_7_5_variables = [
    (nr.nrur, 0, 4e9, "nrur"),
    (nr.nrfr, 0, 1, "nrfr"),
    (nr.fcaor, 0, 1, "fcaor"),
    (nr.pcrum, 0, 1, "pcrum"),
]

plotvariables(sol, (t, 1900, 1970), fig_7_5_variables, name="Fig. 7.5", showlegend=true, showaxis=true, colored=true)


fig_7_6_variables = [
    (pp.ppgio, 0, 2e8, "ppgio"),
    (pp.ppgao, 0, 2e8, "ppgao"),
    (pp.ppgr, 0, 2e8, "ppgr"),
    (pp.ppapr, 0, 2e8, "ppapr"),
    (pp.ppolx, 0, 1, "ppolx"),
    (pp.ahl, 0, 4, "ahl"),
    (dr.lmp, 0, 4, "lmp"),
]

plotvariables(sol, (t, 1900, 1970), fig_7_6_variables, name="Fig. 7.6", showlegend=true, showaxis=true, colored=true)


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


fig_7_8_variables = [
    (nr.fcaor, 0, 1, "fcaor"),
    (is.io, 0, 4e12, "io"),
    (ld.tai, 0, 4e12, "tai"),
    (ai.aiph, 0, 200, "aiph"),
    (ld.fioaa, 0, 0.2, "fioaa"),
]

plotvariables(sol, (t, 1900, 2100), fig_7_8_variables, name="Fig. 7.8", showlegend=true, showaxis=true, colored=true)


fig_7_9_variables = [
    (ai.ly, 0, 4000, "ly"),
    (ld.al, 0, 4e9, "al"),
    (ld.fpc, 0, 800, "fpc"),
    (dr.lmf, 0, 1.6, "lmf"),
    (pop.pop, 0, 16e9, "pop"),
]

plotvariables(sol, (t, 1900, 2100), fig_7_9_variables, name="Fig. 7.9", showlegend=true, showaxis=true, colored=true)


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


cap_parameters_7_14 = World3.Capital.getparameters()
cap_parameters_7_14[:alic1] = 21
cap_parameters_7_14[:alic2] = 21

system = world3_historicalrun(capital_params=cap_parameters_7_14)
sol_7_14 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_7_14, (t, 1900, 2100), fig_7_7_variables, name="Fig. 7.14", showlegend=true, showaxis=true, colored=true)


cap_parameters_7_15 = World3.Capital.getparameters()
cap_parameters_7_15[:alic1] = 21
cap_parameters_7_15[:alic2] = 21
cap_parameters_7_15[:icor1] = 3.75
cap_parameters_7_15[:icor2] = 3.75

system = world3_historicalrun(capital_params=cap_parameters_7_15)
sol_7_15 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_7_15, (t, 1900, 2100), fig_7_7_variables, name="Fig. 7.15", showlegend=true, showaxis=true, colored=true)


nr_tables_7_16 = World3.NonRenewable.gettables()
nr_tables_7_16[:fcaor2] = (1.0, 0.2, 0.1, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05)

system = world3_historicalrun(nonrenewable_tables=nr_tables_7_16)
sol_7_16 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_7_16, (t, 1900, 2100), fig_7_7_variables, name="Fig. 7.16", showlegend=true, showaxis=true, colored=true)


nr_parameters_7_18 = World3.NonRenewable.getparameters()
nr_parameters_7_18[:nruf2] = 0.125 

nr_tables_7_18 = World3.NonRenewable.gettables()
nr_tables_7_18[:fcaor2] = (1.0, 0.2, 0.1, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05)

system = world3_historicalrun(nonrenewable_params= nr_parameters_7_18, nonrenewable_tables=nr_tables_7_18)
sol_7_18 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_7_18, (t, 1900, 2100), fig_7_7_variables, name="Fig. 7.18", showlegend=true, showaxis=true, colored=true)


nr_parameters_7_19 = World3.NonRenewable.getparameters()
nr_parameters_7_19[:nruf2] = 0.125 

nr_tables_7_19 = World3.NonRenewable.gettables()
nr_tables_7_19[:fcaor2] = (1.0, 0.2, 0.1, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05)

agr_tables_7_19 = World3.Agriculture.gettables()
agr_tables_7_19[:lymap2] = (1.0, 1.0, 0.98, 0.95)

system = world3_historicalrun(nonrenewable_params= nr_parameters_7_19, nonrenewable_tables=nr_tables_7_19, agriculture_tables=agr_tables_7_19)
sol_7_19 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_7_19, (t, 1900, 2100), fig_7_7_variables, name="Fig. 7.19", showlegend=true, showaxis=true, colored=true)


fig_7_20_variables = [
    (nr.nrfr,  0, 1,    "nrfr"),
    (is.iopc,  0, 2000, "iopc"),
    (ld.fpc,   0, 1000, "fpc"),
    (pop.pop,  0, 16e9, "pop"),
    (pp.ppolx, 0, 32,   "ppolx"),
    (br.cbr,   0, 50,   "cbr"),
    (dr.cdr,   0, 50,   "cdr"),
]

nr_parameters_7_20 = World3.NonRenewable.getparameters()
nr_parameters_7_20[:nruf2] = 0.125 

pol_parameters_7_20 = World3.Pollution.getparameters()
pol_parameters_7_20[:ppgf21] = 0.1

nr_tables_7_20 = World3.NonRenewable.gettables()
nr_tables_7_20[:fcaor2] = (1.0, 0.2, 0.1, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05)

agr_tables_7_20 = World3.Agriculture.gettables()
agr_tables_7_20[:lymap2] = (1.0, 1.0, 0.98, 0.95)

system = world3_historicalrun(nonrenewable_params=nr_parameters_7_20, pollution_params=pol_parameters_7_20, nonrenewable_tables=nr_tables_7_20, agriculture_tables=agr_tables_7_20)
sol_7_20 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_7_20, (t, 1900, 2100), fig_7_20_variables, name="Fig. 7.20", showlegend=true, showaxis=true, colored=true)


agr_parameters_7_21 = World3.Agriculture.getparameters()
agr_parameters_7_21[:lyf2] = 2

system = world3_historicalrun(nonrenewable_params=nr_parameters_7_20, pollution_params=pol_parameters_7_20, agriculture_params=agr_parameters_7_21, nonrenewable_tables=nr_tables_7_20, agriculture_tables=agr_tables_7_20)
sol_7_21 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_7_21, (t, 1900, 2100), fig_7_20_variables, name="Fig. 7.21", showlegend=true, showaxis=true, colored=true)


fig_7_22_variables = [
    (nr.nrfr,  0, 1,    "nrfr"),
    (is.iopc,  0, 8000, "iopc"),
    (ld.fpc,   0, 1000, "fpc"),
    (pop.pop,  0, 16e9, "pop"),
    (pp.ppolx, 0, 32,   "ppolx"),
    (br.cbr,   0, 50,   "cbr"),
    (dr.cdr,   0, 50,   "cdr"),
]


agr_tables_7_20[:llmy2] = (1.2, 1.0, 0.9, 0.8, 0.75, 0.7, 0.67, 0.64, 0.62, 0.6)

system = world3_historicalrun(nonrenewable_params=nr_parameters_7_20, pollution_params=pol_parameters_7_20, agriculture_params=agr_parameters_7_21, nonrenewable_tables=nr_tables_7_20, agriculture_tables=agr_tables_7_20)
sol_7_22 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_7_22, (t, 1900, 2100), fig_7_22_variables, name="Fig. 7.22", showlegend=true, showaxis=true, colored=true)


pop_parameters_7_34 = World3.Pop4.getparameters()
pop_parameters_7_34[:zpgt] = 1975

system = world3_historicalrun(pop_params=pop_parameters_7_34)
sol_7_34 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_7_34, (t, 1900, 2100), fig_7_7_variables, name="Fig. 7.34", showlegend=true, showaxis=true, colored=true)


cap_parameters_7_35 = World3.Capital.getparameters()
cap_parameters_7_35[:alic1] = 21
cap_parameters_7_35[:alsc2] = 30

system = world3_historicalrun(capital_params=cap_parameters_7_35)
sol_7_35 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_7_35, (t, 1900, 2100), fig_7_7_variables, name="Fig. 7.35", showlegend=true, showaxis=true, colored=true)


cap_tables_7_36 = World3.Capital.gettables()
cap_tables_7_36[:isopc2] = (60, 450, 960, 1500, 1830, 2175, 2475, 2700, 3000)

agr_tables_7_36 = World3.Agriculture.gettables()
agr_tables_7_36[:ifpc2] = (345, 720, 1035, 1275, 1455, 1605, 1725, 1815, 1875)

system = world3_historicalrun(capital_tables=cap_tables_7_36, agriculture_tables=agr_tables_7_36)
sol_7_36 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_7_36, (t, 1900, 2100), fig_7_7_variables, name="Fig. 7.36", showlegend=true, showaxis=true, colored=true)


pop_parameters_7_37 = World3.Pop4.getparameters()
pop_parameters_7_37[:zpgt] = 1975

system = world3_historicalrun(pop_params=pop_parameters_7_37, capital_tables=cap_tables_7_36, agriculture_tables=agr_tables_7_36)
sol_7_37 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_7_37, (t, 1900, 2100), fig_7_7_variables, name="Fig. 7.37", showlegend=true, showaxis=true, colored=true)


cap_parameters_7_38 = World3.Capital.getparameters()
cap_parameters_7_38[:iet] = 1990
cap_parameters_7_38[:iopcd] = 320
cap_parameters_7_38[:alic2] = 21
cap_parameters_7_38[:alsc2] = 30

nr_parameters_7_38 = World3.NonRenewable.getparameters()
nr_parameters_7_38[:nruf2] = 0.125

pol_parameters_7_38 = World3.Pollution.getparameters()
pol_parameters_7_38[:ppgf21] = 0.25

system = world3_historicalrun(pop_params=pop_parameters_7_37, capital_params=cap_parameters_7_38, nonrenewable_params=nr_parameters_7_38, pollution_params=pol_parameters_7_38, capital_tables=cap_tables_7_36, agriculture_tables=agr_tables_7_36)
sol_7_38 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_7_38, (t, 1900, 2100), fig_7_7_variables, name="Fig. 7.38", showlegend=true, showaxis=true, colored=true)