using Plots
include("./Earth4All.jl")

variables_hf = [
    (GDP_per_person_k_dollar_per_p_per_y,    0, 50,  "GDP per person"),
    (GDP_G_dollar_per_y,    0, 400000, "GDP"),
    (Cropland_Mha,    0, 2000, " Cropland"),
    (Fertilizer_use_Mt_per_y, 0, 200,   "Fertilizer use"),
    (GHG_EMISSIONS_GtCO2e_per_y, 0, 60,   "GHG emissions"),
    (Govmnt_gross_income_as_share_of_NI, 0, 0.4,   "Governament gross income"),
]
plotvariables(solution,(t, 1980, 2100), variables_hf; title="2. Human footprint (Giant Leap scenario)")

variables_hf_vensim = [
    (Population_below_15_k_dollar_per_p_per_y_Mp,    0, 10000,  "Population below 15k"),
    (ENERGY_USE_Mtoe_per_y,    0, 20000, "Energy use"),
    (Crop_use_Mt_per_y,    0, 8000, " Crop use"),
    (Fertilizer_use_Mt_per_y, 0, 200,   "Fertilizer use"),
    (GHG_EMISSIONS_GtCO2e_per_y, 0, 60,   "GHG emissions"),
    (Govmnt_gross_income_as_share_of_NI, 0, 0.4,   "Governament gross income"),
]
plotvariables(solution,(t, 1980, 2100), variables_hf_vensim; title="2. Human footprint (Giant Leap scenario) Vensim Version")

variables_c = [
    (CO2_emissions_per_person_tCO2_per_y,    0, 6,  "C02 emissions per person"),
    (Crop_use_per_person_t_crop_per_p_per_y,    0, 1, "Crop use per person"),
    (Forestry_land_Mha,    0, 2000, " Forestry land"),
    (Cost_of_energy_G_dollar_per_y, 0, 6000,   "Cost of energy"),
    (Energy_use_per_person_toe_per_p_per_y, 0, 4,   "Energy used per person"),
    (Worker_disposable_income_k_dollar_per_p_per_y, 0, 50,   "Worker disposable income"),
]
plotvariables(solution,(t, 1980, 2100), variables_c; title="3. Consumption (Giant Leap scenario)")

variables_w = [
    (Average_wellbeing_from_disposable_income_1,    0, 8,  "From disposable income"),
    (Average_wellbeing_from_inequality_1,    0, 1.2, "From inequality"),
    (AVERAGE_WELLBEING_INDEX_1,    0, 2.4, " Average Wellbeing Index"),
    (Average_wellbeing_from_public_spending_1, 0, 8,   "From public spending"),
    (Average_wellbeing_from_progress_1, 0, 1.2,   "From progress"),
    (Average_wellbeing_from_global_warming_1, 0, 1.2,   "From global warming"),
]
plotvariables(solution,(t, 1980, 2100), variables_w; title="4. Wellbeing (Giant Leap scenario)")

variables_inq_index = [
    (INEQUALITY_INDEX_19801,    0, 1.6,  "Giant Leap"),
]
plotvariables(solution,(t, 1980, 2100), variables_inq_index; title="Inequality Index")


variables_tran_pay = [
    (Transfer_payments_G_dollar_per_y,    0, 70000,  "Giant Leap"),
]
plotvariables(solution,(t, 1980, 2100), variables_tran_pay; title="Transfer Payments G/y")


variables_globalsti = [
    (Wellbeing_effect_of_participation_1,    0, 2,  "Wellbeing Giant Leap"),
    (Social_tension_1,    0, 2,  "Social Tension Giant Leap"),
    ]
plotvariables(solution,(t, 1980, 2100), variables_globalsti; title="Global Social Tension Index")

variables_numberchildren = [
    (Desired_no_of_children_1,    0, 5,  "Giant Leap"),
]
plotvariables(solution,(t, 1980, 2100), variables_numberchildren; title="Number of Children per Woman")
