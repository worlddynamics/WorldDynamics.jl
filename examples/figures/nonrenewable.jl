using WorldDynamics

include("../scenarios/nonrenewable_historicalrun.jl")


sol = nonrenewable_historicalrun()


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

plotvariables(sol, (t, 1900.0, 2100.0), fig_5_25_variables, name="Fig. 5.25", showlegend=true, showaxis=true, colored=true)


parameters_5_26 = copy(WorldDynamics.World3.NonRenewable.params)
parameters_5_26[:nri] = 2e12

sol_5_26 = nonrenewable_historicalrun(params=parameters_5_26)

plotvariables(sol_5_26, (t, 1900.0, 2100.0), fig_5_25_variables, name="Fig. 5.26", showlegend=true, showaxis=true, colored=true)


parameters_5_29 = copy(WorldDynamics.World3.NonRenewable.params)
parameters_5_29[:nruf2] = 0.25

sol_5_29 = nonrenewable_historicalrun(params=parameters_5_29)

plotvariables(sol_5_29, (t, 1900.0, 2100.0), fig_5_25_variables, name="Fig. 5.29", showlegend=true, showaxis=true, colored=true)
