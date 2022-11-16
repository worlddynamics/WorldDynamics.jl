using Plots
include("./Earth4All.jl")

# The Giant Leap scenario

variables_1 = [
    (GDP_G_dollar_per_y,    0,  400000, "GDP G$/y"),
    (Population_Mp, 0,  10000,  "Population Mp"),
    (AVERAGE_WELLBEING_INDEX_1, 0,  2.4,    "Average Wellbeing Index"),
    (Inequality_1,  0,  1.6,    "Inequality_1"),
    (Observed_warming_deg_C,    0,  4,  "Observed warming deg C"),
    (Social_tension_1,  0,  2,  "Social tension (1)"),
]
plotvariables(solution,(t, 1980, 2100), variables_1; title="1. Main trends - World 1980 to 2100")
