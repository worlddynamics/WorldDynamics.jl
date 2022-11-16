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

variables_3 = [
    (Worker_disposable_income_k_dollar_per_p_per_y, 0,  50, "Worker disposable income k$/p/y"),
    (CO2_emissions_per_person_tCO2_per_y,   0,  6,  "CO2 emissions per person tCO2/y"),
    (Crop_use_per_person_t_crop_per_p_per_y,    0,  1,   "Crop use per person t-crop/p/y"),
    (Cost_of_energy_G_dollar_per_y, 0,  6000,    "Cost of energy G$/y"),
    (Energy_use_per_person_toe_per_p_per_y, 0,  4,   "Energy use per person toe/p/y"),
    (Forestry_land_Mha, 0,   2000, "Forestry land Mha"),
]
plotvariables(solution,(t, 1980, 2100), variables_3; title="3. Consumption  - World 1980 to 2100")
