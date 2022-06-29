using WorldDynamics

include("../solutions/solvenonrenewable.jl")


sol = solvenonrenewable()


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
    (pop.pop,  0, 16e9,  "pop")
]

plotvariables(sol, (t, 1900.0, 2100.0), fig_5_25_variables, name="Fig. 5.25", showlegend=true, showaxis=true, colored=true)
