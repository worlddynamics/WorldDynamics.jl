include("../plotvariables.jl")
include("NonRenewable.jl")
include("odesystem.jl")


sol = solvenonrenewable()


@named nr = NonRenewable.non_renewable()
@named ic = NonRenewable.industrial_capital()
@named io = NonRenewable.industrial_output()
@named pop = NonRenewable.population()

@variables t


fig_5_25_variables = [
    (nr.nrfr,  0, 1,     "nrfr"), 
    (nr.fcaor, 0, 1,     "fcaor"), 
    (ic.ic,    0, 40e12, "ic"), 
    (io.io,    0, 10e12, "io"), 
    (pop.pop,  0, 16e9,  "pop")
]

plotvariables(sol, t, fig_5_25_variables, name="Fig. 5.25", showlegend=true, showaxis=true, colored=true)
