using WorldDynamics

include("../solutions/solvecapital.jl")


sol = solvecapital()


@named pop = WorldDynamics.World3.Capital.population()
@named ag = WorldDynamics.World3.Capital.agriculture()
@named nr = WorldDynamics.World3.Capital.non_renewable()

@variables t


fig_3_36_variables = [
    (pop.pop,  0, 5e9,   "pop"),
    (ag.al,    0, 1.5e9, "al"),
    (ag.fioaa, 0, 0.5,   "fioaa"),
    (nr.fcaor, 0, 0.25,  "fcaor"),
    (ag.aiph,  0, 50,    "aiph")
]

plotvariables(sol, (t, 1900.0, 1970.0), fig_3_36_variables, name="Fig. 3.36", showlegend=true, showaxis=true, colored=true)
