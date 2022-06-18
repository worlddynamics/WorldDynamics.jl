include("../plotvariables.jl")
include("Capital.jl")
include("odesystem.jl")


sol = solvecapital()


@named pop = Capital.population()
@named ag = Capital.agriculture()
@named nr = Capital.non_renewable()

@variables t


fig_3_36_variables = [
    (pop.pop,  0, 5e9,   "pop"),
    (ag.al,    0, 1.5e9, "al"),
    (ag.fioaa, 0, 0.5,   "fioaa"),
    (nr.fcaor, 0, 0.25,  "fcaor"),
    (ag.aiph,  0, 50,    "aiph")
]

plotvariables(sol, t, fig_3_36_variables, name="Fig. 3.36", showlegend=true, showaxis=true, colored=true)
