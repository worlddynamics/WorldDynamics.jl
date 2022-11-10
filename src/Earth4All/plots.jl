using Plots
include("./Earth4All.jl")




variables_hf = [
    (GDP_per_person_k__per_p_per_y,    0, 50,  "GDP per person"),
    (GDP_G__per_y,    0, 10000, "GDP"),
    (Cropland_Mha,    0, 2000, " Cropland"),
    (Fertilizer_use_Mt_per_y, 0, 200,   "Fertilizer use"),
    (GHG_EMISSIONS_GtCO2e_per_y, 0, 60,   "GHG emissions"),
    (Govmnt_gross_income__as_share_of_NI_, 0, 0.4,   "Governament gross income"),

]


plotvariables(solution,(t, 1980, 2100), variables_hf; title="2. Human footprint (Giant Leap scenario)")



variable_c = [
    (CO2_emissions_per_person_tCO2_per_y,    0, 6,  "C02 emissions per person"),
    (Crop_use_per_person_t_crop_per_p_per_y,    0, 1, "Crop use per person"),
    (Forestry_land_Mha,    0, 2000, " Forestry land"),
    (Cost_of_energy_G__per_y, 0, 6000,   "Cost of energy"),
    (Energy_use_per_person_toe_per_p_per_y, 0, 4,   "Energy used per person"),
    (Worker_disposable_income_k__per_p_per_y, 0, 50,   "Worker disposable income"),

]


plotvariables(solution,(t, 1980, 2100), variables_c; title="3. Consumption (Giant Leap scenario)")
