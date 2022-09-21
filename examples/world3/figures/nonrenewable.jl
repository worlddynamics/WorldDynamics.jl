using WorldDynamics

include("../scenarios/nonrenewable_historicalrun.jl")


system = nonrenewable_historicalrun()
sol = WorldDynamics.solve(system, (1900, 2100))


@named nr = WorldDynamics.World3.NonRenewable.non_renewable()
@named ic = WorldDynamics.World3.NonRenewable.industrial_capital()
@named io = WorldDynamics.World3.NonRenewable.industrial_output()
@named pop = WorldDynamics.World3.NonRenewable.population()

@variables t


fig_5_25_variables = [
    (nr.nrfr,  0, 1,     "nrfr"),
    (nr.fcaor, 0, 1,     "fcaor"),
    (ic.ic,    0, 40e12, "ic"),
    (io.io,    0, 10e12, "io"),
    (pop.pop,  0, 16e9,  "pop"),
]

plotvariables(sol, (t, 1900, 2100), fig_5_25_variables, name="Fig. 5.25", showlegend=true, showaxis=true, colored=true)


parameters_5_26 = WorldDynamics.World3.NonRenewable.getparameters()
parameters_5_26[:nri] = 2e12

system = nonrenewable_historicalrun(params=parameters_5_26)
sol_5_26 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_5_26, (t, 1900, 2100), fig_5_25_variables, name="Fig. 5.26", showlegend=true, showaxis=true, colored=true)


tables_5_28 = WorldDynamics.World3.NonRenewable.gettables()
tables_5_28[:fcaor2] = (1.0, 0.3, 0.1, 0.065, 0.06, 0.055, 0.05, 0.05, 0.05, 0.05, 0.05)

system = nonrenewable_historicalrun(tables=tables_5_28)
sol_5_28 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_5_28, (t, 1900, 2100), fig_5_25_variables, name="Fig. 5.28", showlegend=true, showaxis=true, colored=true)


parameters_5_29 = WorldDynamics.World3.NonRenewable.getparameters()
parameters_5_29[:nruf2] = 0.25

system = nonrenewable_historicalrun(params=parameters_5_29)
sol_5_29 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_5_29, (t, 1900, 2100), fig_5_25_variables, name="Fig. 5.29", showlegend=true, showaxis=true, colored=true)


parameters_5_30 = WorldDynamics.World3.NonRenewable.getparameters()
parameters_5_30[:zpgt] = 1975
parameters_5_30[:nruf2] = 0.25

tables_5_30 = WorldDynamics.World3.NonRenewable.gettables()
tables_5_30[:fcaor2] = (1.0, 0.3, 0.1, 0.065, 0.06, 0.055, 0.05, 0.05, 0.05, 0.05, 0.05)

system = nonrenewable_historicalrun(params=parameters_5_30, tables=tables_5_30)
sol_5_30 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_5_30, (t, 1900, 2100), fig_5_25_variables, name="Fig. 5.30", showlegend=true, showaxis=true, colored=true)
