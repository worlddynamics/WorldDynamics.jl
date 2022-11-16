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

variables_2 = [
    (Population_below_15_k_dollar_per_p_per_y_Mp,   0,  10000,  "Population below 15 k$/p/y Mp"),
    (ENERGY_USE_Mtoe_per_y, 0,  20000,  "ENERGY USE Mtoe/y"),
    (Crop_use_Mt_per_y, 0,   8000, "Crop use Mt/y"),
    (Fertilizer_use_Mt_per_y,   0,  200,    "Fertilizer use Mt/y"),
    (GHG_EMISSIONS_GtCO2e_per_y,    0, 60, "GHG EMISSIONS GtCO2e/y"),
    (Govmnt_gross_income_as_share_of_NI,    0,  0.4,    "Govmnt gross income (as share of NI)"),
]
plotvariables(solution,(t, 1980, 2100), variables_2; title="2. Human footprint - World 1980 to 2020")
