module Earth4All

using WorldDynamics
using ModelingToolkit
using IfElse, Random, SignalAnalysis

@variables t
D = Differential(t)

@parameters Satisfactory_public_spending__1_
@parameters Exogenous_introduction_period_
@parameters Fossil_el_capacity_in_1980_GW
@parameters CO2_release_per_ha_of_forest_cut_tCO2_per_ha
@parameters Ton_crops_per_toe_biofuel
@parameters DDI_in_1980_y
@parameters tCO2e_per_tCH4
@parameters kg_crop_per_kg_red_meat
@parameters Unemployment_rate_in_1980__1_
@parameters Time_to_adapt_to_higher_income_y
@parameters Forests_cleared_Mha_per_y
@parameters State_capacity_in_1980__fraction_of_GDP_
@parameters FRACA_min
@parameters Goal_for_fraction_new_red_meat__1_
@parameters Fraction_new_electrification_in_1980__1_
@parameters Grazing_land_in_1980_Mha
@parameters Sufficient_relative_inventory__1_
@parameters sWVeoWVF_0
@parameters Workers_payback_period_y
@parameters Persons_per_full_time_job_in_1980_p_per_ftj
@parameters Cost_reduction_per_doubling_of_sun_and_wind_capacity__1_
@parameters sCO2CeoACY_0
@parameters Sales_averaging_time_y
@parameters Global_surface_Mkm2
@parameters Embedded_TFP_in_1980__1_
@parameters Threshold_disposable_income_k__per_p_per_y
@parameters DNCgamma
@parameters Normal_bank_operating_margin_1_per_y
@parameters Desired_inventory_coverage_y
@parameters Agriculture_as_fraction_of_GDP__1_
@parameters GtCO2_per_ppm
@parameters Extra_pension_age_in_2022_y
@parameters Fossil_el_cap_construction_time_y
@parameters Output_growth_in_1980_1_per_y__to_avoid_transient_
@parameters FRA_in_1980__1_
@parameters sOWeoWV_0
@parameters TFP_in_1980__1_
@parameters sWSOeoLPR_0
@parameters Life_of_renewable_el_capacity_y
@parameters Sun_and_wind_capacity_in_1980_GW
@parameters Normal_signal_rate_1_per_y
@parameters Passing_40_in_1980_Mp_per_y
@parameters sTIeoNHW_0
@parameters CO2_concentration_in_1980_ppm
@parameters Extra_mult_on_CUC__to_avoid_initial_transient_in_Investment_share_of_GDP
@parameters Fraction_of_extra_taxes_paid_by_owners__1_
@parameters sEDeoFRA_0
@parameters Govmnt_payback_period_y
@parameters INITIAL_TIME__
@parameters Factor_to_avoid_transient_in_growth_rate__1_
@parameters OPEX_renewable_el___per_kWh
@parameters tCO2_per_tCH4
@parameters Infrastructure_purchases_ratio_in_1980_y
@parameters Sustainable_fertiliser_use_kgN_per_ha_per_y
@parameters Inventory_coverage_perception_time_y
@parameters Amount_of_ice_in_1980_Mkm3
@parameters CAP_PUS_in_1980_Gcu
@parameters Order
@parameters Cost_of_CCS___per_tCO2
@parameters Threshold_public_spending_k__per_p_per_y
@parameters Albedo_ice_and_snow__1_
@parameters Mass_of_atmosphere_Zt
@parameters sIIEeoROTA_0
@parameters Extra_heat_in_1980_ZJ
@parameters Warming_from_extra_heat_deg_per_ZJ
@parameters Mult_to_avoid_transient_in_govmnt_finance
@parameters CO2_in_atm_in_1980_GtCO2
@parameters Goal_for_renewable_el_fraction__1_
@parameters Passing_60_in_1980_Mp_per_y
@parameters Observed_warming_in_2022_deg_C
@parameters Worker_consumption_fraction__1_
@parameters Time_to_establish_social_trust_y
@parameters DNC_in_1980
@parameters Water_vapor_feedback_in_1980_W_per_m2
@parameters Govmnt_stimulus_from_2022__share_of_NI_
@parameters Max_life_expectancy_multiplier__1_
@parameters DNCalfa_0
@parameters tCO2e_per_tCO2
@parameters CO2_absorbed_in_reg_ag_tCO2_per_ha_per_y
@parameters Time_to_join_per_leave_job_market_y
@parameters kg_CH4_per_kg_crop_in_1980
@parameters PCOR_PIS_cu_per_u_per_y
@parameters Cost_of_capacity_in_1980___per_cu
@parameters Jobs_in_1980_M_ftj
@parameters Finance_sector_response_time_y
@parameters ROC_in_ECLR_in_1980_1_per_y
@parameters GDPpp_of_technology_leader_k__per_p_per_y
@parameters CAPEX_fossil_el___per_W
@parameters sGDPppeoFRACA_0
@parameters toe_per_tH2
@parameters CH4_from_production_of_fossil_fuels_GtCH4_per_y
@parameters Extra_rate_of_decline_in_N2O_per_kg_fertilizer_from_2022_1_per_y
@parameters Threshold_progress_rate_1_per_y
@parameters Ice_and_snow_cover_excl_Greenland_and_Antarctica_in_1980_Mkm2
@parameters ROC_in_embedded_TFP_1_per_y
@parameters xExtra_TA_cost_in_2022__share_of_GDP_
@parameters Renewable_el_capacity_in_1980_GW
@parameters Fraction_women__1_
@parameters Threshold_inequality__1_
@parameters CLR_in_1980_kcu_per_ftj
@parameters Fraction_NASJ_in_1980__1_
@parameters sINEeoLOK_0
@parameters kg_CH4_per___of_GDP
@parameters tCO2e_per_tN2O
@parameters Time_to_adjust_shifts_y
@parameters ROC_in_food_sector_productivity_1_per_y
@parameters Fraction_achieving_desired_family_size__1_
@parameters Unemployment_perception_time_CB_y
@parameters sOWeoMR_0
@parameters Melting_rate_surface_in_1980_1_per_y
@parameters Income_tax_rate_owners_in_1980__1_
@parameters Cost_reduction_per_doubling_in_Regenerative_agriculture__1_
@parameters Inflation_perception_time_CB_y
@parameters Max_non_fossil_CO2_per_person_tCO2_per_p_per_y
@parameters Water_vapour_concentration_1980_g_per_kg
@parameters Social_tension_in_1980__1_
@parameters Aged_40_60_in_1980_Mp
@parameters Heat_required_to_melt_ice_kJ_per_kg
@parameters CO2_in_atm_in_1850_GtCO2
@parameters Time_to_implement_new_taxes_y
@parameters Max_workers_debt_burden_y
@parameters sSCeoROTA_0
@parameters Max_forest_absorption_multiplier__1_
@parameters Domestic_ROTA_in_1980_1_per_y
@parameters Desired_reserve_capacity__1_
@parameters Dying_in_1980_Mp_per_y
@parameters Direct_air_capture_of_CO2_in_2100_GtCO2_per_y
@parameters Extra_empowerment_tax_from_2022__share_of_NI_
@parameters Extra_transfer_of_govmnt_budget_to_workers__1_
@parameters Surface_vs_deep_rate__1_
@parameters Traditional_cost_of_electricity___per_kWh
@parameters Fraction_transferred_in_1980__1_
@parameters Govmnt_drawdown_period_y
@parameters sOWeoCOC_0
@parameters Fraction_cleared_for_grazing__1_
@parameters GDP_per_person_in_1980
@parameters Acceptable_unemployment_rate__1_
@parameters TIME_STEP__
@parameters Goal_for_extra_fertility_reduction__1_
@parameters Excess_demand_in_1980__1_
@parameters Unemployment_target__1_
@parameters Extra_pension_tax_from_2022__share_of_NI_
@parameters sWSOeoCLR_0
@parameters Normal_LPR_in_1980__1_
@parameters LEmax
@parameters Threshold_FFLR__1_
@parameters Construction_time_PIS_y
@parameters sCBCeoFRA_0
@parameters sINVeoDDI_0
@parameters Cost_of_Max_fertility_reduction__share_of_GDP_
@parameters kWh_el_per_kgH2
@parameters LEalfa
@parameters Desired_relative_inventory__1_
@parameters Fraction_Aged_20_pension_age_wanting_paid_work_in_1980__1_
@parameters Efficiency_of_fossil_power_plant_TWh_el_per_TWh_heat
@parameters Price_Index_in_1980__1_
@parameters Ton_per_m3_ice
@parameters Exogenous_introduction_period_y
@parameters Workforce_in_1980_Mp
@parameters WSO_in_1980__1_
@parameters Output_u_per_y
@parameters GtCH4_per_ppm
@parameters Goal_for_extra_income_from_commons__share_of_NI_
@parameters Time_for_people_to_prepare_for_paid_work_y
@parameters Fraction_of_extra_TA_cost_paid_by_extra_taxes__1_
@parameters Goal_for_extra_normal_LPR__1_
@parameters sROPeoAW_0
@parameters Normal_hours_worked_in_1980_kh_per_ftj_per_y
@parameters Perception_delay_y
@parameters N2O_in_atm_in_1980_GtN2O
@parameters Transfer_rate_surface_space_in_1980_1_per_y
@parameters Time_to_change_reform_delay_y
@parameters TWh_heat_per_EJ___calorific_equivalent
@parameters Aged_20_40_in_1980_Mp
@parameters Extra_rate_of_decline_in_CH4_pr_kg_crop_after_2022_1_per_y
@parameters sINVeoSWI_0
@parameters sOWeoLOC_0
@parameters Passing_20_in_1980_Mp_per_y
@parameters sLEeoPa_0
@parameters Fraction_of_inflation_compensated__1_
@parameters Normal_unemployment_rate__1_
@parameters SSP2_land_management_action_from_2022___1_
@parameters Normal__1_
@parameters sUNeoWSO_0
@parameters Diminishing_return_public_spending__1_
@parameters sINeoSR_0
@parameters Foreign_capital_inflow_G__per_y
@parameters Extra_cost_per_reduced_use_of_non_el_FF___per_toe
@parameters Renewable_el_fraction_in_1980__1_
@parameters Sampling_time_y
@parameters Experience_gained_before_2022_Mha
@parameters sFCUTeoLOFC_0
@parameters sOWeoLoCO2_0
@parameters sFFLReoOGRR_0
@parameters CAP_PIS_in_1980_Gcu
@parameters Goal_for_extra_pension_age_y
@parameters Investment_planning_time_y
@parameters Demand_adjustment_time_y
@parameters Forcing_from_CO2_in_1980_W_per_m2
@parameters Pension_age_in_1980_y
@parameters Fraction_of_CO2_sources_with_CCS_in_2022__1_
@parameters Normal_basic_bank_margin_1_per_y
@parameters sUNeoSR_0
@parameters Inflation_target_1_per_y
@parameters Crop_yield_in_reg_ag_t_crop_per_ha_per_y
@parameters sOWeoTFP_0
@parameters Government_consumption_fraction__1_
@parameters Inflation_in_1980__1_per_y_
@parameters Time_to_adjust_budget_y
@parameters Urban_development_time_y
@parameters sIPReoVPSS_0
@parameters Pulse_height__1_
@parameters Time_to_adjust_worker_consumption_y
@parameters LEgamma
@parameters sEHeoOW_0
@parameters sSTReoRD_0
@parameters Renewable_el_fraction_in_2022__1_
@parameters ROC_in_tCO2_per_toe_1_per_y
@parameters Goal_for_fraction_regenerative_agriculture__1_
@parameters Life_of_capacity_PIS_in_1980_y
@parameters DNCmin
@parameters sFUeoSQ_0
@parameters CAPEX_renewable_el_in_1980___per_W
@parameters sGReoCR_0
@parameters Extra_energy_productivity_index_in_2022__1_
@parameters Mtoe_per_EJ___calorific_equivalent
@parameters Extra_ROC_in_energy_productivity_after_2022_1_per_y
@parameters Renewable_el_construction_time_y
@parameters Persons_per_full_time_job_p_per_ftj
@parameters OPEX_fossil_el___per_kWh
@parameters MEMO_Fraction_of_non_el_fossil_fuels_use_in_hard_to_abate_sectors_HTAS__1_
@parameters xExtra_TA_cost_in_2100__share_of_GDP_
@parameters Extra_cost_of_reg_ag_in_2022___per_ha_per_y
@parameters sPUNeoPEW_0
@parameters Mult_to_avoid_transient_in_worker_finance
@parameters Life_of_N2O_in_atm_y
@parameters sINVeoIN_0
@parameters Diminishing_return_disposable_income__1_
@parameters Min_wellbeing_from_global_warming__1_
@parameters Max_imported_ROTA_from_2022_1_per_y
@parameters sWSOeoWPR_0
@parameters Goal_for_income_tax_rate_owners__1_
@parameters Max_fertility_multiplier__1_
@parameters Albedo_global_average__1_
@parameters Cropland_in_1980_Mha
@parameters Fertilizer_use_in_1980_Mt_per_y
@parameters Cost_per_ton_fertilizer___per_t
@parameters CLR_in_1980_k__per_j
@parameters Biomass_energy_Mtoe_per_y
@parameters Income_tax_rate_owners_in_2022__1_
@parameters sIIeoAW_0
@parameters Normal_increase_in_energy_efficiency_1_per_y
@parameters Fraction_of_renewable_electricity_to_hydrogen__1_
@parameters Life_of_extra_CO2_in_atm_in_1980_y
@parameters ten_yr_loop_delay_y
@parameters Normal_life_of_fossil_el_capacity_y
@parameters Goal_for_fraction_new_electrification__1_
@parameters Fraction_of_govmnt_debt_cancelled_in_2022_1_per_y
@parameters OCI_in_1980
@parameters OGRR_in_1980_1_per_y
@parameters Multiplier_to_avoid_transient_in_unemployment
@parameters Max_govmnt_debt_burden_y
@parameters ROC_in_fertilizer_productivity_1_per_y
@parameters Cost_of_TAs_in_2022_G__per_y
@parameters Sales_tax_rate__1_
@parameters Signal_rate_adjustment_time_y
@parameters Normal_reform_delay_y
@parameters Fraction_unprofitable_activity_in_TAs__1_
@parameters PCOR_PUS_cu_per_u_per_y
@parameters WFI_in_1980
@parameters Adjustment_factor_to_make_costs_match_1980_2022__1_
@parameters Cost_per_unit_in_1980___per_u
@parameters GCI_in_1980
@parameters Unconventional_stimulus_in_PUS_from_2022__share_of_GDP_
@parameters Goal_for_fraction_of_CO2_sources_with_CCS__1_
@parameters sGDPppeoROCCLR_0
@parameters sSTEeoRD_0
@parameters SWI_in_1980__1_
@parameters xTFP_observation_time_y
@parameters sGDPeoOSR_0
@parameters Rate_of_decline_in_N2O_per_kg_fertiliser_1_per_y
@parameters Old_growth_forest_in_1980_Mha
@parameters Renewable_capacity_up_time_kh_per_y
@parameters Public_services_per_person_in_1980_k__per_p_per_y
@parameters Time_to_observe_excess_demand_y
@parameters Urban_land_per_population_ha_per_p
@parameters Basic_income_tax_rate_workers__1_
@parameters Acceptable_inequality__1_
@parameters eight_khours_per_year
@parameters Soil_quality_index_in_1980__1_
@parameters Extra_use_of_electricity_per_reduced_use_of_non_el_FF_MWh_per_toe
@parameters Transfer_rate_surface_abyss_in_1980_1_per_y
@parameters CO2_concentration_in_2022_ppm
@parameters Nuclear_capacity_up_time_kh_per_y
@parameters Land_erosion_rate_in_1980_1_per_y
@parameters LE_in_1980
@parameters Average_wellbeing_perception_delay_y
@parameters Time_to_adjust_owner_consumption_y
@parameters Real_wage_erosion_rate_1_per_y
@parameters sFBeoCLE_0
@parameters sPPReoSTE_0
@parameters Cost_of_nuclear_el___per_kWh
@parameters Time_to_enter_per_leave_labor_market_y
@parameters Time_to_adjust_hours_worked_y
@parameters Kappa
@parameters Forestry_land_in_1980_Mha
@parameters Workers_drawdown_period_y
@parameters Traditional_cost_of_fossil_fuel_for_non_el_use___per_toe
@parameters Job_creation_delay_y
@parameters sOWeoLE_0
@parameters Urban_land_in_1980_Mha
@parameters Time_to_establish_growth_rate_y
@parameters sGWeoAW_0
@parameters sOWeoACY_0
@parameters sLPeoAWP_0
@parameters sFUeoLER_0
@parameters Construction_time_PUS_y
@parameters FINAL_TIME__
@parameters Warming_in_1980_deg_C
@parameters ROC_in_CLR_in_1980_1_per_y
@parameters Margin_in_1980__1_
@parameters Inequality_in_1980__1_
@parameters Minimum_relative_inventory_without_inflation__1_
@parameters STD_in_fluctuation_around_normal__1_
@parameters Aged_60__in_1980_Mp
@parameters Aged_0_20_in_1980_Mp
@parameters Unconventional_stimulus_in_PIS_from_2022__share_of_GDP_
@parameters Threshold_participation__1_
@parameters Rate_of_decline_in_CH4_per_kg_crop_1_per_y
@parameters SSP2_family_action_from_2022___1_
@parameters kg_N2O_per_kg_fertilizer_in_1980
@parameters GDP_per_person_in_1980_k__per_p_per_y
@parameters Threshold_warming_deg_C
@parameters Normal_k__1_
@parameters AWI_in_1980__1_
@parameters Life_of_CH4_in_atm_y
@parameters Extra_ROC_in_food_sector_productivity_from_2022_1_per_y
@parameters Inflation_expectation_formation_time_y
@parameters GtN2O_per_ppm
@parameters Extra_general_tax_rate_from_2022__1_
@parameters Social_trust_in_1980__1_
@parameters sEDeoLOC_0
@parameters CH4_in_atm_in_1980_GtCH4
@parameters Owner_savings_fraction_in_1980
@parameters Fertile_period_y
@parameters Transmission_cost___per_kWh
@parameters Extra_domestic_ROTA_from_2022_1_per_y
@parameters sPUNeoLPR_0
@parameters Acceptable_progress_1_per_y
@parameters sWSOeoFRA_0
@parameters Goal_for_crop_waste_reduction__1_
@parameters Fraction_new_electrification_in_2022__1_

p = Dict{Symbol, Float64}(
    :Satisfactory_public_spending__1_ => 0.3,
    :Exogenous_introduction_period_ => 0,
    :Fossil_el_capacity_in_1980_GW => 980,
    :CO2_release_per_ha_of_forest_cut_tCO2_per_ha => 65,
    :Ton_crops_per_toe_biofuel => 0,
    :DDI_in_1980_y => 1,
    :tCO2e_per_tCH4 => 23,
    :kg_crop_per_kg_red_meat => 24,
    :Unemployment_rate_in_1980__1_ => 0.05,
    :Time_to_adapt_to_higher_income_y => 10,
    :Forests_cleared_Mha_per_y => 0,
    :State_capacity_in_1980__fraction_of_GDP_ => 0.3,
    :FRACA_min => 0.65,
    :Goal_for_fraction_new_red_meat__1_ => 0.5,
    :Fraction_new_electrification_in_1980__1_ => 0,
    :Grazing_land_in_1980_Mha => 3300,
    :Sufficient_relative_inventory__1_ => 1,
    :sWVeoWVF_0 => 3,
    :Workers_payback_period_y => 20,
    :Persons_per_full_time_job_in_1980_p_per_ftj => 1,
    :Cost_reduction_per_doubling_of_sun_and_wind_capacity__1_ => 0.2,
    :sCO2CeoACY_0 => 0.3,
    :Sales_averaging_time_y => 1,
    :Global_surface_Mkm2 => 510,
    :Embedded_TFP_in_1980__1_ => 1,
    :Threshold_disposable_income_k__per_p_per_y => 15,
    :DNCgamma => 0.14,
    :Normal_bank_operating_margin_1_per_y => 0.015,
    :Desired_inventory_coverage_y => 0.4,
    :Agriculture_as_fraction_of_GDP__1_ => 0.05,
    :GtCO2_per_ppm => 7.9,
    :Extra_pension_age_in_2022_y => 0,
    :Fossil_el_cap_construction_time_y => 3,
    :Output_growth_in_1980_1_per_y__to_avoid_transient_ => 0.06,
    :FRA_in_1980__1_ => 0.9,
    :sOWeoWV_0 => 0.18,
    :TFP_in_1980__1_ => 1,
    :sWSOeoLPR_0 => 0.2,
    :Life_of_renewable_el_capacity_y => 40,
    :Sun_and_wind_capacity_in_1980_GW => 10,
    :Normal_signal_rate_1_per_y => 0.02,
    :Passing_40_in_1980_Mp_per_y => 64,
    :sTIeoNHW_0 => -0.03,
    :CO2_concentration_in_1980_ppm => 330,
    :Extra_mult_on_CUC__to_avoid_initial_transient_in_Investment_share_of_GDP => 1.7,
    :Fraction_of_extra_taxes_paid_by_owners__1_ => 0.8,
    :sEDeoFRA_0 => 5,
    :Govmnt_payback_period_y => 200,
    :INITIAL_TIME__ => 1980,
    :Factor_to_avoid_transient_in_growth_rate__1_ => 0.93,
    :OPEX_renewable_el___per_kWh => 0.001,
    :tCO2_per_tCH4 => 2.75,
    :Infrastructure_purchases_ratio_in_1980_y => 1.2,
    :Sustainable_fertiliser_use_kgN_per_ha_per_y => 20,
    :Inventory_coverage_perception_time_y => 0.25,
    :Amount_of_ice_in_1980_Mkm3 => 55,
    :CAP_PUS_in_1980_Gcu => 5350,
    :Order => 10,
    :Cost_of_CCS___per_tCO2 => 95,
    :Threshold_public_spending_k__per_p_per_y => 3,
    :Albedo_ice_and_snow__1_ => 0.7,
    :Mass_of_atmosphere_Zt => 5,
    :sIIEeoROTA_0 => -0.1,
    :Extra_heat_in_1980_ZJ => 0,
    :Warming_from_extra_heat_deg_per_ZJ => 0.0006,
    :Mult_to_avoid_transient_in_govmnt_finance => 0.64,
    :CO2_in_atm_in_1980_GtCO2 => 2600,
    :Goal_for_renewable_el_fraction__1_ => 1,
    :Passing_60_in_1980_Mp_per_y => 38,
    :Observed_warming_in_2022_deg_C => 1.35,
    :Worker_consumption_fraction__1_ => 0.9,
    :Time_to_establish_social_trust_y => 10,
    :DNC_in_1980 => 4.3,
    :Water_vapor_feedback_in_1980_W_per_m2 => 0.9,
    :Govmnt_stimulus_from_2022__share_of_NI_ => 0,
    :Max_life_expectancy_multiplier__1_ => 1.1,
    :DNCalfa_0 => 0,
    :tCO2e_per_tCO2 => 1,
    :CO2_absorbed_in_reg_ag_tCO2_per_ha_per_y => 1,
    :Time_to_join_per_leave_job_market_y => 3,
    :kg_CH4_per_kg_crop_in_1980 => 0.05,
    :PCOR_PIS_cu_per_u_per_y => 2.3,
    :Cost_of_capacity_in_1980___per_cu => 1,
    :Jobs_in_1980_M_ftj => 1600,
    :Finance_sector_response_time_y => 1,
    :ROC_in_ECLR_in_1980_1_per_y => 0.02,
    :GDPpp_of_technology_leader_k__per_p_per_y => 15,
    :CAPEX_fossil_el___per_W => 0.7,
    :sGDPppeoFRACA_0 => -0.2,
    :toe_per_tH2 => 10,
    :CH4_from_production_of_fossil_fuels_GtCH4_per_y => 0,
    :Extra_rate_of_decline_in_N2O_per_kg_fertilizer_from_2022_1_per_y => 0.01,
    :Threshold_progress_rate_1_per_y => 0.02,
    :Ice_and_snow_cover_excl_Greenland_and_Antarctica_in_1980_Mkm2 => 12,
    :ROC_in_embedded_TFP_1_per_y => 0.01,
    :xExtra_TA_cost_in_2022__share_of_GDP_ => 0,
    :Renewable_el_capacity_in_1980_GW => 300,
    :Fraction_women__1_ => 0.5,
    :Threshold_inequality__1_ => 0.5,
    :CLR_in_1980_kcu_per_ftj => 41,
    :Fraction_NASJ_in_1980__1_ => 0.05,
    :sINEeoLOK_0 => -0.5,
    :kg_CH4_per___of_GDP => 0,
    :tCO2e_per_tN2O => 7,
    :Time_to_adjust_shifts_y => 0.24,
    :ROC_in_food_sector_productivity_1_per_y => 0.002,
    :Fraction_achieving_desired_family_size__1_ => 0.8,
    :Unemployment_perception_time_CB_y => 1,
    :sOWeoMR_0 => 1,
    :Melting_rate_surface_in_1980_1_per_y => 0.0015,
    :Income_tax_rate_owners_in_1980__1_ => 0.4,
    :Cost_reduction_per_doubling_in_Regenerative_agriculture__1_ => 0.05,
    :Inflation_perception_time_CB_y => 1,
    :Max_non_fossil_CO2_per_person_tCO2_per_p_per_y => 0.5,
    :Water_vapour_concentration_1980_g_per_kg => 2,
    :Social_tension_in_1980__1_ => 1.3,
    :Aged_40_60_in_1980_Mp => 768,
    :Heat_required_to_melt_ice_kJ_per_kg => 333,
    :CO2_in_atm_in_1850_GtCO2 => 2200,
    :Time_to_implement_new_taxes_y => 5,
    :Max_workers_debt_burden_y => 1,
    :sSCeoROTA_0 => 0.5,
    :Max_forest_absorption_multiplier__1_ => 2,
    :Domestic_ROTA_in_1980_1_per_y => 0.01,
    :Desired_reserve_capacity__1_ => 0.05,
    :Dying_in_1980_Mp_per_y => 30,
    :Direct_air_capture_of_CO2_in_2100_GtCO2_per_y => 8,
    :Extra_empowerment_tax_from_2022__share_of_NI_ => 0.02,
    :Extra_transfer_of_govmnt_budget_to_workers__1_ => 0.2,
    :Surface_vs_deep_rate__1_ => 4,
    :Traditional_cost_of_electricity___per_kWh => 0.03,
    :Fraction_transferred_in_1980__1_ => 0.3,
    :Govmnt_drawdown_period_y => 10,
    :sOWeoCOC_0 => 0.2,
    :Fraction_cleared_for_grazing__1_ => 0.1,
    :GDP_per_person_in_1980 => 6.4,
    :Acceptable_unemployment_rate__1_ => 0.05,
    :TIME_STEP__ => 0.015625,
    :Goal_for_extra_fertility_reduction__1_ => 0.2,
    :Excess_demand_in_1980__1_ => 1,
    :Unemployment_target__1_ => 0.05,
    :Extra_pension_tax_from_2022__share_of_NI_ => 0.02,
    :sWSOeoCLR_0 => 1.05,
    :Normal_LPR_in_1980__1_ => 0.85,
    :LEmax => 85,
    :Threshold_FFLR__1_ => 0.2,
    :Construction_time_PIS_y => 1.5,
    :sCBCeoFRA_0 => -0.8,
    :sINVeoDDI_0 => -0.6,
    :Cost_of_Max_fertility_reduction__share_of_GDP_ => 0.01,
    :kWh_el_per_kgH2 => 40,
    :LEalfa => 0.001,
    :Desired_relative_inventory__1_ => 1,
    :Fraction_Aged_20_pension_age_wanting_paid_work_in_1980__1_ => 0.9,
    :Efficiency_of_fossil_power_plant_TWh_el_per_TWh_heat => 0.345,
    :Price_Index_in_1980__1_ => 1,
    :Ton_per_m3_ice => 0.95,
    :Exogenous_introduction_period_y => 30,
    :Workforce_in_1980_Mp => 1530,
    :WSO_in_1980__1_ => 0.5,
    :Output_u_per_y => 0,
    :GtCH4_per_ppm => 5,
    :Goal_for_extra_income_from_commons__share_of_NI_ => 0.02,
    :Time_for_people_to_prepare_for_paid_work_y => 5,
    :Fraction_of_extra_TA_cost_paid_by_extra_taxes__1_ => 0.5,
    :Goal_for_extra_normal_LPR__1_ => 0,
    :sROPeoAW_0 => 6,
    :Normal_hours_worked_in_1980_kh_per_ftj_per_y => 2,
    :Perception_delay_y => 5,
    :N2O_in_atm_in_1980_GtN2O => 1.052,
    :Transfer_rate_surface_space_in_1980_1_per_y => 0.01,
    :Time_to_change_reform_delay_y => 10,
    :TWh_heat_per_EJ___calorific_equivalent => 278,
    :Aged_20_40_in_1980_Mp => 1100,
    :Extra_rate_of_decline_in_CH4_pr_kg_crop_after_2022_1_per_y => 0.01,
    :sINVeoSWI_0 => -0.6,
    :sOWeoLOC_0 => -0.1,
    :Passing_20_in_1980_Mp_per_y => 100,
    :sLEeoPa_0 => 0.75,
    :Fraction_of_inflation_compensated__1_ => 1,
    :Normal_unemployment_rate__1_ => 0.05,
    :SSP2_land_management_action_from_2022___1_ => 1,
    :Normal__1_ => 1,
    :sUNeoWSO_0 => -0.035,
    :Diminishing_return_public_spending__1_ => 0.7,
    :sINeoSR_0 => 0.7,
    :Foreign_capital_inflow_G__per_y => 0,
    :Extra_cost_per_reduced_use_of_non_el_FF___per_toe => 10,
    :Renewable_el_fraction_in_1980__1_ => 0.065,
    :Sampling_time_y => 0.1,
    :Experience_gained_before_2022_Mha => 5,
    :sFCUTeoLOFC_0 => 0.5,
    :sOWeoLoCO2_0 => 1,
    :sFFLReoOGRR_0 => -5,
    :CAP_PIS_in_1980_Gcu => 59250,
    :Goal_for_extra_pension_age_y => 0,
    :Investment_planning_time_y => 1,
    :Demand_adjustment_time_y => 1.2,
    :Forcing_from_CO2_in_1980_W_per_m2 => 1.07,
    :Pension_age_in_1980_y => 62,
    :Fraction_of_CO2_sources_with_CCS_in_2022__1_ => 0,
    :Normal_basic_bank_margin_1_per_y => 0.005,
    :sUNeoSR_0 => -1.5,
    :Inflation_target_1_per_y => 0.02,
    :Crop_yield_in_reg_ag_t_crop_per_ha_per_y => 5,
    :sOWeoTFP_0 => -0.1,
    :Government_consumption_fraction__1_ => 0.75,
    :Inflation_in_1980__1_per_y_ => 0.02,
    :Time_to_adjust_budget_y => 1,
    :Urban_development_time_y => 10,
    :sIPReoVPSS_0 => 1,
    :Pulse_height__1_ => 0,
    :Time_to_adjust_worker_consumption_y => 1,
    :LEgamma => 0.15,
    :sEHeoOW_0 => 0.8,
    :sSTReoRD_0 => -1,
    :Renewable_el_fraction_in_2022__1_ => 0.23,
    :ROC_in_tCO2_per_toe_1_per_y => -0.003,
    :Goal_for_fraction_regenerative_agriculture__1_ => 0.5,
    :Life_of_capacity_PIS_in_1980_y => 15,
    :DNCmin => 1.2,
    :sFUeoSQ_0 => -0.001,
    :CAPEX_renewable_el_in_1980___per_W => 7,
    :sGReoCR_0 => 0,
    :Extra_energy_productivity_index_in_2022__1_ => 1,
    :Mtoe_per_EJ___calorific_equivalent => 24,
    :Extra_ROC_in_energy_productivity_after_2022_1_per_y => 0.004,
    :Renewable_el_construction_time_y => 3,
    :Persons_per_full_time_job_p_per_ftj => 1,
    :OPEX_fossil_el___per_kWh => 0.02,
    :MEMO_Fraction_of_non_el_fossil_fuels_use_in_hard_to_abate_sectors_HTAS__1_ => 0.4,
    :xExtra_TA_cost_in_2100__share_of_GDP_ => 0,
    :Extra_cost_of_reg_ag_in_2022___per_ha_per_y => 400,
    :sPUNeoPEW_0 => 0.5,
    :Mult_to_avoid_transient_in_worker_finance => 0.39,
    :Life_of_N2O_in_atm_y => 95,
    :sINVeoIN_0 => -0.26,
    :Diminishing_return_disposable_income__1_ => 0.5,
    :Min_wellbeing_from_global_warming__1_ => 0.2,
    :Max_imported_ROTA_from_2022_1_per_y => 0.005,
    :sWSOeoWPR_0 => 1,
    :Goal_for_income_tax_rate_owners__1_ => 0.3,
    :Max_fertility_multiplier__1_ => 1.6,
    :Albedo_global_average__1_ => 0.3,
    :Cropland_in_1980_Mha => 1450,
    :Fertilizer_use_in_1980_Mt_per_y => 61,
    :Cost_per_ton_fertilizer___per_t => 500,
    :CLR_in_1980_k__per_j => 41,
    :Biomass_energy_Mtoe_per_y => 0,
    :Income_tax_rate_owners_in_2022__1_ => 0.3,
    :sIIeoAW_0 => -0.6,
    :Normal_increase_in_energy_efficiency_1_per_y => 0.01,
    :Fraction_of_renewable_electricity_to_hydrogen__1_ => 0,
    :Life_of_extra_CO2_in_atm_in_1980_y => 60,
    :ten_yr_loop_delay_y => 2.3,
    :Normal_life_of_fossil_el_capacity_y => 40,
    :Goal_for_fraction_new_electrification__1_ => 1,
    :Fraction_of_govmnt_debt_cancelled_in_2022_1_per_y => 0.1,
    :OCI_in_1980 => 7081,
    :OGRR_in_1980_1_per_y => 0.004,
    :Multiplier_to_avoid_transient_in_unemployment => 1,
    :Max_govmnt_debt_burden_y => 1,
    :ROC_in_fertilizer_productivity_1_per_y => 0.01,
    :Cost_of_TAs_in_2022_G__per_y => 9145,
    :Sales_tax_rate__1_ => 0.03,
    :Signal_rate_adjustment_time_y => 1,
    :Normal_reform_delay_y => 30,
    :Fraction_unprofitable_activity_in_TAs__1_ => 0.3,
    :PCOR_PUS_cu_per_u_per_y => 2.3,
    :WFI_in_1980 => 13000,
    :Adjustment_factor_to_make_costs_match_1980_2022__1_ => 1.35,
    :Cost_per_unit_in_1980___per_u => 0.8,
    :GCI_in_1980 => 5400,
    :Unconventional_stimulus_in_PUS_from_2022__share_of_GDP_ => 0.01,
    :Goal_for_fraction_of_CO2_sources_with_CCS__1_ => 0.9,
    :sGDPppeoROCCLR_0 => -0.1,
    :sSTEeoRD_0 => 1,
    :SWI_in_1980__1_ => 1,
    :xTFP_observation_time_y => 4,
    :sGDPeoOSR_0 => -0.06,
    :Rate_of_decline_in_N2O_per_kg_fertiliser_1_per_y => 0.01,
    :Old_growth_forest_in_1980_Mha => 2600,
    :Renewable_capacity_up_time_kh_per_y => 3,
    :Public_services_per_person_in_1980_k__per_p_per_y => 0.58,
    :Time_to_observe_excess_demand_y => 1,
    :Urban_land_per_population_ha_per_p => 0.05,
    :Basic_income_tax_rate_workers__1_ => 0.2,
    :Acceptable_inequality__1_ => 0.6,
    :eight_khours_per_year => 8,
    :Soil_quality_index_in_1980__1_ => 1,
    :Extra_use_of_electricity_per_reduced_use_of_non_el_FF_MWh_per_toe => 3,
    :Transfer_rate_surface_abyss_in_1980_1_per_y => 0.01,
    :CO2_concentration_in_2022_ppm => 420,
    :Nuclear_capacity_up_time_kh_per_y => 8,
    :Land_erosion_rate_in_1980_1_per_y => 0.004,
    :LE_in_1980 => 67,
    :Average_wellbeing_perception_delay_y => 9,
    :Time_to_adjust_owner_consumption_y => 1,
    :Real_wage_erosion_rate_1_per_y => 0.015,
    :sFBeoCLE_0 => -0.03,
    :sPPReoSTE_0 => -15,
    :Cost_of_nuclear_el___per_kWh => 0.033,
    :Time_to_enter_per_leave_labor_market_y => 5,
    :Time_to_adjust_hours_worked_y => 5,
    :Kappa => 0.3,
    :Forestry_land_in_1980_Mha => 1100,
    :Workers_drawdown_period_y => 10,
    :Traditional_cost_of_fossil_fuel_for_non_el_use___per_toe => 240,
    :Job_creation_delay_y => 0.9,
    :sOWeoLE_0 => -0.02,
    :Urban_land_in_1980_Mha => 215,
    :Time_to_establish_growth_rate_y => 4,
    :sGWeoAW_0 => -0.58,
    :sOWeoACY_0 => -0.3,
    :sLPeoAWP_0 => 0.5,
    :sFUeoLER_0 => 0.02,
    :Construction_time_PUS_y => 1.5,
    :FINAL_TIME__ => 2100,
    :Warming_in_1980_deg_C => 0.4,
    :ROC_in_CLR_in_1980_1_per_y => 0.02,
    :Margin_in_1980__1_ => 0.25,
    :Inequality_in_1980__1_ => 0.61,
    :Minimum_relative_inventory_without_inflation__1_ => 1.07,
    :STD_in_fluctuation_around_normal__1_ => 0,
    :Aged_60__in_1980_Mp => 382,
    :Aged_0_20_in_1980_Mp => 2170,
    :Unconventional_stimulus_in_PIS_from_2022__share_of_GDP_ => 0.01,
    :Threshold_participation__1_ => 0.8,
    :Rate_of_decline_in_CH4_per_kg_crop_1_per_y => 0.01,
    :SSP2_family_action_from_2022___1_ => 1,
    :kg_N2O_per_kg_fertilizer_in_1980 => 0.11,
    :GDP_per_person_in_1980_k__per_p_per_y => 6.4,
    :Threshold_warming_deg_C => 1,
    :Normal_k__1_ => 0.3,
    :AWI_in_1980__1_ => 0.65,
    :Life_of_CH4_in_atm_y => 7.5,
    :Extra_ROC_in_food_sector_productivity_from_2022_1_per_y => 0,
    :Inflation_expectation_formation_time_y => 10,
    :GtN2O_per_ppm => 5,
    :Extra_general_tax_rate_from_2022__1_ => 0.01,
    :Social_trust_in_1980__1_ => 0.6,
    :sEDeoLOC_0 => 0.5,
    :CH4_in_atm_in_1980_GtCH4 => 2.5,
    :Owner_savings_fraction_in_1980 => 0.9,
    :Fertile_period_y => 20,
    :Transmission_cost___per_kWh => 0.02,
    :Extra_domestic_ROTA_from_2022_1_per_y => 0.003,
    :sPUNeoLPR_0 => 0.05,
    :Acceptable_progress_1_per_y => 0.02,
    :sWSOeoFRA_0 => -2.5,
    :Goal_for_crop_waste_reduction__1_ => 0.2,
    :Fraction_new_electrification_in_2022__1_ => 0.03,
)

inits = Dict{Symbol, Float64}(
    :Accumulated_sun_and_wind_capacity_from_1980_GW => p[:Sun_and_wind_capacity_in_1980_GW],
    :Aged_0_20_years_Mp => p[:Aged_0_20_in_1980_Mp],
    :Aged_20_40_years_Mp => p[:Aged_20_40_in_1980_Mp],
    :Aged_40_60_Mp => p[:Aged_40_60_in_1980_Mp],
    :Aged_60___Mp => p[:Aged_60__in_1980_Mp],
    :Average_hours_worked_in_1980_kh_per_y => p[:Normal_hours_worked_in_1980_kh_per_ftj_per_y] / p[:Persons_per_full_time_job_in_1980_p_per_ftj],
    :Basic_income_tax_rate_owners__1_ => min(1, p[:Income_tax_rate_owners_in_1980__1_] + ramp(p[:INITIAL_TIME__], (p[:Income_tax_rate_owners_in_2022__1_] - p[:Income_tax_rate_owners_in_1980__1_] ) / 42, 1980, 2022) + ramp(p[:INITIAL_TIME__],(p[:Goal_for_income_tax_rate_owners__1_] - p[:Income_tax_rate_owners_in_2022__1_] ) / 78, 2022, 2100) ),
    :Capacity_PIS_Gcu => p[:CAP_PIS_in_1980_Gcu],
    :Capacity_PUS_Gcu => p[:CAP_PUS_in_1980_Gcu],
    :Central_bank_signal_rate_1_per_y => p[:Normal_signal_rate_1_per_y],
    :CH4_in_atmosphere_GtCH4 => p[:CH4_in_atm_in_1980_GtCH4],
    :CO2_in_atmosphere_GtCO2 => p[:CO2_in_atm_in_1980_GtCO2],
    :Cropland_Mha => p[:Cropland_in_1980_Mha],
    :CUC_PIS_in_1980_Gcu => ( p[:CAP_PIS_in_1980_Gcu] / p[:Life_of_capacity_PIS_in_1980_y] ) * p[:Construction_time_PIS_y] * p[:Extra_mult_on_CUC__to_avoid_initial_transient_in_Investment_share_of_GDP],
    :Deaths_Mp_per_y => p[:Dying_in_1980_Mp_per_y],
    :Deaths_Mp_per_y1 => p[:Dying_in_1980_Mp_per_y],
    :Deaths_Mp_per_y2 => p[:Dying_in_1980_Mp_per_y],
    :Deaths_Mp_per_y3 => p[:Dying_in_1980_Mp_per_y],
    :Deaths_Mp_per_y4 => p[:Dying_in_1980_Mp_per_y],
    :Deaths_Mp_per_y5 => p[:Dying_in_1980_Mp_per_y],
    :Deaths_Mp_per_y6 => p[:Dying_in_1980_Mp_per_y],
    :Deaths_Mp_per_y7 => p[:Dying_in_1980_Mp_per_y],
    :Deaths_Mp_per_y8 => p[:Dying_in_1980_Mp_per_y],
    :Deaths_Mp_per_y9 => p[:Dying_in_1980_Mp_per_y],
    :Delivery_delay___index__1_ => 1,
    :Effective_GDP_per_person_k__per_p_per_y => p[:GDP_per_person_in_1980_k__per_p_per_y],
    :Embedded_CLR_k__per_j => p[:CLR_in_1980_k__per_j],
    :Embedded_CLR_kcu_per_ftj => p[:CLR_in_1980_kcu_per_ftj],
    :Embedded_TFP__1_ => p[:Embedded_TFP_in_1980__1_],
    :Expected_long_term_inflation_1_per_y => p[:Inflation_in_1980__1_per_y_],
    :Extra_cost_of_TAs_as_share_of_GDP__1_ => p[:xExtra_TA_cost_in_2022__share_of_GDP_] + ramp(p[:INITIAL_TIME__],(p[:xExtra_TA_cost_in_2100__share_of_GDP_] - p[:xExtra_TA_cost_in_2022__share_of_GDP_])/78, 2022, 2022 + 78),
    :Extra_energy_productivity_index_20221 => p[:Extra_energy_productivity_index_in_2022__1_],
    :Extra_heat_in_surface_ZJ => p[:Extra_heat_in_1980_ZJ],
    :Fertilizer_productivity_index__19801_ => exp(p[:ROC_in_fertilizer_productivity_1_per_y] * ( p[:INITIAL_TIME__] - 1980)),
    :Forestry_land_Mha => p[:Forestry_land_in_1980_Mha],
    :Fossil_electricity_capacity_GW => p[:Fossil_el_capacity_in_1980_GW],
    :Goal_for_fraction_of_govmnt_budget_to_workers__1_ => p[:Fraction_transferred_in_1980__1_] + IfElse.ifelse(p[:INITIAL_TIME__] > 2022, p[:Extra_transfer_of_govmnt_budget_to_workers__1_], 0),
    :Govmnt_debt_in_1980_G_ => 28087 * p[:Mult_to_avoid_transient_in_govmnt_finance],
    :Grazing_land_Mha => p[:Grazing_land_in_1980_Mha],
    :Ice_and_snow_cover_excl_G_A_Mkm2 => p[:Ice_and_snow_cover_excl_Greenland_and_Antarctica_in_1980_Mkm2],
    :Lambda => 1 - p[:Kappa],
    :Life_expectancy_multipler__1_ => IfElse.ifelse(p[:SSP2_family_action_from_2022___1_] > 0,  IfElse.ifelse(p[:INITIAL_TIME__] > 2022, 1 + ramp(p[:INITIAL_TIME__],(p[:Max_life_expectancy_multiplier__1_] - 1 )/78, 2022, 2100), 1),  1),
    :N2O_in_atmosphere_GtN2O => p[:N2O_in_atm_in_1980_GtN2O],
    :Normal_hours_worked_kh_per_ftj_per_y => p[:Normal_hours_worked_in_1980_kh_per_ftj_per_y],
    :Nuclear_capacity_GW => interpolate(p[:INITIAL_TIME__], [(1980.0,75.0),(2000.0,310.0),(2020.0,310.0),(2098.9,310.0)]),
    :Observed_rate_of_progress_1_per_y => 0,
    :Old_growth_forest_area_Mha_1 => p[:Old_growth_forest_in_1980_Mha],
    :Optimal_output_in_1980_Gu_per_y => p[:CAP_PIS_in_1980_Gcu] / p[:PCOR_PIS_cu_per_u_per_y] + p[:CAP_PUS_in_1980_Gcu] / p[:PCOR_PUS_cu_per_u_per_y],
    :Output_growth_rate_1_per_y => p[:Output_growth_in_1980_1_per_y__to_avoid_transient_],
    :Passing_20_Mp_per_y => p[:Passing_20_in_1980_Mp_per_y],
    :Passing_20_Mp_per_y1 => p[:Passing_20_in_1980_Mp_per_y],
    :Passing_20_Mp_per_y2 => p[:Passing_20_in_1980_Mp_per_y],
    :Passing_20_Mp_per_y3 => p[:Passing_20_in_1980_Mp_per_y],
    :Passing_20_Mp_per_y4 => p[:Passing_20_in_1980_Mp_per_y],
    :Passing_20_Mp_per_y5 => p[:Passing_20_in_1980_Mp_per_y],
    :Passing_20_Mp_per_y6 => p[:Passing_20_in_1980_Mp_per_y],
    :Passing_20_Mp_per_y7 => p[:Passing_20_in_1980_Mp_per_y],
    :Passing_20_Mp_per_y8 => p[:Passing_20_in_1980_Mp_per_y],
    :Passing_20_Mp_per_y9 => p[:Passing_20_in_1980_Mp_per_y],
    :Passing_40_Mp_per_y => p[:Passing_40_in_1980_Mp_per_y],
    :Passing_40_Mp_per_y1 => p[:Passing_40_in_1980_Mp_per_y],
    :Passing_40_Mp_per_y2 => p[:Passing_40_in_1980_Mp_per_y],
    :Passing_40_Mp_per_y3 => p[:Passing_40_in_1980_Mp_per_y],
    :Passing_40_Mp_per_y4 => p[:Passing_40_in_1980_Mp_per_y],
    :Passing_40_Mp_per_y5 => p[:Passing_40_in_1980_Mp_per_y],
    :Passing_40_Mp_per_y6 => p[:Passing_40_in_1980_Mp_per_y],
    :Passing_40_Mp_per_y7 => p[:Passing_40_in_1980_Mp_per_y],
    :Passing_40_Mp_per_y8 => p[:Passing_40_in_1980_Mp_per_y],
    :Passing_40_Mp_per_y9 => p[:Passing_40_in_1980_Mp_per_y],
    :Passing_60_Mp_per_y => p[:Passing_60_in_1980_Mp_per_y],
    :Passing_60_Mp_per_y1 => p[:Passing_60_in_1980_Mp_per_y],
    :Passing_60_Mp_per_y2 => p[:Passing_60_in_1980_Mp_per_y],
    :Passing_60_Mp_per_y3 => p[:Passing_60_in_1980_Mp_per_y],
    :Passing_60_Mp_per_y4 => p[:Passing_60_in_1980_Mp_per_y],
    :Passing_60_Mp_per_y5 => p[:Passing_60_in_1980_Mp_per_y],
    :Passing_60_Mp_per_y6 => p[:Passing_60_in_1980_Mp_per_y],
    :Passing_60_Mp_per_y7 => p[:Passing_60_in_1980_Mp_per_y],
    :Passing_60_Mp_per_y8 => p[:Passing_60_in_1980_Mp_per_y],
    :Passing_60_Mp_per_y9 => p[:Passing_60_in_1980_Mp_per_y],
    :Past_AWI__1_ => p[:AWI_in_1980__1_],
    :Perceived_excess_demand__1_ => 1,
    :Perceived_unemployment_rate__1_ => p[:Unemployment_rate_in_1980__1_],
    :Permanent_govmnt_cash_inflow_G__per_y => p[:GCI_in_1980],
    :Permanent_owner_cash_inflow_G__per_y => p[:OCI_in_1980],
    :Permanent_worker_cash_inflow_G__per_y => p[:WFI_in_1980],
    :Pink_noise_in_sales__1_ => rand(PinkGaussian(1, p[:Sampling_time_y]))[1],
    :Price_Index__19801_ => p[:Price_Index_in_1980__1_],
    :Price_per_unit___per_u => p[:Cost_per_unit_in_1980___per_u] * ( 1 + p[:Margin_in_1980__1_] ),
    :Renewable_electricity_capacity_GW => p[:Renewable_el_capacity_in_1980_GW],
    :Social_trust__1_ => p[:Social_trust_in_1980__1_],
    :Soil_quality_index_in_conv_ag__19801_ => p[:Soil_quality_index_in_1980__1_],
    :tCO2_per_toe => 2.8*exp(p[:ROC_in_tCO2_per_toe_1_per_y] * (p[:INITIAL_TIME__] -1980)),
    :TFP_excluding_effect_of_5TAs__1_ => p[:TFP_in_1980__1_],
    :TWh_el_per_EJ___engineering_equivalent => p[:TWh_heat_per_EJ___calorific_equivalent] * p[:Efficiency_of_fossil_power_plant_TWh_el_per_TWh_heat],
    :Urban_land_Mha => p[:Urban_land_in_1980_Mha],
    :Worker_share_of_output__1_ => p[:WSO_in_1980__1_],
    :Workers_debt_in_1980_G_ => 18992 * p[:Mult_to_avoid_transient_in_worker_finance],
    :Workforce_Mp => p[:Workforce_in_1980_Mp],
)

# Level 1
inits[:Number_of_doublings_in_sun_and_wind_capacity__1_] = log(2)+ log(inits[:Accumulated_sun_and_wind_capacity_from_1980_GW] / p[:Sun_and_wind_capacity_in_1980_GW])
inits[:Population_Mp] = inits[:Aged_0_20_years_Mp] + inits[:Aged_20_40_years_Mp] + inits[:Aged_40_60_Mp] + inits[:Aged_60___Mp]
inits[:Labour_use_in_1980_Gph_per_y] = p[:Workforce_in_1980_Mp] * inits[:Average_hours_worked_in_1980_kh_per_y]
inits[:threem_interest_rate_1_per_y] = inits[:Central_bank_signal_rate_1_per_y] + p[:Normal_basic_bank_margin_1_per_y]
inits[:Productivity_loss_from_unprofitable_activity__1_] = inits[:Extra_cost_of_TAs_as_share_of_GDP__1_] * p[:Fraction_unprofitable_activity_in_TAs__1_]
inits[:Observed_warming_deg_C] = p[:Warming_in_1980_deg_C] + ( inits[:Extra_heat_in_surface_ZJ] - p[:Extra_heat_in_1980_ZJ] ) * p[:Warming_from_extra_heat_deg_per_ZJ]
inits[:Fraction_of_govmnt_budget_to_workers__1_] = inits[:Goal_for_fraction_of_govmnt_budget_to_workers__1_]
inits[:Govmnt_debt_G_] = inits[:Govmnt_debt_in_1980_G_]
inits[:Average_hours_worked_kh_per_y] = inits[:Normal_hours_worked_kh_per_ftj_per_y] / p[:Persons_per_full_time_job_p_per_ftj]
inits[:Nuclear_electricity_production_TWh_per_y] = inits[:Nuclear_capacity_GW] * p[:Nuclear_capacity_up_time_kh_per_y]
inits[:Social_tension__1_] = 1 + p[:sPPReoSTE_0] * ( inits[:Observed_rate_of_progress_1_per_y] - p[:Acceptable_progress_1_per_y] )
inits[:Normal_corporate_credit_risk_1_per_y] = 0.02 * ( 1 + p[:sGReoCR_0] * ( inits[:Output_growth_rate_1_per_y] / 0.03 - 1 ))
inits[:ED_effect_on_flow_to_capacity_addition__1_] = 1 + p[:sEDeoFRA_0] * ( inits[:Perceived_excess_demand__1_] / p[:Excess_demand_in_1980__1_] - 1 )
inits[:Worker_consumption_demand_G__per_y] = inits[:Permanent_worker_cash_inflow_G__per_y] * p[:Worker_consumption_fraction__1_]
inits[:Demand_in_1980_G__per_y] = inits[:Optimal_output_in_1980_Gu_per_y] * inits[:Price_per_unit___per_u] * p[:SWI_in_1980__1_]
inits[:Discard_of_renewable_el_capacity_GW_per_y] = inits[:Renewable_electricity_capacity_GW] / p[:Life_of_renewable_el_capacity_y]
inits[:Renewable_electricity_production_TWh_per_y] = inits[:Renewable_electricity_capacity_GW] * p[:Renewable_capacity_up_time_kh_per_y]
inits[:four_TWh_el_per_Mtoe] = inits[:TWh_el_per_EJ___engineering_equivalent] / p[:Mtoe_per_EJ___calorific_equivalent]
inits[:Indicated_wage_effect_on_optimal_CLR__1_] = 1 + p[:sWSOeoCLR_0] * ( inits[:Worker_share_of_output__1_] / p[:WSO_in_1980__1_] - 1 )
inits[:Owner_savings_fraction__1_] = p[:Owner_savings_fraction_in_1980]  *  ( 1 + p[:sGDPeoOSR_0] *  ( inits[:Effective_GDP_per_person_k__per_p_per_y] / p[:GDP_per_person_in_1980_k__per_p_per_y] - 1 ))
inits[:INV_in_1980_Gu] = inits[:Optimal_output_in_1980_Gu_per_y] * p[:SWI_in_1980__1_] * p[:Desired_inventory_coverage_y]
inits[:Perceived_surplus_workforce__1_] = p[:Acceptable_unemployment_rate__1_] * ( 1 + p[:sPUNeoLPR_0] * ( inits[:Perceived_unemployment_rate__1_] / p[:Acceptable_unemployment_rate__1_]  - 1 ))
inits[:Govmnt_purchases_G__per_y] = inits[:Permanent_govmnt_cash_inflow_G__per_y] * p[:Government_consumption_fraction__1_]
inits[:Social_trust_effect_on_reform_delay__1_] = 1 + p[:sSTReoRD_0] * ( inits[:Social_trust__1_] / p[:Social_trust_in_1980__1_] - 1 )
inits[:Workers_debt_G_] = inits[:Workers_debt_in_1980_G_]
inits[:Food_sector_productivity_index__19801_] = exp(p[:ROC_in_food_sector_productivity_1_per_y] * ( p[:INITIAL_TIME__] - 1980)) * IfElse.ifelse(p[:INITIAL_TIME__] > 2022, exp( p[:ROC_in_food_sector_productivity_1_per_y]* ( p[:INITIAL_TIME__] - 2022)), 1)
inits[:Biofuels_use_Mtoe_per_y] = interpolate(p[:INITIAL_TIME__], [(1980.0,0.0),(1990.0,0.0),(2000.0,0.0),(2020.0,0.0),(2100.0,0.0)])
inits[:CH4_breakdown_GtCH4_per_y] = inits[:CH4_in_atmosphere_GtCH4] / p[:Life_of_CH4_in_atm_y]
inits[:Old_growth_removal_rate_multiplier__1_] = IfElse.ifelse(p[:INITIAL_TIME__] > 2022,  1 - p[:SSP2_land_management_action_from_2022___1_] * ramp(p[:INITIAL_TIME__],(1 - 0 )/78, 2022, 2100), 1)
inits[:Cropland_expansion_multiplier__1_] = IfElse.ifelse(p[:INITIAL_TIME__] > 2022,  1 - p[:SSP2_land_management_action_from_2022___1_] * ramp(p[:INITIAL_TIME__],(1 - 0 )/78, 2022, 2100), 1)
inits[:Forest_absorption_multipler__1_] = IfElse.ifelse(p[:INITIAL_TIME__] > 2022, 1 + p[:SSP2_land_management_action_from_2022___1_]* ramp(p[:INITIAL_TIME__],(p[:Max_forest_absorption_multiplier__1_] - 1)/78, 2022, 2100), 1)
inits[:Fraction_forestry_land_remaining__1_] = max(0, inits[:Forestry_land_Mha] / p[:Forestry_land_in_1980_Mha] )
inits[:Reduction_in_TFP_from_unprofitable_activity__1_] = inits[:Productivity_loss_from_unprofitable_activity__1_]

# Level 2
inits[:FFLReoOGRR] = max(1, 1 + p[:sFFLReoOGRR_0] * ( inits[:Fraction_forestry_land_remaining__1_] - p[:Threshold_FFLR__1_] ))
inits[:Cost_of_capital_for_secured_debt_1_per_y] = inits[:threem_interest_rate_1_per_y]+p[:Normal_bank_operating_margin_1_per_y]
inits[:Govmnt_borrowing_cost_1_per_y] = inits[:threem_interest_rate_1_per_y]
inits[:Labour_productivity_in_1980___per_ph] = ( inits[:Optimal_output_in_1980_Gu_per_y] * p[:Cost_per_unit_in_1980___per_u] ) / inits[:Labour_use_in_1980_Gph_per_y]
inits[:Cost_index_for_sun_and_wind_capacity__1_] = ( 1 - p[:Cost_reduction_per_doubling_of_sun_and_wind_capacity__1_] ) ^ inits[:Number_of_doublings_in_sun_and_wind_capacity__1_]
inits[:OWeoLOC__1_] = IfElse.ifelse(p[:INITIAL_TIME__] > 2022, 1 + p[:sOWeoLOC_0] * ( inits[:Observed_warming_deg_C] / p[:Observed_warming_in_2022_deg_C] - 1 ), 1)
inits[:Warming_effect_on_land_yield__1_] = IfElse.ifelse(p[:INITIAL_TIME__] > 2022, 1 + p[:sOWeoACY_0] * ( inits[:Observed_warming_deg_C] / p[:Observed_warming_in_2022_deg_C] - 1 ), 1)
inits[:OWeoLoCO2] = IfElse.ifelse(p[:INITIAL_TIME__] > 2022, 1 + p[:sOWeoLoCO2_0] * ( inits[:Observed_warming_deg_C] / p[:Observed_warming_in_2022_deg_C] - 1 ), 1)
inits[:Warming_effect_on_life_expectancy__1_] = IfElse.ifelse(p[:INITIAL_TIME__] > 2022, max(0, 1 + p[:sOWeoLE_0] *  ( inits[:Observed_warming_deg_C] / p[:Observed_warming_in_2022_deg_C] - 1 )), 1 )
inits[:Govmnt_payback_G__per_y] = inits[:Govmnt_debt_G_] / p[:Govmnt_payback_period_y]
inits[:Labour_use_Gph_per_y] = inits[:Workforce_Mp] * inits[:Average_hours_worked_kh_per_y]
inits[:Cost_of_nuclear_electricity_G__per_y] = inits[:Nuclear_electricity_production_TWh_per_y] * p[:Cost_of_nuclear_el___per_kWh]
inits[:Social_tension_effect_on_reform_delay__1_] = 1 + p[:sSTEeoRD_0] * ( inits[:Social_tension__1_] / p[:Social_tension_in_1980__1_] - 1 )
inits[:Sales_tax_workers_G__per_y] = inits[:Worker_consumption_demand_G__per_y] * p[:Sales_tax_rate__1_]
inits[:Effective_purchasing_power_G__per_y] = inits[:Demand_in_1980_G__per_y]
inits[:Recent_sales_Gu_per_y] = inits[:Demand_in_1980_G__per_y]
inits[:OPEX_renewable_el_G__per_y] = p[:OPEX_renewable_el___per_kWh] * inits[:Renewable_electricity_production_TWh_per_y]
inits[:Low_carbon_el_production_TWh_per_y] = inits[:Renewable_electricity_production_TWh_per_y] + inits[:Nuclear_electricity_production_TWh_per_y]
inits[:Owner_consumptin_fraction__1_] = 1 - inits[:Owner_savings_fraction__1_]
inits[:Inventory_Gu] = inits[:INV_in_1980_Gu]
inits[:Govmnt_investment_in_public_capacity_G__per_y] = inits[:Permanent_govmnt_cash_inflow_G__per_y] - inits[:Govmnt_purchases_G__per_y]
inits[:Crops_for_biofuel_Mt_crop_per_y] = inits[:Biofuels_use_Mtoe_per_y] * p[:Ton_crops_per_toe_biofuel]
inits[:CO2_from_CH4_GtCO2_per_y] = inits[:CH4_breakdown_GtCH4_per_y] * p[:tCO2_per_tCH4]
inits[:CO2_absorption_in_forestry_land_tCO2_per_ha_per_y] = 1.6 * inits[:Forest_absorption_multipler__1_]
inits[:Acceptable_loss_of_forestry_land__1_] = 1 - exp(-inits[:Fraction_forestry_land_remaining__1_] / p[:Threshold_FFLR__1_])
inits[:Corporate_borrowing_cost_in_1980_1_per_y] = p[:Normal_signal_rate_1_per_y] + p[:Normal_basic_bank_margin_1_per_y] + p[:Normal_bank_operating_margin_1_per_y] + inits[:Normal_corporate_credit_risk_1_per_y]

# Level 3
inits[:Inventory_coverage_y] = inits[:Inventory_Gu] / inits[:Recent_sales_Gu_per_y]
inits[:Indicated_reform_delay_y] = p[:Normal_reform_delay_y]  * inits[:Social_trust_effect_on_reform_delay__1_] * inits[:Social_tension_effect_on_reform_delay__1_]
inits[:CAPEX_renewable_el___per_W] = p[:CAPEX_renewable_el_in_1980___per_W] * inits[:Cost_index_for_sun_and_wind_capacity__1_]
inits[:Optimal_real_output_Gu_per_y] = inits[:Optimal_output_in_1980_Gu_per_y] *  ( ( inits[:Capacity_PIS_Gcu] + inits[:Capacity_PUS_Gcu] ) / ( p[:CAP_PIS_in_1980_Gcu] + p[:CAP_PUS_in_1980_Gcu]) )^p[:Kappa] *  ( inits[:Labour_use_Gph_per_y] / inits[:Labour_use_in_1980_Gph_per_y] )^inits[:Lambda]  *  ( inits[:Embedded_TFP__1_] )
inits[:Corporate_borrowing_cost_1_per_y] = inits[:Cost_of_capital_for_secured_debt_1_per_y] + inits[:Normal_corporate_credit_risk_1_per_y]
inits[:Life_of_capacity_PUS_in_1980_y] = 15 * inits[:OWeoLOC__1_]
inits[:Wage_rate_in_1980___per_ph] = inits[:Labour_productivity_in_1980___per_ph] * p[:WSO_in_1980__1_]
inits[:Govmnt_spending_G__per_y] = inits[:Govmnt_purchases_G__per_y] + inits[:Govmnt_investment_in_public_capacity_G__per_y]
inits[:Govmnt_interest_cost_G__per_y] = inits[:Govmnt_debt_G_] * inits[:Govmnt_borrowing_cost_1_per_y]
inits[:Owner_consumption_G__per_y] = inits[:Permanent_owner_cash_inflow_G__per_y] * inits[:Owner_consumptin_fraction__1_]
inits[:Life_of_extra_CO2_in_atm_y] = p[:Life_of_extra_CO2_in_atm_in_1980_y] * inits[:OWeoLoCO2]
inits[:Old_growth_removal_rate_1_per_y] = p[:OGRR_in_1980_1_per_y] * inits[:FFLReoOGRR]
inits[:Life_expectancy_y] = ( ( p[:LEmax] - (p[:LEmax] - p[:LE_in_1980]) * exp(- p[:LEgamma] * (inits[:Effective_GDP_per_person_k__per_p_per_y] - p[:GDP_per_person_in_1980_k__per_p_per_y])) ) * ( 1 + p[:LEalfa] * ( inits[:Effective_GDP_per_person_k__per_p_per_y] - p[:GDP_per_person_in_1980_k__per_p_per_y] )) ) * inits[:Warming_effect_on_life_expectancy__1_] * inits[:Life_expectancy_multipler__1_]
inits[:Perceived_relative_inventory__1_] = inits[:Inventory_coverage_y] / p[:Desired_inventory_coverage_y]
inits[:Reform_delay_y] = inits[:Indicated_reform_delay_y]
inits[:Deliveries_Gu_per_y] = ( ( inits[:Effective_purchasing_power_G__per_y] / inits[:Price_per_unit___per_u] ) / ( inits[:Delivery_delay___index__1_] / p[:DDI_in_1980_y] ) ) * IfElse.ifelse(p[:INITIAL_TIME__] > 1984, inits[:Pink_noise_in_sales__1_], 1)
inits[:CBC_effect_on_flow_to_capacity_addion__1_] = 1 + p[:sCBCeoFRA_0] * (inits[:Corporate_borrowing_cost_1_per_y] / inits[:Corporate_borrowing_cost_in_1980_1_per_y] - 1 )
inits[:CUC_PUS_in_1980_Gcu] = ( p[:CAP_PUS_in_1980_Gcu] / inits[:Life_of_capacity_PUS_in_1980_y] ) * p[:Construction_time_PUS_y] * p[:Extra_mult_on_CUC__to_avoid_initial_transient_in_Investment_share_of_GDP]
inits[:Wage_rate___per_ph] = inits[:Wage_rate_in_1980___per_ph]
inits[:Public_spending_per_person_k__per_p_per_y] = inits[:Govmnt_spending_G__per_y] / inits[:Population_Mp]
inits[:Sales_tax_owners_G__per_y] = inits[:Owner_consumption_G__per_y] * p[:Sales_tax_rate__1_]
inits[:CO2_absorption_GtCO2_per_y] = ( inits[:CO2_in_atmosphere_GtCO2] - p[:CO2_in_atm_in_1850_GtCO2] ) / inits[:Life_of_extra_CO2_in_atm_y]
inits[:CO2_concentration_in_atm_ppm] = inits[:CO2_in_atmosphere_GtCO2] / p[:GtCO2_per_ppm]
inits[:Old_growth_removal_Mha_per_y] = inits[:Old_growth_forest_area_Mha_1] * inits[:Old_growth_removal_rate_1_per_y] * inits[:Old_growth_removal_rate_multiplier__1_]
inits[:Desired_shifts_worked___index__1_] = 1 + p[:sINVeoSWI_0] * (inits[:Perceived_relative_inventory__1_] / p[:Desired_relative_inventory__1_] - 1 )
inits[:Introduction_period_for_policy_y] = IfElse.ifelse(p[:Exogenous_introduction_period_] > 0, p[:Exogenous_introduction_period_y], inits[:Reform_delay_y])
inits[:Crop_waste_reduction__1_] = ramp(p[:INITIAL_TIME__], p[:Goal_for_crop_waste_reduction__1_] / inits[:Introduction_period_for_policy_y] , 2022, 2022 + inits[:Introduction_period_for_policy_y] )
inits[:Sales_G__per_y] = inits[:Deliveries_Gu_per_y] * inits[:Price_per_unit___per_u]
inits[:Capacity_under_construction_PUS_Gcu] = inits[:CUC_PUS_in_1980_Gcu]
inits[:Sales_tax_G__per_y] = inits[:Sales_tax_workers_G__per_y] + inits[:Sales_tax_owners_G__per_y]
inits[:CO2_effect_on_land_yield__1_] = IfElse.ifelse(p[:INITIAL_TIME__] > 2022, 1 + p[:sCO2CeoACY_0] * ( inits[:CO2_concentration_in_atm_ppm] / p[:CO2_concentration_in_2022_ppm] - 1 ), 1)
inits[:Shifts_worked___index__1_] = inits[:Desired_shifts_worked___index__1_]
inits[:Extra_pension_age_y] = ramp(p[:INITIAL_TIME__], (p[:Goal_for_extra_pension_age_y] - p[:Extra_pension_age_in_2022_y] ) / inits[:Introduction_period_for_policy_y], 2022, 22022 + inits[:Introduction_period_for_policy_y])
inits[:Fraction_of_CO2_sources_with_CCS__1_] = p[:Fraction_of_CO2_sources_with_CCS_in_2022__1_] + ramp(p[:INITIAL_TIME__],(p[:Goal_for_fraction_of_CO2_sources_with_CCS__1_] - p[:Fraction_of_CO2_sources_with_CCS_in_2022__1_] ) / inits[:Introduction_period_for_policy_y] , 2022 , 2022 + inits[:Introduction_period_for_policy_y])
inits[:Fraction_new_electrification__1_] = p[:Fraction_new_electrification_in_1980__1_] + ramp(p[:INITIAL_TIME__],(p[:Fraction_new_electrification_in_2022__1_] - p[:Fraction_new_electrification_in_1980__1_] ) / 42, 1980, 2022) + ramp(p[:INITIAL_TIME__],( p[:Goal_for_fraction_new_electrification__1_] - p[:Fraction_new_electrification_in_2022__1_] ) / inits[:Introduction_period_for_policy_y] , 2022, 2022 + inits[:Introduction_period_for_policy_y])
inits[:Direct_air_capture_of_CO2_GtCO2_per_y] = IfElse.ifelse(p[:INITIAL_TIME__] > 2022,  ramp(p[:INITIAL_TIME__],(p[:Direct_air_capture_of_CO2_in_2100_GtCO2_per_y] ) / inits[:Introduction_period_for_policy_y] , 2022, 2022 + inits[:Introduction_period_for_policy_y]) , 0 )
inits[:Fraction_regenerative_agriculture__1_] = ramp(p[:INITIAL_TIME__], p[:Goal_for_fraction_regenerative_agriculture__1_] / inits[:Introduction_period_for_policy_y], 2022, 2020 + inits[:Introduction_period_for_policy_y])
inits[:Desired_renewable_electricity_share__1_] = p[:Renewable_el_fraction_in_1980__1_] + ramp(p[:INITIAL_TIME__],(p[:Renewable_el_fraction_in_2022__1_] - p[:Renewable_el_fraction_in_1980__1_] ) / 42, 1980, 2022) + ramp(p[:INITIAL_TIME__],(p[:Goal_for_renewable_el_fraction__1_] - p[:Renewable_el_fraction_in_2022__1_] ) / inits[:Introduction_period_for_policy_y], 2022, 2022 + inits[:Introduction_period_for_policy_y] )
inits[:Fraction_new_red_meat__1_] = ramp(p[:INITIAL_TIME__], p[:Goal_for_fraction_new_red_meat__1_] / inits[:Introduction_period_for_policy_y], 2022, 2022 + inits[:Introduction_period_for_policy_y])
inits[:Extra_normal_LPR_from_2022__1_] = ramp(p[:INITIAL_TIME__], p[:Goal_for_extra_normal_LPR__1_] / inits[:Introduction_period_for_policy_y], 2022, 2022 + inits[:Introduction_period_for_policy_y])
inits[:National_income_G__per_y] = inits[:Sales_G__per_y]
inits[:Grazing_land_yied_in_1980_kg_red_meat_per_ha_per_y] = 14 * inits[:CO2_effect_on_land_yield__1_] * inits[:Warming_effect_on_land_yield__1_]
inits[:CO2_absorption_in_forestry_land_GtCO2_per_y] = inits[:Forestry_land_Mha]  * (inits[:CO2_absorption_in_forestry_land_tCO2_per_ha_per_y] / 1000 ) * inits[:CO2_effect_on_land_yield__1_] * inits[:Warming_effect_on_land_yield__1_]
inits[:Output_Gu_per_y] = inits[:Optimal_real_output_Gu_per_y] * inits[:Shifts_worked___index__1_] / p[:SWI_in_1980__1_]
inits[:Pension_age_y] = IfElse.ifelse(inits[:Life_expectancy_y] < p[:LE_in_1980], p[:Pension_age_in_1980_y], p[:Pension_age_in_1980_y] + p[:sLEeoPa_0] * ( inits[:Life_expectancy_y] + inits[:Extra_pension_age_y]  - p[:LE_in_1980] ))
inits[:Cost_of_air_capture_G__per_y] = inits[:Direct_air_capture_of_CO2_GtCO2_per_y] * p[:Cost_of_CCS___per_tCO2]
inits[:Crop_supply_reg_ag_Mt_crop_per_y] = p[:Crop_yield_in_reg_ag_t_crop_per_ha_per_y] * inits[:Cropland_Mha] * inits[:Fraction_regenerative_agriculture__1_]
inits[:Regenerative_agriculture_area_Mha] = inits[:Cropland_Mha] * inits[:Fraction_regenerative_agriculture__1_]
inits[:Normal_LPR__1_] = (p[:Normal_LPR_in_1980__1_]  * (1 + p[:sWSOeoLPR_0] * ( inits[:Worker_share_of_output__1_] / p[:WSO_in_1980__1_] - 1 ))) + inits[:Extra_normal_LPR_from_2022__1_]
inits[:Extra_general_tax_from_2022_G__per_y] = IfElse.ifelse(p[:INITIAL_TIME__] > 2022, p[:Extra_general_tax_rate_from_2022__1_] + p[:Extra_empowerment_tax_from_2022__share_of_NI_] + p[:Extra_pension_tax_from_2022__share_of_NI_], 0) * inits[:National_income_G__per_y]
inits[:Income_from_commons_from_2022_G__per_y] = inits[:National_income_G__per_y] * IfElse.ifelse(p[:INITIAL_TIME__] > 2022,  ramp(p[:INITIAL_TIME__], p[:Goal_for_extra_income_from_commons__share_of_NI_] / inits[:Introduction_period_for_policy_y] , 2022, 2020 + inits[:Introduction_period_for_policy_y]) , 0)
inits[:Max_govmnt_debt_G_] = inits[:National_income_G__per_y] * p[:Max_govmnt_debt_burden_y]
inits[:Income_tax_workers__1_] = p[:Basic_income_tax_rate_workers__1_]  * inits[:National_income_G__per_y] * inits[:Worker_share_of_output__1_]
inits[:Income_tax_owners__1_] = inits[:Basic_income_tax_rate_owners__1_] * inits[:National_income_G__per_y] * ( 1 - inits[:Worker_share_of_output__1_])
inits[:Grazing_land_yield_kg_red_meat_per_ha_per_y] = inits[:Grazing_land_yied_in_1980_kg_red_meat_per_ha_per_y] + 0 * inits[:CO2_concentration_in_atm_ppm] - 0 * inits[:Observed_warming_deg_C]
inits[:GDP_G__per_y] = inits[:Output_Gu_per_y] * inits[:Price_per_unit___per_u]
inits[:Labour_productivity___per_ph] = ( inits[:Output_Gu_per_y] * inits[:Price_per_unit___per_u] ) / inits[:Labour_use_Gph_per_y]
inits[:On_pension_Mp] = inits[:Aged_60___Mp] * (inits[:Life_expectancy_y] - inits[:Pension_age_y] ) / ( inits[:Life_expectancy_y] - 60 )
inits[:Extra_CO2_absorption_in_reg_ag_GtCO2_per_y] = inits[:Regenerative_agriculture_area_Mha] * p[:CO2_absorbed_in_reg_ag_tCO2_per_ha_per_y] / 1000
inits[:Number_of_doublings_in_reg_ag__1_] = log(( inits[:Regenerative_agriculture_area_Mha] + p[:Experience_gained_before_2022_Mha] ) / p[:Experience_gained_before_2022_Mha]) / 0.693
inits[:Indicated_labour_participation_rate__1_] = inits[:Normal_LPR__1_] - inits[:Perceived_surplus_workforce__1_]
inits[:Govmnt_new_debt_G__per_y] = max(0, ( inits[:Max_govmnt_debt_G_] - inits[:Govmnt_debt_G_] ) / p[:Govmnt_drawdown_period_y]) + WorldDynamics.step(p[:INITIAL_TIME__], p[:Govmnt_stimulus_from_2022__share_of_NI_], 2022 ) * inits[:National_income_G__per_y]
inits[:Potential_red_meat_from_grazing_land_Mt_red_meat_per_y] = inits[:Grazing_land_Mha] * inits[:Grazing_land_yield_kg_red_meat_per_ha_per_y] / 1000
inits[:GDP_per_person_k__per_p_per_y] = inits[:GDP_G__per_y] / inits[:Population_Mp]
inits[:Wage_share__1_] = inits[:Wage_rate___per_ph] / inits[:Labour_productivity___per_ph]
inits[:Aged_20_pension_age_Mp] = inits[:Aged_20_40_years_Mp] + inits[:Aged_40_60_Mp] + inits[:Aged_60___Mp] - inits[:On_pension_Mp]
inits[:Cost_index_for_Regenerative_agriculture__1_] = ( 1 - p[:Cost_reduction_per_doubling_in_Regenerative_agriculture__1_] ) ^ inits[:Number_of_doublings_in_reg_ag__1_]
inits[:Labour_participation_rate__1_] = inits[:Indicated_labour_participation_rate__1_]
inits[:Cash_flow_from_govmnt_to_banks_G__per_y] = inits[:Govmnt_interest_cost_G__per_y] + inits[:Govmnt_payback_G__per_y] - inits[:Govmnt_new_debt_G__per_y]
inits[:Non_fossil_CO2_per_person_tCO2_per_p_per_y] = p[:Max_non_fossil_CO2_per_person_tCO2_per_p_per_y] * ( 1 - exp(-(inits[:GDP_per_person_k__per_p_per_y] / 10)))
inits[:Traditional_per_person_use_of_fossil_fuels_for_non_el_use_before_EE_toe_per_p_per_y] = interpolate(inits[:GDP_per_person_k__per_p_per_y], [(0.0,0.3),(15.0,2.0),(25.0,3.1),(35.0,4.0),(50.0,5.0)])
inits[:FRACA_mult_from_GDPpp___Line__1_] = max(p[:FRACA_min], 1 + p[:sGDPppeoFRACA_0] * ( inits[:GDP_per_person_k__per_p_per_y] / p[:GDP_per_person_in_1980] - 1 ))
inits[:Public_spending_as_share_of_GDP] = inits[:Public_spending_per_person_k__per_p_per_y] / inits[:GDP_per_person_k__per_p_per_y]
inits[:Traditional_per_person_use_of_electricity_before_EE_MWh_per_p_per_y] = interpolate(inits[:GDP_per_person_k__per_p_per_y], [(0.0,0.0),(10.0,4.0),(20.0,7.0),(30.0,9.0),(50.0,12.0),(65.0,13.0)])
inits[:Traditional_use_of_crops_per_person_kg_crop_per_p_per_y] = interpolate(inits[:GDP_per_person_k__per_p_per_y], [(0.0,400.0),(6.1,680.0),(8.7,780.0),(13.9,950.0),(20.0,1050.0),(30.0,1150.0),(40.0,1250.0),(60.0,1350.0),(100.0,1550.0)])
inits[:Traditional_use_of_red_meat_per_person_kg_red_meat_per_p_per_y] = interpolate(inits[:GDP_per_person_k__per_p_per_y], [(0.0,0.0),(6.1,6.0),(8.8,8.5),(14.0,13.0),(30.0,27.0),(40.0,32.0),(50.0,33.0),(100.0,25.0)])
inits[:WSO_effect_on_flow_to_capacity_addition__1_] = 1 + p[:sWSOeoFRA_0] * (inits[:Wage_share__1_] / p[:WSO_in_1980__1_] - 1 )
inits[:Working_age_population_Mp] = inits[:Aged_20_pension_age_Mp]
inits[:Extra_cost_of_reg_ag___per_ha_per_y] = p[:Extra_cost_of_reg_ag_in_2022___per_ha_per_y] * inits[:Cost_index_for_Regenerative_agriculture__1_]
inits[:CO2_from_non_fossil_industrial_processes_GtCO2_per_y] = ( inits[:Non_fossil_CO2_per_person_tCO2_per_p_per_y] / 1000 ) * inits[:Population_Mp] * ( 1 - inits[:Fraction_of_CO2_sources_with_CCS__1_])
inits[:Demand_for_fossil_fuel_for_non_el_use_before_NE_Mtoe_per_y] = ( inits[:Population_Mp] * inits[:Traditional_per_person_use_of_fossil_fuels_for_non_el_use_before_EE_toe_per_p_per_y]  * exp(-p[:Normal_increase_in_energy_efficiency_1_per_y] * ( p[:INITIAL_TIME__] - 1980 ))) / inits[:Extra_energy_productivity_index_20221]
inits[:Demand_for_electricity_before_NE_TWh_per_y] = ( inits[:Population_Mp]  * inits[:Traditional_per_person_use_of_electricity_before_EE_MWh_per_p_per_y]  * exp(-p[:Normal_increase_in_energy_efficiency_1_per_y] * ( p[:INITIAL_TIME__] - 1980))) / inits[:Extra_energy_productivity_index_20221]
inits[:Traditional_use_of_crops_Mt_per_y] = inits[:Traditional_use_of_crops_per_person_kg_crop_per_p_per_y] * inits[:Population_Mp] / 1000
inits[:Demand_for_red_meat_per_person_kg_red_meat_per_p_per_y] = inits[:Traditional_use_of_red_meat_per_person_kg_red_meat_per_p_per_y]
inits[:Available_workforce_Mp] = inits[:Working_age_population_Mp] * inits[:Labour_participation_rate__1_]
inits[:Cost_of_regenerative_agriculture_G__per_y] = ( inits[:Extra_cost_of_reg_ag___per_ha_per_y] * inits[:Regenerative_agriculture_area_Mha] ) / 1000
inits[:Extra_reduction_in_demand_for_non_el_fossil_fuel_from_NE_Mtoe_per_y] = inits[:Fraction_new_electrification__1_] * inits[:Demand_for_fossil_fuel_for_non_el_use_before_NE_Mtoe_per_y]
inits[:Demand_for_red_meat_Mt_red_meat_per_y] = ( ( inits[:Population_Mp] * inits[:Demand_for_red_meat_per_person_kg_red_meat_per_p_per_y] ) / 1000 ) * ( 1 - inits[:Fraction_new_red_meat__1_] )
inits[:Unemployed_Mp] = max(0, inits[:Available_workforce_Mp] - inits[:Workforce_Mp])
inits[:Demand_for_fossil_fuel_for_non_el_use_Mtoe_per_y] = inits[:Demand_for_fossil_fuel_for_non_el_use_before_NE_Mtoe_per_y] -  inits[:Extra_reduction_in_demand_for_non_el_fossil_fuel_from_NE_Mtoe_per_y]
inits[:Cost_of_new_electrification_G__per_y] = ( p[:Extra_cost_per_reduced_use_of_non_el_FF___per_toe] / 1000 ) * inits[:Extra_reduction_in_demand_for_non_el_fossil_fuel_from_NE_Mtoe_per_y]
inits[:Extra_increase_in_demand_for_electricity_from_NE_TWh_per_y] = inits[:Extra_reduction_in_demand_for_non_el_fossil_fuel_from_NE_Mtoe_per_y] * p[:Extra_use_of_electricity_per_reduced_use_of_non_el_FF_MWh_per_toe]
inits[:Red_meat_from_grazing_land_Mt_red_meat_per_y] = min(inits[:Demand_for_red_meat_Mt_red_meat_per_y], inits[:Potential_red_meat_from_grazing_land_Mt_red_meat_per_y])
inits[:Unemployment_rate__1_] = inits[:Unemployed_Mp] / inits[:Available_workforce_Mp]
inits[:Cost_of_fossil_fuel_for_non_el_use_G__per_y] = (inits[:Demand_for_fossil_fuel_for_non_el_use_Mtoe_per_y] *  p[:Traditional_cost_of_fossil_fuel_for_non_el_use___per_toe] ) /1000
inits[:Demand_for_electricity_TWh_per_y] = inits[:Demand_for_electricity_before_NE_TWh_per_y] + inits[:Extra_increase_in_demand_for_electricity_from_NE_TWh_per_y]
inits[:Red_meat_from_feedlots_Mt_red_meat_per_y] = inits[:Demand_for_red_meat_Mt_red_meat_per_y] - inits[:Red_meat_from_grazing_land_Mt_red_meat_per_y]
inits[:Traditional_use_of_feed_for_red_meat_Mt_crop_per_y] = (((inits[:Traditional_use_of_crops_per_person_kg_crop_per_p_per_y] / 1000) * inits[:Population_Mp] ) - inits[:Red_meat_from_grazing_land_Mt_red_meat_per_y] )*p[:kg_crop_per_kg_red_meat]
inits[:Demand_for_fossil_electricity_TWh_per_y] = max(0, inits[:Demand_for_electricity_TWh_per_y] - inits[:Low_carbon_el_production_TWh_per_y])
inits[:Desired_supply_of_renewable_electricity_TWh_per_y] = inits[:Demand_for_electricity_TWh_per_y] * inits[:Desired_renewable_electricity_share__1_]
inits[:Feed_for_red_meat_Mt_crop_per_y] = inits[:Red_meat_from_feedlots_Mt_red_meat_per_y] * p[:kg_crop_per_kg_red_meat]
inits[:Traditional_use_of_crops_ex_red_meat_Mt_per_y] = ( inits[:Traditional_use_of_crops_Mt_per_y] - inits[:Traditional_use_of_feed_for_red_meat_Mt_crop_per_y] ) / inits[:Food_sector_productivity_index__19801_]
inits[:Fossil_capacity_up_time_kh_per_y] = inits[:Demand_for_fossil_electricity_TWh_per_y] / inits[:Fossil_electricity_capacity_GW]
inits[:Desired_fossil_el_capacity_GW] = inits[:Demand_for_fossil_electricity_TWh_per_y] / p[:eight_khours_per_year]
inits[:Desired_renewable_el_capacity_GW] = inits[:Desired_supply_of_renewable_electricity_TWh_per_y] / p[:Renewable_capacity_up_time_kh_per_y]
inits[:Crop_demand_Mt_crop_per_y] = (inits[:Traditional_use_of_crops_ex_red_meat_Mt_per_y] + inits[:Feed_for_red_meat_Mt_crop_per_y] + inits[:Crops_for_biofuel_Mt_crop_per_y])
inits[:Fossil_electricity_production_TWh_per_y] = inits[:Fossil_electricity_capacity_GW] * inits[:Fossil_capacity_up_time_kh_per_y]
inits[:FCUTeoLOFC__1_] = 1 + p[:sFCUTeoLOFC_0] * ( (inits[:Fossil_capacity_up_time_kh_per_y] / p[:eight_khours_per_year] ) - 1 )
inits[:Desired_renewable_el_capacity_change_GW] = inits[:Desired_renewable_el_capacity_GW] - inits[:Renewable_electricity_capacity_GW]
inits[:Desired_crop_supply_Mt_crop_per_y] = inits[:Crop_demand_Mt_crop_per_y]
inits[:OPEX_fossil_el_G__per_y] = p[:OPEX_fossil_el___per_kWh] * inits[:Fossil_electricity_production_TWh_per_y]
inits[:Electricity_production_TWh_per_y] = inits[:Fossil_electricity_production_TWh_per_y] + inits[:Nuclear_electricity_production_TWh_per_y] + inits[:Renewable_electricity_production_TWh_per_y]
inits[:Fossil_fuels_for_electricity_Mtoe_per_y] = inits[:Fossil_electricity_production_TWh_per_y] / inits[:four_TWh_el_per_Mtoe]
inits[:Life_of_fossil_el_capacity_y] = p[:Normal_life_of_fossil_el_capacity_y] * inits[:FCUTeoLOFC__1_]
inits[:Addition_of_renewable_el_capacity_GW_per_y] = max(0, ( inits[:Desired_renewable_el_capacity_change_GW] / p[:Renewable_el_construction_time_y] ) + ( inits[:Discard_of_renewable_el_capacity_GW_per_y] ))
inits[:Desired_crop_supply_conv_ag_Mt_crop_per_y] = inits[:Desired_crop_supply_Mt_crop_per_y] - inits[:Crop_supply_reg_ag_Mt_crop_per_y]
inits[:Cost_of_grid_G__per_y] = inits[:Electricity_production_TWh_per_y] * p[:Transmission_cost___per_kWh]
inits[:Use_of_fossil_fuels_Mtoe_per_y] = inits[:Demand_for_fossil_fuel_for_non_el_use_Mtoe_per_y] + inits[:Fossil_fuels_for_electricity_Mtoe_per_y]
inits[:Discard_of_fossil_el_capacity_GW_per_y] = inits[:Fossil_electricity_capacity_GW] / inits[:Life_of_fossil_el_capacity_y]
inits[:CAPEX_renewable_el_G__per_y] = inits[:CAPEX_renewable_el___per_W] * inits[:Addition_of_renewable_el_capacity_GW_per_y]
inits[:Desired_crop_yield_in_conv_ag_t_crop_per_ha_per_y] = inits[:Desired_crop_supply_conv_ag_Mt_crop_per_y] / ( inits[:Cropland_Mha] * ( 1 - inits[:Fraction_regenerative_agriculture__1_] ))
inits[:CO2_from_energy_production_GtCO2_per_y] = inits[:Use_of_fossil_fuels_Mtoe_per_y] * ( inits[:tCO2_per_toe] / 1000 ) *  ( 1 - inits[:Fraction_of_CO2_sources_with_CCS__1_] )
inits[:Desired_fossil_el_capacity_change_GW_per_y] = ( inits[:Desired_fossil_el_capacity_GW] - inits[:Fossil_electricity_capacity_GW] ) / p[:Fossil_el_cap_construction_time_y] + inits[:Discard_of_fossil_el_capacity_GW_per_y]
inits[:Cost_of_renewable_electricity_G__per_y] = inits[:CAPEX_renewable_el_G__per_y] + inits[:OPEX_renewable_el_G__per_y]
inits[:Average_crop_yield_t_crop_per_ha_per_y] = ( inits[:Desired_crop_yield_in_conv_ag_t_crop_per_ha_per_y] * ( 1 - inits[:Fraction_regenerative_agriculture__1_] ) * inits[:Soil_quality_index_in_conv_ag__19801_] + p[:Crop_yield_in_reg_ag_t_crop_per_ha_per_y] * inits[:Fraction_regenerative_agriculture__1_] ) * inits[:CO2_effect_on_land_yield__1_] * inits[:Warming_effect_on_land_yield__1_]
inits[:Traditional_fertilizer_use_in_conv_ag_kgN_per_ha_per_y] = interpolate(inits[:Desired_crop_yield_in_conv_ag_t_crop_per_ha_per_y], [(1.0,0.0),(2.0,40.0),(2.5,50.0),(3.0,60.0),(3.5,70.0),(4.5,100.0),(6.5,200.0),(10.0,600.0)])
inits[:Installed_CCS_capacity_GtCO2_per_y] = inits[:Fraction_of_CO2_sources_with_CCS__1_] * ( inits[:CO2_from_non_fossil_industrial_processes_GtCO2_per_y] + inits[:CO2_from_energy_production_GtCO2_per_y] ) / (1 - inits[:Fraction_of_CO2_sources_with_CCS__1_] )
inits[:CO2_from_energy_and_industry_GtCO2_per_y] = inits[:CO2_from_energy_production_GtCO2_per_y] + inits[:CO2_from_non_fossil_industrial_processes_GtCO2_per_y]
inits[:Addition_of_fossil_el_capacity_GW_per_y] = max(0, inits[:Desired_fossil_el_capacity_change_GW_per_y])
inits[:Crop_supply__after_20___waste__Mt_crop_per_y] = inits[:Average_crop_yield_t_crop_per_ha_per_y] * inits[:Cropland_Mha]
inits[:Fertilizer_use_in_conv_ag_kgN_per_ha_per_y] =  inits[:Traditional_fertilizer_use_in_conv_ag_kgN_per_ha_per_y] / inits[:Fertilizer_productivity_index__19801_]
inits[:Cost_of_CCS_G__per_y] = inits[:Installed_CCS_capacity_GtCO2_per_y] * p[:Cost_of_CCS___per_tCO2]
inits[:CAPEX_fossil_el_G__per_y] = p[:CAPEX_fossil_el___per_W] * inits[:Addition_of_fossil_el_capacity_GW_per_y]
inits[:Crop_use_Mt_per_y] = inits[:Crop_supply__after_20___waste__Mt_crop_per_y] * ( 1 + inits[:Crop_waste_reduction__1_] )
inits[:Fertilizer_use_Mt_per_y] = inits[:Cropland_Mha] * ( 1 - inits[:Fraction_regenerative_agriculture__1_] ) * inits[:Fertilizer_use_in_conv_ag_kgN_per_ha_per_y]/ 1000
inits[:Cost_of_fossil_electricity_G__per_y] = inits[:CAPEX_fossil_el_G__per_y] + inits[:OPEX_fossil_el_G__per_y]
inits[:Crop_balance__1_] = inits[:Crop_use_Mt_per_y] / inits[:Desired_crop_supply_Mt_crop_per_y]
inits[:Cost_of_fertilizer_G__per_y] = inits[:Fertilizer_use_Mt_per_y] * p[:Cost_per_ton_fertilizer___per_t] / 1000
inits[:Cost_of_electricity_G__per_y] = inits[:Cost_of_fossil_electricity_G__per_y] + inits[:Cost_of_renewable_electricity_G__per_y] + inits[:Cost_of_nuclear_electricity_G__per_y]
inits[:Perceived_crop_balance__1_] = inits[:Crop_balance__1_]/ (1 + p[:Desired_reserve_capacity__1_] )
inits[:Cost_of_food_G__per_y] = p[:Agriculture_as_fraction_of_GDP__1_] * inits[:GDP_G__per_y] + inits[:Cost_of_regenerative_agriculture_G__per_y] + inits[:Cost_of_fertilizer_G__per_y]
inits[:Cost_of_energy_G__per_y] = inits[:Cost_of_fossil_fuel_for_non_el_use_G__per_y] + inits[:Cost_of_electricity_G__per_y] + inits[:Cost_of_grid_G__per_y] + inits[:Cost_of_new_electrification_G__per_y]  + inits[:Cost_of_CCS_G__per_y] + inits[:Cost_of_air_capture_G__per_y]
inits[:Cropland_expansion_rate_1_per_y] = 1/200 + p[:sFBeoCLE_0] * ( inits[:Perceived_crop_balance__1_] - 1 )
inits[:Cost_of_food_and_energy_TAs_G__per_y] = inits[:Cost_of_food_G__per_y] + inits[:Cost_of_energy_G__per_y]
inits[:Cropland_expansion_Mha_per_y] = IfElse.ifelse(inits[:Forestry_land_Mha] > 0, inits[:Cropland_Mha] * inits[:Cropland_expansion_rate_1_per_y], 0)  * inits[:Acceptable_loss_of_forestry_land__1_] * inits[:Cropland_expansion_multiplier__1_]
inits[:Cost_of_TAs_G__per_y] = inits[:Cost_of_food_and_energy_TAs_G__per_y]
inits[:CO2_release_from_forest_cut_GtCO2_per_y] = (( inits[:Old_growth_removal_Mha_per_y] + inits[:Cropland_expansion_Mha_per_y] ) *  p[:CO2_release_per_ha_of_forest_cut_tCO2_per_ha]) / 1000
inits[:Extra_cost_of_TAs_from_2022_G__per_y] = max(0, inits[:Cost_of_TAs_G__per_y] - p[:Cost_of_TAs_in_2022_G__per_y])
inits[:CO2_emissions_from_LULUC_GtCO2_per_y] = inits[:CO2_release_from_forest_cut_GtCO2_per_y] - inits[:CO2_absorption_in_forestry_land_GtCO2_per_y] - inits[:Extra_CO2_absorption_in_reg_ag_GtCO2_per_y]
inits[:Extra_taxes_for_TAs_from_2022_G__per_y] = IfElse.ifelse(p[:INITIAL_TIME__] > 2022, inits[:Extra_cost_of_TAs_from_2022_G__per_y] * p[:Fraction_of_extra_TA_cost_paid_by_extra_taxes__1_] , 0 )
inits[:CO2_emissions_GtCO2_per_y] = inits[:CO2_from_energy_and_industry_GtCO2_per_y] + inits[:CO2_emissions_from_LULUC_GtCO2_per_y] - inits[:Direct_air_capture_of_CO2_GtCO2_per_y]
inits[:Goal_for_extra_taxes_from_2022_G__per_y] = inits[:Extra_general_tax_from_2022_G__per_y] + inits[:Extra_taxes_for_TAs_from_2022_G__per_y]
inits[:Extra_taxes_from_2022_G__per_y] = inits[:Goal_for_extra_taxes_from_2022_G__per_y]
inits[:Worker_taxes_G__per_y] = inits[:Income_tax_workers__1_] + inits[:Extra_taxes_from_2022_G__per_y] * ( 1 - p[:Fraction_of_extra_taxes_paid_by_owners__1_] )
inits[:Owner_taxes_G__per_y] = inits[:Income_tax_owners__1_] + inits[:Extra_taxes_from_2022_G__per_y] * p[:Fraction_of_extra_taxes_paid_by_owners__1_]
inits[:Govmnt_gross_income_G__per_y] = inits[:Worker_taxes_G__per_y] + inits[:Owner_taxes_G__per_y] + inits[:Sales_tax_workers_G__per_y] + inits[:Sales_tax_owners_G__per_y] + inits[:Income_from_commons_from_2022_G__per_y]
inits[:Transfer_payments_G__per_y] = inits[:Govmnt_gross_income_G__per_y] * inits[:Fraction_of_govmnt_budget_to_workers__1_]
inits[:Govmnt_net_income_G__per_y] = inits[:Govmnt_gross_income_G__per_y] - inits[:Transfer_payments_G__per_y] + inits[:Sales_tax_G__per_y]
inits[:Govmnt_cash_inflow_G__per_y] = inits[:Govmnt_net_income_G__per_y] - inits[:Cash_flow_from_govmnt_to_banks_G__per_y]


@variables Effective_purchasing_power_G__per_y(t)
@variables Passing_40_Mp_per_y(t)
@variables Embedded_CLR_kcu_per_ftj(t)
@variables Extra_cost_of_Food_Turnaround_G__per_y(t)
@variables Total_savings_G__per_y(t)
@variables Participation__1_(t)
@variables Optimal_output_in_1980_Gu_per_y(t)
@variables Consumption_per_person_G__per_y(t)
@variables Cost_of_food_and_energy_as_share_of_GDP__1_(t)
@variables Forcing_from_other_gases_W_per_m2(t)
@variables Basic_income_tax_rate_owners__1_(t)
@variables Indicated_labour_participation_rate__1_(t)
@variables Traditional_cost_of_energy_G__per_y(t)
@variables Wage_rate_erosion___per_ph_per_y(t)
@variables CUC_PUS_in_1980_Gcu(t)
@variables N2O_concentration_in_atm_ppm(t)
@variables Labour_use_in_1980_Gph_per_y(t)
@variables Output_Gu_per_y(t)
@variables Capacity_PUS_Gcu(t)
@variables Loss_of_forest_land_Mha_per_y(t)
@variables Embedded_labour_productivity_in_1980_k__per_p_per_y(t)
@variables Public_spending_per_person_k__per_p_per_y(t)
@variables Capacity_initiation_PUS_Gcu_per_y(t)
@variables Cost_of_food_G__per_y(t)
@variables Extra_CO2_absorption_in_reg_ag_GtCO2_per_y(t)
@variables GHG_EMISSIONS_GtCO2e_per_y(t)
@variables Cost_of_capital_for_secured_debt_1_per_y(t)
@variables Investment_share_of_GDP__1_(t)
@variables Delivery_delay___index__1_(t) = 1
@variables Perceived_crop_balance__1_(t)
@variables Transfer_payments_G__per_y(t)
@variables N2O_in_atmosphere_GtN2O(t)
@variables TFP_excluding_effect_of_5TAs__1_(t)
@variables Demand_for_red_meat_per_person_kg_red_meat_per_p_per_y(t)
@variables Cost_of_fossil_fuel_for_non_el_use_G__per_y(t)
@variables Observed_fertility_1(t)
@variables Demand_for_fossil_electricity_TWh_per_y(t)
@variables Extra_increase_in_demand_for_electricity_from_NE_TWh_per_y(t)
@variables Forestry_land_Mha(t)
@variables Increase_in_extra_energy_productivity_index_1_per_y(t)
@variables Workers_debt_in_1980_G_(t)
@variables CO2_from_energy_production_GtCO2_per_y(t)
@variables Installed_CCS_capacity_GtCO2_per_y(t)
@variables Transfer_rate_for_heat_going_to_abyss_1_per_y(t)
@variables Fertilizer_use_in_conv_ag_kgN_per_ha_per_y(t)
@variables OWeoLOC__1_(t)
@variables Perceived_unemployment_CB__1_(t)
@variables OWeoCOC__1_(t)
@variables Life_of_fossil_el_capacity_y(t)
@variables Optimal_ouput___value_G__per_y(t)
@variables Grazing_land_yied_in_1980_kg_red_meat_per_ha_per_y(t)
@variables Govmnt_net_income_as_share_of_NI__1_(t)
@variables Recent_sales_Gu_per_y(t)
@variables Crop_demand_Mt_crop_per_y(t)
@variables LE_at_60_y(t)
@variables Worker_income_G__per_y(t)
@variables Total_forest_area_Mha(t)
@variables Labour_productivity_in_1980___per_ph(t)
@variables Hours_worked_mult_from_GDPpp__1_(t)
@variables Extra_warming_from_forcing_ZJ_per_y(t)
@variables Passing_60_Mp_per_y(t)
@variables Permanent_owner_cash_inflow_G__per_y(t)
@variables Permanent_govmnt_cash_inflow_G__per_y(t)
@variables Deliveries_Gu_per_y(t)
@variables Land_erosion_rate_1_per_y(t)
@variables Green_hydrogen_MtH2_per_y(t)
@variables Wage_share__1_(t)
@variables Fraction_of_CO2_sources_with_CCS__1_(t)
@variables Cost_of_nuclear_electricity_G__per_y(t)
@variables Cropland_expansion_multiplier__1_(t)
@variables Average_crop_yield_t_crop_per_ha_per_y(t)
@variables National_income_G__per_y(t)
@variables Electricity_production_TWh_per_y(t)
@variables Change_in_embedded_CLR_kcu_per_ftj_per_y(t)
@variables Old_growth_removal_Mha_per_y(t)
@variables Cost_of_regenerative_agriculture_G__per_y(t)
@variables Indicated_reform_delay_y(t)
@variables Total_purchasing_power_G__per_y(t)
@variables Traditional_per_person_use_of_electricity_before_EE_MWh_per_p_per_y(t)
@variables Fossil_electricity_capacity_GW(t)
@variables Owner_income_G__per_y(t)
@variables Capacity_discard_PIS_Gcu_per_y(t)
@variables Perceived_warming_deg_C(t)
@variables CO2_absorption_in_forestry_land_tCO2_per_ha_per_y(t)
@variables Govmnt_debt_in_1980_G_(t)
@variables Pink_noise_in_sales__1_(t)
@variables Discard_of_renewable_el_capacity_GW_per_y(t)
@variables Crop_supply_reg_ag_Mt_crop_per_y(t)
@variables Fraction_of_govmnt_budget_to_workers__1_(t)
@variables CO2_emissions_GtCO2_per_y(t)
@variables Change_in_signal_rate_1_per_yy(t)
@variables Acceptable_loss_of_forestry_land__1_(t)
@variables Cropland_expansion_rate_1_per_y(t)
@variables Total_man_made_forcing_W_per_m2(t)
@variables Perceived_surplus_workforce__1_(t)
@variables Man_made_forcing_W_per_m2(t)
@variables Extra_taxes_from_2022_G__per_y(t)
@variables Average_hours_worked_in_1980_kh_per_y(t)
@variables ROC_in_WSO___Table_1_per_y(t)
@variables kg_N2O_emission_per_kg_fertiliser(t)
@variables Extra_normal_LPR_from_2022__1_(t)
@variables Observed_rate_of_progress_1_per_y(t) = 0
@variables Reduction_in_TFP_from_unprofitable_activity__1_(t)
@variables Govmnt_spending_G__per_y(t)
@variables Social_tension__1_(t)
@variables ten_yr_govmnt_interest_rate_1_per_y(t)
@variables Crop_use_Mt_per_y(t)
@variables Average_wellbeing_from_public_spending__1_(t)
@variables Low_carbon_el_production_TWh_per_y(t)
@variables Energy_use_per_person_toe_per_p_per_y(t)
@variables Crops_for_biofuel_Mt_crop_per_y(t)
@variables Cost_of_TAs_G__per_y(t)
@variables Public_spending_effect_on_social_trust__1_(t)
@variables ENERGY_USE_Mtoe_per_y(t)
@variables Govmnt_share_of_GDP__1_(t)
@variables Perceived_unemployment_rate__1_(t)
@variables OWeoTFP(t)
@variables Passing_20_Mp_per_y(t)
@variables Population_below_15_k__per_p_per_y_Mp(t)
@variables Births_Mp_per_y(t)
@variables IIASA_Fossil_energy_production_EJ_per_yr(t)
@variables Cropland_expansion_Mha_per_y(t)
@variables Control___C_G_S__per_NI_(t)
@variables Fertility_multiplier__1_(t)
@variables CAPEX_renewable_el_G__per_y(t)
@variables Aged_40_60_Mp(t)
@variables Water_vapor_concentration_g_per_kg(t)
@variables Urban_expansion_Mha_per_y(t)
@variables Desired_renewable_electricity_share__1_(t)
@variables State_capacity__fraction_of_GDP_(t)
@variables Income_from_commons_from_2022_G__per_y(t)
@variables Infrastructure_purchases_ratio_y(t)
@variables Value_of_public_services_supplied_G__per_y(t)
@variables Heat_to_deep_ocean_ZJ_per_y(t)
@variables Max_workers_debt_G_(t)
@variables Life_of_capacity_PUS_y(t)
@variables TWh_el_per_EJ___engineering_equivalent(t)
@variables GDP_per_person_k__per_p_per_y(t)
@variables Change_in_TFP_1_per_y(t)
@variables Introduction_period_for_policy_y(t)
@variables CH4_breakdown_GtCH4_per_y(t)
@variables Cost_of_extra_fertility_reduction__share_of_GDP_(t)
@variables Available_workforce_Mp(t)
@variables Demand_for_electricity_TWh_per_y(t)
@variables Sales_tax_owners_G__per_y(t)
@variables Aged_60___Mp(t)
@variables CO2_in_atmosphere_GtCO2(t)
@variables Owner_savings_G__per_y(t)
@variables Govmnt_net_income_G__per_y(t)
@variables Past_GDP_per_person_k__per_y(t)
@variables Pension_age_y(t)
@variables Perceived_inflation_CB_1_per_y(t)
@variables Worker_taxes_G__per_y(t)
@variables Reform_delay_y(t)
@variables Bank_cash_inflow_from_lending_G__per_y(t)
@variables Deaths_Mp_per_y(t)
@variables Demand_pulse_2020_25__1_(t)
@variables Change_in_workforce_Mp_per_y(t)
@variables Old_growth_forest_area_Mha_1(t)
@variables Grazing_land_yield_kg_red_meat_per_ha_per_y(t)
@variables Logistic_k__1_(t)
@variables Social_trust_effect_on_reform_delay__1_(t)
@variables Cost_of_capacity___per_cu(t)
@variables Govmnt_finance_as_share_of_NI__1_(t)
@variables Potential_red_meat_from_grazing_land_Mt_red_meat_per_y(t)
@variables Fraction_regenerative_agriculture__1_(t)
@variables Demand_for_fossil_fuel_for_non_el_use_before_NE_Mtoe_per_y(t)
@variables Govmnt_debt_G_(t)
@variables Food_sector_productivity_index__19801_(t)
@variables Aged_20_pension_age_Mp(t)
@variables Capacity_addition_PUS_Gcu_per_y(t)
@variables Extra_cost_of_TAs_from_2022_G__per_y(t)
@variables Non_fossil_CO2_per_person_tCO2_per_p_per_y(t)
@variables Direct_air_capture_of_CO2_GtCO2_per_y(t)
@variables Melting_rate_surface_1_per_y(t)
@variables Owner_operating_income_after_tax_G__per_y(t)
@variables Rate_of_technological_advance_1_per_y(t)
@variables N2O_forcing_per_ppm_W_per_m2_per_ppm(t)
@variables New_forestry_land_Mha_per_y(t)
@variables Extra_taxes_for_TAs_from_2022_G__per_y(t)
@variables Traditional_grid_cost_G__per_y(t)
@variables Income_tax_owners__1_(t)
@variables Corporate_borrowing_cost_1_per_y(t)
@variables Unemployment_rate__1_(t)
@variables Output_last_year_G__per_y(t)
@variables Urban_land_Mha(t)
@variables Soil_quality_index_in_conv_ag__19801_(t)
@variables GDP_G__per_y(t)
@variables Dependency_ratio_p_per_p(t)
@variables Owner_taxes_G__per_y(t)
@variables Owner_cash_inflow_G__per_y(t)
@variables Natural_N2O_emissions_GtN2O_per_y(t)
@variables Indicated_urban_land_Mha(t)
@variables Desired_crop_yield_in_conv_ag_t_crop_per_ha_per_y(t)
@variables Traditional_use_of_crops_ex_red_meat_Mt_per_y(t)
@variables Cost_of_CCS_G__per_y(t)
@variables Man_made_CH4_emissions_GtCH4_per_y(t)
@variables CO2_effect_on_land_yield__1_(t)
@variables Heat_to_space_ZJ_per_y(t)
@variables Optimal_workforce_Mp(t)
@variables Worker_savings_G__per_y(t)
@variables Extra_pension_age_y(t)
@variables Public_services_per_person_k__per_p_per_y(t)
@variables Extra_energy_productivity_index_20221(t)
@variables FOOD_FOOTPRINT_INDEX__19801_(t)
@variables Old_growth_removal_rate_1_per_y(t)
@variables Traditional_use_of_crops_ex_red_meat_per_person_kg_crop_per_p_per_y(t)
@variables Normal_hours_worked_kh_per_ftj_per_y(t)
@variables Average_wellbeing_from_progress__1_(t)
@variables Workers_new_debt_G__per_y(t)
@variables Fossil_electricity_production_TWh_per_y(t)
@variables Worker_tax_rate__1_(t)
@variables CO2_forcing_per_ppm_W_per_m2_per_ppm(t)
@variables tCO2_per_toe(t)
@variables Traditional_cost_of_fossil_fuel_for_non_el_use_G__per_y(t)
@variables Cost_of_energy_as_share_of_GDP__1_(t)
@variables Desired_no_of_children_1(t)
@variables Fraction_new_red_meat__1_(t)
@variables On_pension_Mp(t)
@variables Number_of_doublings_in_sun_and_wind_capacity__1_(t)
@variables Inequity_effect_on_logistic_k__1_(t)
@variables Demand_in_1980_G__per_y(t)
@variables Output_growth_rate_1_per_y(t)
@variables OPEX_renewable_el_G__per_y(t)
@variables Govmnt_cash_inflow_G__per_y(t)
@variables Extra_cooling_from_ice_melt_ZJ_per_y(t)
@variables WSO_effect_on_flow_to_capacity_addition__1_(t)
@variables four_TWh_el_per_Mtoe(t)
@variables Desired_fossil_el_capacity_change_GW_per_y(t)
@variables xExtra_cost_of_TAs_as_share_of_GDP__1_(t)
@variables Price_per_unit___per_u(t)
@variables Social_trust__1_(t)
@variables Cost_of_electricity_G__per_y(t)
@variables Govmnt_spending_as_share_of_GDP(t)
@variables Traditional_use_of_crops_per_person_kg_crop_per_p_per_y(t)
@variables Worker_income_after_tax_G__per_y(t)
@variables N2O_conc_in_1980_ppm(t)
@variables Average_hours_worked_kh_per_y(t)
@variables Fertilizer_use_per_person_kg_per_p_per_y(t)
@variables Labour_productivity___per_ph(t)
@variables Worker_disposable_income_k__per_p_per_y(t)
@variables Goal_for_extra_taxes_from_2022_G__per_y(t)
@variables FRACA_mult_from_GDPpp___Table__1_(t)
@variables Change_in_wso_1_per_y(t)
@variables CH4_forcing_per_ppm_W_per_m2_per_ppm(t)
@variables Labour_use_Gph_per_y(t)
@variables CO2_absorption_GtCO2_per_y(t)
@variables Sales_tax_workers_G__per_y(t)
@variables Traditional_per_person_use_of_fossil_fuels_for_non_el_use_before_EE_toe_per_p_per_y(t)
@variables Renewable_heat_production_Mtoe_per_y(t)
@variables Govmnt_interest_cost_G__per_y(t)
@variables Traditional_use_of_feed_for_red_meat_Mt_crop_per_y(t)
@variables Indicated_social_trust__1_(t)
@variables Worker_debt_burden_y(t)
@variables Capacity_PIS_Gcu(t)
@variables Red_meat_from_feedlots_Mt_red_meat_per_y(t)
@variables Aged_20_40_years_Mp(t)
@variables Warming_effect_on_land_yield__1_(t)
@variables Cash_flow_from_govmnt_to_banks_G__per_y(t)
@variables Optimal_real_output_Gu_per_y(t)
@variables Ratio_of_Energy_cost_to_Trad_energy_cost__1_(t)
@variables Desired_fossil_el_capacity_GW(t)
@variables Cost_index_for_sun_and_wind_capacity__1_(t)
@variables Govmnt_purchases_G__per_y(t)
@variables Food_footprint_in_1980(t)
@variables Govmnt_investment_in_public_capacity_G__per_y(t)
@variables Fraction_of_available_capital_to_new_capacity__1_(t)
@variables Capacity_Gcu(t)
@variables Green_hydrogen_Mtoe_per_y(t)
@variables ROC_in_ECLR_1_per_y(t)
@variables Bank_cash_inflow_as_share_of_NI__1_(t)
@variables Working_age_population_Mp(t)
@variables Use_of_fossil_fuels_Mtoe_per_y(t)
@variables Demand_for_electricity_before_NE_TWh_per_y(t)
@variables Govmnt_borrowing_cost_1_per_y(t)
@variables CO2_per_GDP__kgCO2_per___(t)
@variables Average_wellbeing_from_global_warming__1_(t)
@variables Excess_demand__1_(t)
@variables CO2_absorption_in_forestry_land_GtCO2_per_y(t)
@variables Forcing_from_CH4_W_per_m2(t)
@variables Off_balance_sheet_govmnt_inv_in_PIS__share_of_GDP_(t)
@variables Hiring_per_firing_delay_y(t)
@variables ED_effect_on_flow_to_capacity_addition__1_(t)
@variables Consumption_share_of_GDP__1_(t)
@variables Addition_of_renewable_el_capacity_GW_per_y(t)
@variables Wage_effect_on_optimal_CLR__1_(t)
@variables Feed_for_red_meat_Mt_crop_per_y(t)
@variables Cost_of_food_and_energy_TAs_G__per_y(t)
@variables Perceived_excess_demand__1_(t) = 1
@variables Indicated_TFP__1_(t)
@variables Expected_long_term_inflation_1_per_y(t)
@variables Shifts_worked___index__1_(t)
@variables Inequality__1_(t)
@variables Desired_crop_supply_Mt_crop_per_y(t)
@variables Red_meat_supply_per_person_kg_red_meat_per_p_per_y(t)
@variables Fossil_fuels_for_electricity_Mtoe_per_y(t)
@variables Extra_cost_of_Food_Turnaround_as_share_of_GDP__1_(t)
@variables CH4_concentration_in_atm_ppm(t)
@variables Owner_savings_fraction__1_(t)
@variables Cancellation_of_debt_G__per_y(t)
@variables Investment_in_new_capacity_PIS_G__per_y(t)
@variables Desired_renewable_el_capacity_change_GW(t)
@variables Melting_Mha_per_y(t)
@variables Normal_LPR__1_(t)
@variables Extra_cost_of_Energy_Turnaround_as_share_of_GDP__1_(t)
@variables Demand_for_fossil_fuel_for_non_el_use_Mtoe_per_y(t)
@variables Excess_demand_effect_on_life_of_capacity__1_(t)
@variables Addition_of_sun_and_wind_capacity_GW_per_y(t)
@variables Cost_of_air_capture_G__per_y(t)
@variables CO2_from_energy_and_industry_GtCO2_per_y(t)
@variables N2O_breakdown_GtN2O_per_y(t)
@variables Fertilizer_cost_reduction_G__per_y(t)
@variables CH4_conc_in_1980_ppm(t)
@variables Addition_of_fossil_el_capacity_GW_per_y(t)
@variables Worker_finance_cost_as_share_of_income__1_(t)
@variables Inequity_effect_on_social_trust__1_(t)
@variables Cost_index_for_Regenerative_agriculture__1_(t)
@variables Fertilizer_productivity_index__19801_(t)
@variables Ice_and_snow_cover_excl_G_A_Mkm2(t)
@variables kg_CH4_emission_per_kg_crop(t)
@variables Fossil_capacity_up_time_kh_per_y(t)
@variables Natural_CH4_emissions_GtCH4_per_y(t)
@variables New_grazing_land_Mha_per_y(t)
@variables Worker_share_of_output__1_(t)
@variables Albedo_in_1980__1_(t)
@variables Average_wellbeing_from_disposable_income__1_(t)
@variables CAPEX_fossil_el_G__per_y(t)
@variables Cropland_loss_Mha_per_y(t)
@variables Worker_interest_cost_G__per_y(t)
@variables Permanent_worker_cash_inflow_G__per_y(t)
@variables Desired_shifts_worked___index__1_(t)
@variables Observed_warming_deg_C(t)
@variables Extra_reduction_in_demand_for_non_el_fossil_fuel_from_NE_Mtoe_per_y(t)
@variables Capacity_under_construction_PIS_Gcu(t)
@variables Fraction_below_15_k__per_p_per_y__1_(t)
@variables CAPEX_renewable_el___per_W(t)
@variables Labour_participation_rate__1_(t)
@variables Nuclear_capacity_GW(t)
@variables Crop_use_per_person_t_crop_per_p_per_y(t)
@variables CO2_concentration_in_atm_ppm(t)
@variables Traditional_use_of_red_meat_per_person_kg_red_meat_per_p_per_y(t)
@variables Effect_of_capacity_renewal_1_per_y(t)
@variables Sales_tax_G__per_y(t)
@variables Off_balance_sheet_govmnt_inv_in_PUS__share_of_GDP_(t)
@variables Average_wellbeing_from_inequality__1_(t)
@variables Change_in_wage_rate___per_ph_per_y(t)
@variables Fraction_new_electrification__1_(t)
@variables Productivity_of_public_purchases__1_(t)
@variables Demand_for_red_meat_Mt_red_meat_per_y(t)
@variables AVERAGE_WELLBEING_INDEX__1_(t)
@variables Income_tax_workers__1_(t)
@variables Max_govmnt_debt_G_(t)
@variables Owner_consumptin_fraction__1_(t)
@variables Population_growth_rate_1_per_y(t)
@variables Desired_supply_of_renewable_electricity_TWh_per_y(t)
@variables Discard_of_fossil_el_capacity_GW_per_y(t)
@variables ROC_in_DDI_1_per_y(t)
@variables Workforce_Mp(t)
@variables OPEX_fossil_el_G__per_y(t)
@variables Effective_GDP_per_person_k__per_p_per_y(t)
@variables Food_footprint(t)
@variables Long_term_erosion_of_wso_1_per_y(t)
@variables INV_in_1980_Gu(t)
@variables Public_spending_as_share_of_GDP(t)
@variables INEQUALITY_INDEX__19801_(t)
@variables Inventory_Gu(t)
@variables Life_of_extra_CO2_in_atm_y(t)
@variables Capacity_under_construction_PUS_Gcu(t)
@variables Indicated_wage_effect_on_optimal_CLR__1_(t)
@variables Desired_crop_supply_conv_ag_Mt_crop_per_y(t)
@variables Consumption_demand_G__per_y(t)
@variables Red_meat_from_grazing_land_Mt_red_meat_per_y(t)
@variables ROC_in_soil_quality_in_conv_ag_1_per_y(t)
@variables Inflation_rate_1_per_y(t)
@variables Capacity_initiation_PIS_Gcu_per_y(t)
@variables Death_rate_1_per_y(t)
@variables Melting_rate_deep_ice_1_per_y(t)
@variables Govmnt_new_debt_G__per_y(t)
@variables Crop_supply__after_20___waste__Mt_crop_per_y(t)
@variables Grazing_land_Mha(t)
@variables Number_of_doublings_in_reg_ag__1_(t)
@variables Savings_share_of_GDP__1_(t)
@variables Wellbeing_effect_of_participation__1_(t)
@variables Fertilizer_effect_on_erosion_rate__1_(t)
@variables Ice_and_snow_cover_Mha(t)
@variables Cost_of_food_and_energy_G__per_y(t)
@variables Land_erosion_multiplier__1_(t)
@variables Corporate_borrowing_cost_in_1980_1_per_y(t)
@variables Change_in_DDI_1_per_y(t)
@variables TFP_including_effect_of_5TAs__1_(t)
@variables Average_gross_income_per_worker_k__per_p_per_y(t)
@variables Normal_corporate_credit_risk_1_per_y(t)
@variables Past_AWI__1_(t)
@variables Owner_tax_rate__1_(t)
@variables Traditional_use_of_crops_Mt_per_y(t)
@variables CO2_from_CH4_GtCO2_per_y(t)
@variables Loss_of_cropland_Mha_per_y(t)
@variables Extra_cost_of_reg_ag___per_ha_per_y(t)
@variables threem_interest_rate_1_per_y(t)
@variables Govmnt_debt_burden_y(t)
@variables Life_of_capacity_PIS_y(t)
@variables Change_in_soil_quality_in_conv_ag_t_crop_per_ha_per_y_per_y(t)
@variables Wage_rate_erosion_rate_1_per_y(t)
@variables CH4_in_atmosphere_GtCH4(t)
@variables Cost_of_new_electrification_G__per_y(t)
@variables Fraction_fossil_plus_nuclear_electricity__1_(t)
@variables CBC_effect_on_flow_to_capacity_addion__1_(t)
@variables Capacity_discard_PUS_Gcu_per_y(t)
@variables Water_vapour_feedback_W_per_m2(t)
@variables Extra_general_tax_from_2022_G__per_y(t)
@variables Available_capital_G__per_y(t)
@variables Change_in_ECLR_k__per_y_per_y(t)
@variables CO2_emissions_per_person_tCO2_per_y(t)
@variables Life_expectancy_multipler__1_(t)
@variables Cash_flow_from_workers_to_banks_G__per_y(t)
@variables Man_made_N2O_emissions_GtN2O_per_y(t)
@variables OWeoLoCO2(t)
@variables Lambda(t)
@variables Accumulated_sun_and_wind_capacity_from_1980_GW(t)
@variables Capacity_addition_PIS_Gcu_per_y(t)
@variables Imported_ROTA_1_per_y(t)
@variables Workers_payback_G__per_y(t)
@variables FFLReoOGRR(t)
@variables GDPppeoROCCLR(t)
@variables Aged_0_20_years_Mp(t)
@variables Central_bank_signal_rate_1_per_y(t)
@variables Life_expectancy_y(t)
@variables Govmnt_gross_income__as_share_of_NI_(t)
@variables Forcing_from_CO2_W_per_m2(t)
@variables Risk_of_extreme_heat_event__1_(t)
@variables Pensioners_per_worker_p_per_p(t)
@variables Cost_of_fossil_electricity_G__per_y(t)
@variables RATE_OF_GROWTH_IN_GDP_PER_PERSON_1_per_y(t)
@variables Amount_of_fertilizer_saved_in_reg_ag_kgN_per_ha_per_y(t)
@variables Cost_of_energy_G__per_y(t)
@variables Goal_for_fraction_of_govmnt_budget_to_workers__1_(t)
@variables Regenerative_agriculture_area_Mha(t)
@variables CH4_emissions_GtCH4_per_y(t)
@variables Population_Mp(t)
@variables Biofuels_use_Mtoe_per_y(t)
@variables Cost_of_grid_G__per_y(t)
@variables Extra_fertility_reduction__1_(t)
@variables Forest_absorption_multipler__1_(t)
@variables Optimal_capital_labour_ratio_kcu_per_ftj(t)
@variables Unemployed_Mp(t)
@variables FCUTeoLOFC__1_(t)
@variables Cost_of_renewable_electricity_G__per_y(t)
@variables Transfer_rate_for_heat_going_to_space_1_per_y(t)
@variables Birth_rate_1_per_y(t)
@variables Productivity_loss_from_unprofitable_activity__1_(t)
@variables CO2_emissions_from_LULUC_GtCO2_per_y(t)
@variables IIASA_Renewable_energy_production_EJ_per_yr(t)
@variables Cropland_Mha(t)
@variables Fraction_forestry_land_remaining__1_(t)
@variables Forcing_from_N2O_W_per_m2(t)
@variables Workers_debt_G_(t)
@variables Perceived_relative_inventory__1_(t)
@variables Barren_land_Mha(t) = 3000
@variables Worker_borrowing_cost_1_per_y(t)
@variables ROC_in_CLR_1_per_y(t)
@variables Traditional_cost_of_energy_as_share_of_GDP__1_(t)
@variables Embedded_CLR_k__per_j(t)
@variables Life_of_capacity_PUS_in_1980_y(t)
@variables Embedded_TFP__1_(t)
@variables Crop_balance__1_(t)
@variables Nuclear_electricity_production_TWh_per_y(t)
@variables Warming_effect_on_life_expectancy__1_(t)
@variables Crop_waste_reduction__1_(t)
@variables Wage_rate_in_1980___per_ph(t)
@variables Renewable_electricity_production_TWh_per_y(t)
@variables N2O_emissions_GtN2O_per_y(t)
@variables Change_in_Price_Index_1_per_y(t)
@variables Electricity_balance__1_(t)
@variables Social_tension_effect_on_reform_delay__1_(t)
@variables Albedo__1_(t)
@variables Inventory_coverage_y(t)
@variables Sales_G__per_y(t)
@variables Wage_rate___per_ph(t)
@variables Govmnt_gross_income_G__per_y(t)
@variables CO2_release_from_forest_cut_GtCO2_per_y(t)
@variables Capacity_renewal_rate_1_per_y(t)
@variables Extra_cost_of_TAs_as_share_of_GDP__1_(t)
@variables Owner_consumption_G__per_y(t)
@variables Fertilizer_use_Mt_per_y(t)
@variables Worker_cash_inflow_G__per_y(t)
@variables Worker_consumption_demand_G__per_y(t)
@variables Reduction_in_ROTA_from_inequality_1_per_y(t)
@variables Unemployment_perception_time_y(t)
@variables Traditional_cost_of_electricity_G__per_y(t)
@variables Time_to_change_tooling_y(t)
@variables Domestic_rate_of_technological_advance_1_per_y(t)
@variables Renewable_electricity_capacity_GW(t)
@variables CO2_from_non_fossil_industrial_processes_GtCO2_per_y(t)
@variables FRACA_mult_from_GDPpp___Line__1_(t)
@variables Old_growth_removal_rate_multiplier__1_(t)
@variables Cost_of_fertilizer_G__per_y(t)
@variables Price_Index__19801_(t)
@variables Extra_heat_in_surface_ZJ(t)
@variables CUC_PIS_in_1980_Gcu(t)
@variables Traditional_fertilizer_use_in_conv_ag_kgN_per_ha_per_y(t)
@variables Indicated_signal_rate_1_per_y(t)
@variables Desired_renewable_el_capacity_GW(t)
@variables Govmnt_payback_G__per_y(t)
@variables Passing_40_Mp_per_y1(t)
@variables Passing_40_Mp_per_y2(t)
@variables Passing_40_Mp_per_y3(t)
@variables Passing_40_Mp_per_y4(t)
@variables Passing_40_Mp_per_y5(t)
@variables Passing_40_Mp_per_y6(t)
@variables Passing_40_Mp_per_y7(t)
@variables Passing_40_Mp_per_y8(t)
@variables Passing_40_Mp_per_y9(t)
@variables Passing_60_Mp_per_y1(t)
@variables Passing_60_Mp_per_y2(t)
@variables Passing_60_Mp_per_y3(t)
@variables Passing_60_Mp_per_y4(t)
@variables Passing_60_Mp_per_y5(t)
@variables Passing_60_Mp_per_y6(t)
@variables Passing_60_Mp_per_y7(t)
@variables Passing_60_Mp_per_y8(t)
@variables Passing_60_Mp_per_y9(t)
@variables Passing_20_Mp_per_y1(t)
@variables Passing_20_Mp_per_y2(t)
@variables Passing_20_Mp_per_y3(t)
@variables Passing_20_Mp_per_y4(t)
@variables Passing_20_Mp_per_y5(t)
@variables Passing_20_Mp_per_y6(t)
@variables Passing_20_Mp_per_y7(t)
@variables Passing_20_Mp_per_y8(t)
@variables Passing_20_Mp_per_y9(t)
@variables Deaths_Mp_per_y1(t)
@variables Deaths_Mp_per_y2(t)
@variables Deaths_Mp_per_y3(t)
@variables Deaths_Mp_per_y4(t)
@variables Deaths_Mp_per_y5(t)
@variables Deaths_Mp_per_y6(t)
@variables Deaths_Mp_per_y7(t)
@variables Deaths_Mp_per_y8(t)
@variables Deaths_Mp_per_y9(t)

eqs = [
D(Effective_purchasing_power_G__per_y) ~ ((Total_purchasing_power_G__per_y - Effective_purchasing_power_G__per_y) /  Demand_adjustment_time_y) *  (1 +  Demand_pulse_2020_25__1_),
D(Passing_40_Mp_per_y1) ~ 10 * (Passing_20_Mp_per_y - Passing_40_Mp_per_y1) / 20,
D(Passing_40_Mp_per_y2) ~ 10 * (Passing_40_Mp_per_y1 - Passing_40_Mp_per_y2) / 20,
D(Passing_40_Mp_per_y3) ~ 10 * (Passing_40_Mp_per_y2 - Passing_40_Mp_per_y3) / 20,
D(Passing_40_Mp_per_y4) ~ 10 * (Passing_40_Mp_per_y3 - Passing_40_Mp_per_y4) / 20,
D(Passing_40_Mp_per_y5) ~ 10 * (Passing_40_Mp_per_y4 - Passing_40_Mp_per_y5) / 20,
D(Passing_40_Mp_per_y6) ~ 10 * (Passing_40_Mp_per_y5 - Passing_40_Mp_per_y6) / 20,
D(Passing_40_Mp_per_y7) ~ 10 * (Passing_40_Mp_per_y6 - Passing_40_Mp_per_y7) / 20,
D(Passing_40_Mp_per_y8) ~ 10 * (Passing_40_Mp_per_y7 - Passing_40_Mp_per_y8) / 20,
D(Passing_40_Mp_per_y9) ~ 10 * (Passing_40_Mp_per_y8 - Passing_40_Mp_per_y9) / 20,
D(Passing_40_Mp_per_y) ~ 10 * (Passing_40_Mp_per_y9 - Passing_40_Mp_per_y) / 20,
D(Embedded_CLR_kcu_per_ftj) ~ Change_in_embedded_CLR_kcu_per_ftj_per_y,
Extra_cost_of_Food_Turnaround_G__per_y ~ Cost_of_regenerative_agriculture_G__per_y - Fertilizer_cost_reduction_G__per_y,
Total_savings_G__per_y ~ Owner_savings_G__per_y + Worker_savings_G__per_y,
Participation__1_ ~ Labour_participation_rate__1_ * ( 1 - Perceived_unemployment_rate__1_ ),
Optimal_output_in_1980_Gu_per_y ~ CAP_PIS_in_1980_Gcu / PCOR_PIS_cu_per_u_per_y + CAP_PUS_in_1980_Gcu / PCOR_PUS_cu_per_u_per_y,
Consumption_per_person_G__per_y ~ Consumption_demand_G__per_y /  Population_Mp,
Cost_of_food_and_energy_as_share_of_GDP__1_ ~ Cost_of_food_and_energy_G__per_y / GDP_G__per_y,
Forcing_from_other_gases_W_per_m2 ~ interpolate(t, [(1980.0,0.18),(2000.0,0.36),(2020.0,0.39),(2050.0,0.37),(2100.0,0.0)]),
Basic_income_tax_rate_owners__1_ ~ min(1, Income_tax_rate_owners_in_1980__1_ + ramp(t,(Income_tax_rate_owners_in_2022__1_ - Income_tax_rate_owners_in_1980__1_ ) / 42, 1980, 2022) + ramp(t,(Goal_for_income_tax_rate_owners__1_ - Income_tax_rate_owners_in_2022__1_ ) / 78, 2022, 2100) ),
Indicated_labour_participation_rate__1_ ~ Normal_LPR__1_ - Perceived_surplus_workforce__1_,
Traditional_cost_of_energy_G__per_y ~ Traditional_cost_of_electricity_G__per_y + Traditional_cost_of_fossil_fuel_for_non_el_use_G__per_y + Traditional_grid_cost_G__per_y,
Wage_rate_erosion___per_ph_per_y ~ Wage_rate___per_ph * Wage_rate_erosion_rate_1_per_y,
CUC_PUS_in_1980_Gcu ~ ( CAP_PUS_in_1980_Gcu / Life_of_capacity_PUS_in_1980_y ) * Construction_time_PUS_y * Extra_mult_on_CUC__to_avoid_initial_transient_in_Investment_share_of_GDP,
N2O_concentration_in_atm_ppm ~ N2O_in_atmosphere_GtN2O / GtN2O_per_ppm,
Labour_use_in_1980_Gph_per_y ~ Workforce_in_1980_Mp * Average_hours_worked_in_1980_kh_per_y,
Output_Gu_per_y ~ Optimal_real_output_Gu_per_y * Shifts_worked___index__1_ / SWI_in_1980__1_,
D(Capacity_PUS_Gcu) ~ Capacity_addition_PUS_Gcu_per_y-Capacity_discard_PUS_Gcu_per_y,
Loss_of_forest_land_Mha_per_y ~ Old_growth_removal_Mha_per_y + Cropland_expansion_Mha_per_y,
Embedded_labour_productivity_in_1980_k__per_p_per_y ~ Optimal_output_in_1980_Gu_per_y / Jobs_in_1980_M_ftj,
Public_spending_per_person_k__per_p_per_y ~ Govmnt_spending_G__per_y / Population_Mp,
Capacity_initiation_PUS_Gcu_per_y ~ max(( Govmnt_investment_in_public_capacity_G__per_y + Off_balance_sheet_govmnt_inv_in_PUS__share_of_GDP_ * GDP_G__per_y) / Cost_of_capacity___per_cu, 0),
Cost_of_food_G__per_y ~ Agriculture_as_fraction_of_GDP__1_ * GDP_G__per_y + Cost_of_regenerative_agriculture_G__per_y + Cost_of_fertilizer_G__per_y,
Extra_CO2_absorption_in_reg_ag_GtCO2_per_y ~ Regenerative_agriculture_area_Mha * CO2_absorbed_in_reg_ag_tCO2_per_ha_per_y / 1000,
GHG_EMISSIONS_GtCO2e_per_y ~ CO2_emissions_GtCO2_per_y * tCO2e_per_tCO2 + CH4_emissions_GtCH4_per_y * tCO2e_per_tCH4 + N2O_emissions_GtN2O_per_y * tCO2e_per_tN2O,
D(Cost_of_capital_for_secured_debt_1_per_y) ~ ((threem_interest_rate_1_per_y + Normal_bank_operating_margin_1_per_y) - Cost_of_capital_for_secured_debt_1_per_y) / Finance_sector_response_time_y,
Investment_share_of_GDP__1_ ~ ( Investment_in_new_capacity_PIS_G__per_y + Govmnt_investment_in_public_capacity_G__per_y ) / GDP_G__per_y,
D(Delivery_delay___index__1_) ~ Change_in_DDI_1_per_y,
Perceived_crop_balance__1_ ~ Crop_balance__1_/ (1 + Desired_reserve_capacity__1_ ),
Transfer_payments_G__per_y ~ Govmnt_gross_income_G__per_y * Fraction_of_govmnt_budget_to_workers__1_,
D(N2O_in_atmosphere_GtN2O) ~ N2O_emissions_GtN2O_per_y - N2O_breakdown_GtN2O_per_y,
D(TFP_excluding_effect_of_5TAs__1_) ~ Change_in_TFP_1_per_y,
Demand_for_red_meat_per_person_kg_red_meat_per_p_per_y ~ Traditional_use_of_red_meat_per_person_kg_red_meat_per_p_per_y,
Cost_of_fossil_fuel_for_non_el_use_G__per_y ~ (Demand_for_fossil_fuel_for_non_el_use_Mtoe_per_y *  Traditional_cost_of_fossil_fuel_for_non_el_use___per_toe ) /1000,
Observed_fertility_1 ~ Desired_no_of_children_1 * Fraction_achieving_desired_family_size__1_,
Demand_for_fossil_electricity_TWh_per_y ~ max(0, Demand_for_electricity_TWh_per_y - Low_carbon_el_production_TWh_per_y),
Extra_increase_in_demand_for_electricity_from_NE_TWh_per_y ~ Extra_reduction_in_demand_for_non_el_fossil_fuel_from_NE_Mtoe_per_y * Extra_use_of_electricity_per_reduced_use_of_non_el_FF_MWh_per_toe,
D(Forestry_land_Mha) ~ New_forestry_land_Mha_per_y-Cropland_expansion_Mha_per_y,
Increase_in_extra_energy_productivity_index_1_per_y ~ Extra_energy_productivity_index_20221 * 0 + WorldDynamics.step(t, Extra_ROC_in_energy_productivity_after_2022_1_per_y, 2022),
Workers_debt_in_1980_G_ ~ 18992 * Mult_to_avoid_transient_in_worker_finance,
CO2_from_energy_production_GtCO2_per_y ~ Use_of_fossil_fuels_Mtoe_per_y * ( tCO2_per_toe / 1000 ) *  ( 1 - Fraction_of_CO2_sources_with_CCS__1_ ),
Installed_CCS_capacity_GtCO2_per_y ~ Fraction_of_CO2_sources_with_CCS__1_ * ( CO2_from_non_fossil_industrial_processes_GtCO2_per_y +CO2_from_energy_production_GtCO2_per_y ) / (1 - Fraction_of_CO2_sources_with_CCS__1_ ),
Transfer_rate_for_heat_going_to_abyss_1_per_y ~ Transfer_rate_surface_abyss_in_1980_1_per_y * (( Observed_warming_deg_C + 287 ) /  287 ),
Fertilizer_use_in_conv_ag_kgN_per_ha_per_y ~ Traditional_fertilizer_use_in_conv_ag_kgN_per_ha_per_y / Fertilizer_productivity_index__19801_,
OWeoLOC__1_ ~ IfElse.ifelse(t > 2022, 1 + sOWeoLOC_0 * ( Observed_warming_deg_C / Observed_warming_in_2022_deg_C - 1 ), 1),
D(Perceived_unemployment_CB__1_) ~ (Unemployment_rate__1_ - Perceived_unemployment_CB__1_) /  Unemployment_perception_time_CB_y,
OWeoCOC__1_ ~ IfElse.ifelse(t > 2022, 1 + sOWeoCOC_0 * ( Observed_warming_deg_C / Observed_warming_in_2022_deg_C - 1 ), 1),
Life_of_fossil_el_capacity_y ~ Normal_life_of_fossil_el_capacity_y * FCUTeoLOFC__1_,
Optimal_ouput___value_G__per_y ~ Optimal_real_output_Gu_per_y * Price_per_unit___per_u,
Grazing_land_yied_in_1980_kg_red_meat_per_ha_per_y ~ 14 *CO2_effect_on_land_yield__1_ *Warming_effect_on_land_yield__1_,
Govmnt_net_income_as_share_of_NI__1_ ~ Govmnt_net_income_G__per_y / National_income_G__per_y,
D(Recent_sales_Gu_per_y) ~ (Deliveries_Gu_per_y - Recent_sales_Gu_per_y) / Sales_averaging_time_y,
Crop_demand_Mt_crop_per_y ~ (Traditional_use_of_crops_ex_red_meat_Mt_per_y + Feed_for_red_meat_Mt_crop_per_y + Crops_for_biofuel_Mt_crop_per_y),
LE_at_60_y ~ Life_expectancy_y - 60,
Worker_income_G__per_y ~ National_income_G__per_y * Worker_share_of_output__1_,
Total_forest_area_Mha ~ Old_growth_forest_area_Mha_1 + Forestry_land_Mha,
Labour_productivity_in_1980___per_ph ~ ( Optimal_output_in_1980_Gu_per_y * Cost_per_unit_in_1980___per_u ) / Labour_use_in_1980_Gph_per_y,
Hours_worked_mult_from_GDPpp__1_ ~ 1 + sTIeoNHW_0 * ( GDP_per_person_k__per_p_per_y / GDP_per_person_in_1980 - 1 ),
Extra_warming_from_forcing_ZJ_per_y ~ ( Total_man_made_forcing_W_per_m2 * Global_surface_Mkm2)    * 31.5 / 1000,
D(Passing_60_Mp_per_y1) ~ 10 * (Passing_40_Mp_per_y - Passing_60_Mp_per_y1) / 20,
D(Passing_60_Mp_per_y2) ~ 10 * (Passing_60_Mp_per_y1 - Passing_60_Mp_per_y2) / 20,
D(Passing_60_Mp_per_y3) ~ 10 * (Passing_60_Mp_per_y2 - Passing_60_Mp_per_y3) / 20,
D(Passing_60_Mp_per_y4) ~ 10 * (Passing_60_Mp_per_y3 - Passing_60_Mp_per_y4) / 20,
D(Passing_60_Mp_per_y5) ~ 10 * (Passing_60_Mp_per_y4 - Passing_60_Mp_per_y5) / 20,
D(Passing_60_Mp_per_y6) ~ 10 * (Passing_60_Mp_per_y5 - Passing_60_Mp_per_y6) / 20,
D(Passing_60_Mp_per_y7) ~ 10 * (Passing_60_Mp_per_y6 - Passing_60_Mp_per_y7) / 20,
D(Passing_60_Mp_per_y8) ~ 10 * (Passing_60_Mp_per_y7 - Passing_60_Mp_per_y8) / 20,
D(Passing_60_Mp_per_y9) ~ 10 * (Passing_60_Mp_per_y8 - Passing_60_Mp_per_y9) / 20,
D(Passing_60_Mp_per_y) ~ 10 * (Passing_60_Mp_per_y9 - Passing_60_Mp_per_y) / 20,
Permanent_owner_cash_inflow_G__per_y ~ (Owner_cash_inflow_G__per_y - Permanent_owner_cash_inflow_G__per_y) / Time_to_adjust_owner_consumption_y,
Permanent_govmnt_cash_inflow_G__per_y ~ (Govmnt_cash_inflow_G__per_y - Permanent_govmnt_cash_inflow_G__per_y) / Time_to_adjust_budget_y,
Deliveries_Gu_per_y ~ ( ( Effective_purchasing_power_G__per_y / Price_per_unit___per_u ) / ( Delivery_delay___index__1_ / DDI_in_1980_y ) ) * IfElse.ifelse(t > 1984, Pink_noise_in_sales__1_, 1),
Land_erosion_rate_1_per_y ~ Land_erosion_rate_in_1980_1_per_y * Fertilizer_effect_on_erosion_rate__1_ * Land_erosion_multiplier__1_,
Green_hydrogen_MtH2_per_y ~ Renewable_electricity_production_TWh_per_y * Fraction_of_renewable_electricity_to_hydrogen__1_ / kWh_el_per_kgH2,
Wage_share__1_ ~ Wage_rate___per_ph / Labour_productivity___per_ph,
Fraction_of_CO2_sources_with_CCS__1_ ~ Fraction_of_CO2_sources_with_CCS_in_2022__1_ + ramp(t,(Goal_for_fraction_of_CO2_sources_with_CCS__1_ - Fraction_of_CO2_sources_with_CCS_in_2022__1_ ) / Introduction_period_for_policy_y , 2022 , 2022 + Introduction_period_for_policy_y),
Cost_of_nuclear_electricity_G__per_y ~ Nuclear_electricity_production_TWh_per_y * Cost_of_nuclear_el___per_kWh,
Cropland_expansion_multiplier__1_ ~ IfElse.ifelse(t > 2022,  1 - SSP2_land_management_action_from_2022___1_ * ramp(t,(1 - 0 )/78, 2022, 2100), 1),
Average_crop_yield_t_crop_per_ha_per_y ~ ( Desired_crop_yield_in_conv_ag_t_crop_per_ha_per_y * ( 1 - Fraction_regenerative_agriculture__1_ ) * Soil_quality_index_in_conv_ag__19801_ + Crop_yield_in_reg_ag_t_crop_per_ha_per_y * Fraction_regenerative_agriculture__1_ ) * CO2_effect_on_land_yield__1_ * Warming_effect_on_land_yield__1_,
National_income_G__per_y ~ Sales_G__per_y,
Electricity_production_TWh_per_y ~ Fossil_electricity_production_TWh_per_y + Nuclear_electricity_production_TWh_per_y + Renewable_electricity_production_TWh_per_y,
Change_in_embedded_CLR_kcu_per_ftj_per_y ~ ROC_in_ECLR_1_per_y * Embedded_CLR_kcu_per_ftj,
Old_growth_removal_Mha_per_y ~ Old_growth_forest_area_Mha_1 * Old_growth_removal_rate_1_per_y * Old_growth_removal_rate_multiplier__1_,
Cost_of_regenerative_agriculture_G__per_y ~ ( Extra_cost_of_reg_ag___per_ha_per_y * Regenerative_agriculture_area_Mha ) / 1000,
Indicated_reform_delay_y ~ Normal_reform_delay_y  * Social_trust_effect_on_reform_delay__1_ * Social_tension_effect_on_reform_delay__1_,
Total_purchasing_power_G__per_y ~ Worker_cash_inflow_G__per_y + Govmnt_cash_inflow_G__per_y + Owner_cash_inflow_G__per_y - Sales_tax_G__per_y,
Traditional_per_person_use_of_electricity_before_EE_MWh_per_p_per_y ~ interpolate(GDP_per_person_k__per_p_per_y, [(0.0,0.0),(10.0,4.0),(20.0,7.0),(30.0,9.0),(50.0,12.0),(65.0,13.0)]),
D(Fossil_electricity_capacity_GW) ~ Addition_of_fossil_el_capacity_GW_per_y-Discard_of_fossil_el_capacity_GW_per_y,
Owner_income_G__per_y ~ National_income_G__per_y * ( 1 - Worker_share_of_output__1_),
Capacity_discard_PIS_Gcu_per_y ~ Capacity_PIS_Gcu / Life_of_capacity_PIS_y,
D(Perceived_warming_deg_C) ~ (Observed_warming_deg_C - Perceived_warming_deg_C) /  Perception_delay_y,
CO2_absorption_in_forestry_land_tCO2_per_ha_per_y ~ 1.6 * Forest_absorption_multipler__1_,
Govmnt_debt_in_1980_G_ ~ 28087 * Mult_to_avoid_transient_in_govmnt_finance,
Pink_noise_in_sales__1_ ~ rand(PinkGaussian(1, p[:Sampling_time_y]))[1],
Discard_of_renewable_el_capacity_GW_per_y ~ Renewable_electricity_capacity_GW / Life_of_renewable_el_capacity_y,
Crop_supply_reg_ag_Mt_crop_per_y ~ Crop_yield_in_reg_ag_t_crop_per_ha_per_y * Cropland_Mha * Fraction_regenerative_agriculture__1_,
D(Fraction_of_govmnt_budget_to_workers__1_) ~ (Goal_for_fraction_of_govmnt_budget_to_workers__1_ - Fraction_of_govmnt_budget_to_workers__1_) / Time_to_implement_new_taxes_y,
CO2_emissions_GtCO2_per_y ~ CO2_from_energy_and_industry_GtCO2_per_y + CO2_emissions_from_LULUC_GtCO2_per_y - Direct_air_capture_of_CO2_GtCO2_per_y,
Change_in_signal_rate_1_per_yy ~ ( Indicated_signal_rate_1_per_y - Central_bank_signal_rate_1_per_y ) / Signal_rate_adjustment_time_y,
Acceptable_loss_of_forestry_land__1_ ~ 1 - exp(-Fraction_forestry_land_remaining__1_/Threshold_FFLR__1_),
Cropland_expansion_rate_1_per_y ~ 1/200 + sFBeoCLE_0 * ( Perceived_crop_balance__1_ - 1 ),
Total_man_made_forcing_W_per_m2 ~ Man_made_forcing_W_per_m2 + Water_vapour_feedback_W_per_m2,
Perceived_surplus_workforce__1_ ~ Acceptable_unemployment_rate__1_ * ( 1 + sPUNeoLPR_0 * ( Perceived_unemployment_rate__1_ / Acceptable_unemployment_rate__1_  - 1 )),
Man_made_forcing_W_per_m2 ~ Forcing_from_CO2_W_per_m2 + Forcing_from_CH4_W_per_m2 + Forcing_from_N2O_W_per_m2 + Forcing_from_other_gases_W_per_m2,
D(Extra_taxes_from_2022_G__per_y) ~ (Goal_for_extra_taxes_from_2022_G__per_y - Extra_taxes_from_2022_G__per_y) /  Time_to_implement_new_taxes_y,
Average_hours_worked_in_1980_kh_per_y ~ Normal_hours_worked_in_1980_kh_per_ftj_per_y / Persons_per_full_time_job_in_1980_p_per_ftj,
ROC_in_WSO___Table_1_per_y ~ interpolate(Perceived_unemployment_rate__1_ / Acceptable_unemployment_rate__1_, [(0.0,0.06),(0.5,0.02),(1.0,0.0),(1.5,-0.007),(2.0,-0.01)]),
kg_N2O_emission_per_kg_fertiliser ~ kg_N2O_per_kg_fertilizer_in_1980 *   exp(-(Rate_of_decline_in_N2O_per_kg_fertiliser_1_per_y)  * ( t - 1980)) * IfElse.ifelse(t > 2022, exp(-(Extra_rate_of_decline_in_N2O_per_kg_fertilizer_from_2022_1_per_y)  * ( t - 2022)), 1),
Extra_normal_LPR_from_2022__1_ ~ ramp(t,Goal_for_extra_normal_LPR__1_ / Introduction_period_for_policy_y, 2022, 2022 + Introduction_period_for_policy_y),
D(Observed_rate_of_progress_1_per_y) ~ (( (( AVERAGE_WELLBEING_INDEX__1_ - Past_AWI__1_) / AVERAGE_WELLBEING_INDEX__1_) / Average_wellbeing_perception_delay_y) - Observed_rate_of_progress_1_per_y) / Average_wellbeing_perception_delay_y,
D(Reduction_in_TFP_from_unprofitable_activity__1_) ~ (Productivity_loss_from_unprofitable_activity__1_ - Reduction_in_TFP_from_unprofitable_activity__1_) / (Investment_planning_time_y + Construction_time_PIS_y),
Govmnt_spending_G__per_y ~ Govmnt_purchases_G__per_y + Govmnt_investment_in_public_capacity_G__per_y,
Social_tension__1_ ~ 1 + sPPReoSTE_0 * ( Observed_rate_of_progress_1_per_y - Acceptable_progress_1_per_y ),
ten_yr_govmnt_interest_rate_1_per_y ~ Govmnt_borrowing_cost_1_per_y + Expected_long_term_inflation_1_per_y,
Crop_use_Mt_per_y ~ Crop_supply__after_20___waste__Mt_crop_per_y * ( 1 + Crop_waste_reduction__1_ ),
Average_wellbeing_from_public_spending__1_ ~ exp(Diminishing_return_public_spending__1_ + log(Public_spending_per_person_k__per_p_per_y / Threshold_public_spending_k__per_p_per_y )),
Low_carbon_el_production_TWh_per_y ~ Renewable_electricity_production_TWh_per_y + Nuclear_electricity_production_TWh_per_y,
Energy_use_per_person_toe_per_p_per_y ~ ENERGY_USE_Mtoe_per_y / Population_Mp,
Crops_for_biofuel_Mt_crop_per_y ~ Biofuels_use_Mtoe_per_y * Ton_crops_per_toe_biofuel,
Cost_of_TAs_G__per_y ~ Cost_of_food_and_energy_TAs_G__per_y,
Public_spending_effect_on_social_trust__1_ ~ interpolate(Public_spending_as_share_of_GDP / Satisfactory_public_spending__1_, [(0.0,0.0),(1.0,1.0)]),
ENERGY_USE_Mtoe_per_y ~ Demand_for_fossil_fuel_for_non_el_use_Mtoe_per_y + Electricity_production_TWh_per_y / four_TWh_el_per_Mtoe + Renewable_heat_production_Mtoe_per_y,
Govmnt_share_of_GDP__1_ ~ Govmnt_spending_G__per_y / National_income_G__per_y,
D(Perceived_unemployment_rate__1_) ~ (Unemployment_rate__1_ - Perceived_unemployment_rate__1_) / Unemployment_perception_time_y,
OWeoTFP ~ IfElse.ifelse(t > 2022, 1 + sOWeoTFP_0 * ( Observed_warming_deg_C / Observed_warming_in_2022_deg_C - 1 ), 1),
D(Passing_20_Mp_per_y1) ~ 10 * (Births_Mp_per_y - Passing_20_Mp_per_y1) / 20,
D(Passing_20_Mp_per_y2) ~ 10 * (Passing_20_Mp_per_y1 - Passing_20_Mp_per_y2) / 20,
D(Passing_20_Mp_per_y3) ~ 10 * (Passing_20_Mp_per_y2 - Passing_20_Mp_per_y3) / 20,
D(Passing_20_Mp_per_y4) ~ 10 * (Passing_20_Mp_per_y3 - Passing_20_Mp_per_y4) / 20,
D(Passing_20_Mp_per_y5) ~ 10 * (Passing_20_Mp_per_y4 - Passing_20_Mp_per_y5) / 20,
D(Passing_20_Mp_per_y6) ~ 10 * (Passing_20_Mp_per_y5 - Passing_20_Mp_per_y6) / 20,
D(Passing_20_Mp_per_y7) ~ 10 * (Passing_20_Mp_per_y6 - Passing_20_Mp_per_y7) / 20,
D(Passing_20_Mp_per_y8) ~ 10 * (Passing_20_Mp_per_y7 - Passing_20_Mp_per_y8) / 20,
D(Passing_20_Mp_per_y9) ~ 10 * (Passing_20_Mp_per_y8 - Passing_20_Mp_per_y9) / 20,
D(Passing_20_Mp_per_y) ~ 10 * (Passing_20_Mp_per_y9 - Passing_20_Mp_per_y) / 20,
Population_below_15_k__per_p_per_y_Mp ~ Population_Mp * Fraction_below_15_k__per_p_per_y__1_,
Births_Mp_per_y ~ Aged_20_40_years_Mp * Fraction_women__1_ * ( Observed_fertility_1 / Fertile_period_y ),
IIASA_Fossil_energy_production_EJ_per_yr ~ Use_of_fossil_fuels_Mtoe_per_y / Mtoe_per_EJ___calorific_equivalent,
Cropland_expansion_Mha_per_y ~ IfElse.ifelse(Forestry_land_Mha>0, Cropland_Mha * Cropland_expansion_rate_1_per_y, 0)  * Acceptable_loss_of_forestry_land__1_ * Cropland_expansion_multiplier__1_,
Control___C_G_S__per_NI_ ~ 1,
Fertility_multiplier__1_ ~ IfElse.ifelse(SSP2_family_action_from_2022___1_ > 0,  IfElse.ifelse(t > 2022, 1 + ramp(t,(Max_fertility_multiplier__1_ - 1 )/78, 2022, 2100), 1),  1),
CAPEX_renewable_el_G__per_y ~ CAPEX_renewable_el___per_W * Addition_of_renewable_el_capacity_GW_per_y,
D(Aged_40_60_Mp) ~ Passing_40_Mp_per_y-Passing_60_Mp_per_y,
Water_vapor_concentration_g_per_kg ~ Water_vapour_concentration_1980_g_per_kg * ( 1 + sOWeoWV_0 * ( Observed_warming_deg_C/ Warming_in_1980_deg_C - 1 )),
Urban_expansion_Mha_per_y ~ max(0, ( Indicated_urban_land_Mha - Urban_land_Mha ) / Urban_development_time_y),
Desired_renewable_electricity_share__1_ ~ Renewable_el_fraction_in_1980__1_ + ramp(t,(Renewable_el_fraction_in_2022__1_ - Renewable_el_fraction_in_1980__1_ ) / 42, 1980, 2022) + ramp(t,(Goal_for_renewable_el_fraction__1_ - Renewable_el_fraction_in_2022__1_ ) / Introduction_period_for_policy_y, 2022, 2022 + Introduction_period_for_policy_y ),
State_capacity__fraction_of_GDP_ ~ Value_of_public_services_supplied_G__per_y / GDP_G__per_y,
Income_from_commons_from_2022_G__per_y ~ National_income_G__per_y * IfElse.ifelse(t > 2022,  ramp(t,Goal_for_extra_income_from_commons__share_of_NI_ / Introduction_period_for_policy_y , 2022, 2020 + Introduction_period_for_policy_y) , 0),
Infrastructure_purchases_ratio_y ~ Capacity_PUS_Gcu / Govmnt_purchases_G__per_y,
Value_of_public_services_supplied_G__per_y ~ Govmnt_purchases_G__per_y * Productivity_of_public_purchases__1_,
Heat_to_deep_ocean_ZJ_per_y ~ Extra_heat_in_surface_ZJ * Transfer_rate_for_heat_going_to_abyss_1_per_y,
Max_workers_debt_G_ ~ Worker_income_G__per_y * Max_workers_debt_burden_y,
Life_of_capacity_PUS_y ~ Life_of_capacity_PUS_in_1980_y,
TWh_el_per_EJ___engineering_equivalent ~ TWh_heat_per_EJ___calorific_equivalent * Efficiency_of_fossil_power_plant_TWh_el_per_TWh_heat,
GDP_per_person_k__per_p_per_y ~ GDP_G__per_y / Population_Mp,
Change_in_TFP_1_per_y ~ Rate_of_technological_advance_1_per_y * TFP_excluding_effect_of_5TAs__1_,
Introduction_period_for_policy_y ~ IfElse.ifelse(Exogenous_introduction_period_>0, Exogenous_introduction_period_y, Reform_delay_y),
CH4_breakdown_GtCH4_per_y ~ CH4_in_atmosphere_GtCH4 / Life_of_CH4_in_atm_y,
Cost_of_extra_fertility_reduction__share_of_GDP_ ~ Cost_of_Max_fertility_reduction__share_of_GDP_ * Extra_fertility_reduction__1_,
Available_workforce_Mp ~ Working_age_population_Mp * Labour_participation_rate__1_,
Demand_for_electricity_TWh_per_y ~ Demand_for_electricity_before_NE_TWh_per_y + Extra_increase_in_demand_for_electricity_from_NE_TWh_per_y,
Sales_tax_owners_G__per_y ~ Owner_consumption_G__per_y * Sales_tax_rate__1_,
Aged_60___Mp ~ Passing_60_Mp_per_y-Deaths_Mp_per_y,
Owner_savings_G__per_y ~ Permanent_owner_cash_inflow_G__per_y - Owner_consumption_G__per_y,
Govmnt_net_income_G__per_y ~ Govmnt_gross_income_G__per_y - Transfer_payments_G__per_y + Sales_tax_G__per_y,
D(Past_GDP_per_person_k__per_y) ~ (GDP_per_person_k__per_p_per_y - Past_GDP_per_person_k__per_y) / Time_to_establish_growth_rate_y,
Pension_age_y ~ IfElse.ifelse(Life_expectancy_y < LE_in_1980, Pension_age_in_1980_y, Pension_age_in_1980_y + sLEeoPa_0 * ( Life_expectancy_y + Extra_pension_age_y  - LE_in_1980 )),
D(Perceived_inflation_CB_1_per_y) ~ (Inflation_rate_1_per_y - Perceived_inflation_CB_1_per_y) / Inflation_perception_time_CB_y,
Worker_taxes_G__per_y ~ Income_tax_workers__1_ + Extra_taxes_from_2022_G__per_y * ( 1 - Fraction_of_extra_taxes_paid_by_owners__1_ ),
D(Reform_delay_y) ~ (Indicated_reform_delay_y - Reform_delay_y) / Time_to_change_reform_delay_y,
Bank_cash_inflow_from_lending_G__per_y ~ Cash_flow_from_workers_to_banks_G__per_y + Cash_flow_from_govmnt_to_banks_G__per_y,
D(Deaths_Mp_per_y1) ~ 10 * (Passing_60_Mp_per_y - Deaths_Mp_per_y1) / LE_at_60_y,
D(Deaths_Mp_per_y2) ~ 10 * (Deaths_Mp_per_y1 - Deaths_Mp_per_y2) / LE_at_60_y,
D(Deaths_Mp_per_y3) ~ 10 * (Deaths_Mp_per_y2 - Deaths_Mp_per_y3) / LE_at_60_y,
D(Deaths_Mp_per_y4) ~ 10 * (Deaths_Mp_per_y3 - Deaths_Mp_per_y4) / LE_at_60_y,
D(Deaths_Mp_per_y5) ~ 10 * (Deaths_Mp_per_y4 - Deaths_Mp_per_y5) / LE_at_60_y,
D(Deaths_Mp_per_y6) ~ 10 * (Deaths_Mp_per_y5 - Deaths_Mp_per_y6) / LE_at_60_y,
D(Deaths_Mp_per_y7) ~ 10 * (Deaths_Mp_per_y6 - Deaths_Mp_per_y7) / LE_at_60_y,
D(Deaths_Mp_per_y8) ~ 10 * (Deaths_Mp_per_y7 - Deaths_Mp_per_y8) / LE_at_60_y,
D(Deaths_Mp_per_y9) ~ 10 * (Deaths_Mp_per_y8 - Deaths_Mp_per_y9) / LE_at_60_y,
D(Deaths_Mp_per_y) ~ 10 * (Deaths_Mp_per_y9 - Deaths_Mp_per_y) / LE_at_60_y,
Demand_pulse_2020_25__1_ ~ 0 + Pulse_height__1_* pulse(t, 2020, 5),
Change_in_workforce_Mp_per_y ~ ( Optimal_workforce_Mp - Workforce_Mp ) / Hiring_per_firing_delay_y,
D(Old_growth_forest_area_Mha_1) ~ -New_forestry_land_Mha_per_y-New_grazing_land_Mha_per_y,
Grazing_land_yield_kg_red_meat_per_ha_per_y ~ Grazing_land_yied_in_1980_kg_red_meat_per_ha_per_y + 0 * CO2_concentration_in_atm_ppm - 0 * Observed_warming_deg_C,
Logistic_k__1_ ~ Normal_k__1_ * Inequity_effect_on_logistic_k__1_,
Social_trust_effect_on_reform_delay__1_ ~ 1 + sSTReoRD_0 * ( Social_trust__1_ / Social_trust_in_1980__1_ - 1 ),
Cost_of_capacity___per_cu ~ Cost_of_capacity_in_1980___per_cu * OWeoCOC__1_,
Govmnt_finance_as_share_of_NI__1_ ~ ( Govmnt_interest_cost_G__per_y + Govmnt_payback_G__per_y ) / National_income_G__per_y,
Potential_red_meat_from_grazing_land_Mt_red_meat_per_y ~ Grazing_land_Mha * Grazing_land_yield_kg_red_meat_per_ha_per_y / 1000,
Fraction_regenerative_agriculture__1_ ~ ramp(t,Goal_for_fraction_regenerative_agriculture__1_ / Introduction_period_for_policy_y , 2022, 2020 + Introduction_period_for_policy_y),
Demand_for_fossil_fuel_for_non_el_use_before_NE_Mtoe_per_y ~ ( Population_Mp * Traditional_per_person_use_of_fossil_fuels_for_non_el_use_before_EE_toe_per_p_per_y  * exp(-Normal_increase_in_energy_efficiency_1_per_y * ( t - 1980 ))) / Extra_energy_productivity_index_20221,
D(Govmnt_debt_G_) ~ Govmnt_new_debt_G__per_y-Cancellation_of_debt_G__per_y-Govmnt_payback_G__per_y,
Food_sector_productivity_index__19801_ ~ exp(ROC_in_food_sector_productivity_1_per_y * ( t - 1980)) * IfElse.ifelse(t > 2022, exp( Extra_ROC_in_food_sector_productivity_from_2022_1_per_y* ( t - 2022)), 1),
Aged_20_pension_age_Mp ~ Aged_20_40_years_Mp + Aged_40_60_Mp + Aged_60___Mp - On_pension_Mp,
Capacity_addition_PUS_Gcu_per_y ~ Capacity_under_construction_PUS_Gcu / Construction_time_PUS_y,
Extra_cost_of_TAs_from_2022_G__per_y ~ max(0, Cost_of_TAs_G__per_y - Cost_of_TAs_in_2022_G__per_y),
Non_fossil_CO2_per_person_tCO2_per_p_per_y ~ Max_non_fossil_CO2_per_person_tCO2_per_p_per_y * ( 1 - exp(-(GDP_per_person_k__per_p_per_y / 10))),
Direct_air_capture_of_CO2_GtCO2_per_y ~ IfElse.ifelse(t > 2022,  ramp(t,(Direct_air_capture_of_CO2_in_2100_GtCO2_per_y ) / Introduction_period_for_policy_y , 2022, 2022 + Introduction_period_for_policy_y) , 0 ),
Melting_rate_surface_1_per_y ~ Melting_rate_surface_in_1980_1_per_y * ( Observed_warming_deg_C / Warming_in_1980_deg_C ),
Owner_operating_income_after_tax_G__per_y ~ Owner_income_G__per_y - Owner_taxes_G__per_y,
Rate_of_technological_advance_1_per_y ~ ( Domestic_rate_of_technological_advance_1_per_y + 0 ) * Reduction_in_ROTA_from_inequality_1_per_y + Imported_ROTA_1_per_y,
N2O_forcing_per_ppm_W_per_m2_per_ppm ~ interpolate(t, [(1980.0,0.43),(2000.0,0.64),(2010.0,0.73),(2020.0,0.8),(2100.0,1.0)]),
New_forestry_land_Mha_per_y ~ Old_growth_removal_Mha_per_y * ( 1 - Fraction_cleared_for_grazing__1_),
Extra_taxes_for_TAs_from_2022_G__per_y ~ IfElse.ifelse(t > 2022, Extra_cost_of_TAs_from_2022_G__per_y * Fraction_of_extra_TA_cost_paid_by_extra_taxes__1_ , 0 ),
Traditional_grid_cost_G__per_y ~ Demand_for_electricity_before_NE_TWh_per_y * Transmission_cost___per_kWh,
Income_tax_owners__1_ ~ Basic_income_tax_rate_owners__1_ * National_income_G__per_y * ( 1 - Worker_share_of_output__1_),
Corporate_borrowing_cost_1_per_y ~ Cost_of_capital_for_secured_debt_1_per_y + Normal_corporate_credit_risk_1_per_y,
Unemployment_rate__1_ ~ Unemployed_Mp / Available_workforce_Mp,
D(Output_last_year_G__per_y) ~ (Optimal_real_output_Gu_per_y - Output_last_year_G__per_y) / 1,
D(Urban_land_Mha) ~ Urban_expansion_Mha_per_y,
D(Soil_quality_index_in_conv_ag__19801_) ~ Change_in_soil_quality_in_conv_ag_t_crop_per_ha_per_y_per_y,
GDP_G__per_y ~ Output_Gu_per_y * Price_per_unit___per_u,
Dependency_ratio_p_per_p ~ ( Aged_0_20_years_Mp + Aged_60___Mp ) / ( Aged_20_40_years_Mp + Aged_40_60_Mp ),
Owner_taxes_G__per_y ~ Income_tax_owners__1_ + Extra_taxes_from_2022_G__per_y * Fraction_of_extra_taxes_paid_by_owners__1_,
Owner_cash_inflow_G__per_y ~ Owner_operating_income_after_tax_G__per_y,
Natural_N2O_emissions_GtN2O_per_y ~ interpolate(t, [(1980.0,0.009),(2020.0,0.009),(2099.27,0.0)]),
Indicated_urban_land_Mha ~ Population_Mp * Urban_land_per_population_ha_per_p,
Desired_crop_yield_in_conv_ag_t_crop_per_ha_per_y ~ Desired_crop_supply_conv_ag_Mt_crop_per_y / ( Cropland_Mha * ( 1 - Fraction_regenerative_agriculture__1_ )),
Traditional_use_of_crops_ex_red_meat_Mt_per_y ~ ( Traditional_use_of_crops_Mt_per_y - Traditional_use_of_feed_for_red_meat_Mt_crop_per_y ) / Food_sector_productivity_index__19801_,
Cost_of_CCS_G__per_y ~ Installed_CCS_capacity_GtCO2_per_y * Cost_of_CCS___per_tCO2,
Man_made_CH4_emissions_GtCH4_per_y ~ (Crop_supply__after_20___waste__Mt_crop_per_y * kg_CH4_emission_per_kg_crop ) / 1000,
CO2_effect_on_land_yield__1_ ~ IfElse.ifelse(t > 2022, 1 + sCO2CeoACY_0 * ( CO2_concentration_in_atm_ppm / CO2_concentration_in_2022_ppm - 1 ), 1),
Heat_to_space_ZJ_per_y ~ Extra_heat_in_surface_ZJ * Transfer_rate_for_heat_going_to_space_1_per_y,
Optimal_workforce_Mp ~ ( Capacity_Gcu / Optimal_capital_labour_ratio_kcu_per_ftj ) * Persons_per_full_time_job_p_per_ftj,
Worker_savings_G__per_y ~ Permanent_worker_cash_inflow_G__per_y - Worker_consumption_demand_G__per_y,
Extra_pension_age_y ~ ramp(t,(Goal_for_extra_pension_age_y - Extra_pension_age_in_2022_y ) / Introduction_period_for_policy_y, 2022, 22022 + Introduction_period_for_policy_y),
Public_services_per_person_k__per_p_per_y ~ Value_of_public_services_supplied_G__per_y / Population_Mp,
D(Extra_energy_productivity_index_20221) ~ Increase_in_extra_energy_productivity_index_1_per_y,
FOOD_FOOTPRINT_INDEX__19801_ ~ Food_footprint / Food_footprint_in_1980,
Old_growth_removal_rate_1_per_y ~ OGRR_in_1980_1_per_y * FFLReoOGRR,
Traditional_use_of_crops_ex_red_meat_per_person_kg_crop_per_p_per_y ~ Traditional_use_of_crops_ex_red_meat_Mt_per_y * 1000 / Population_Mp,
D(Normal_hours_worked_kh_per_ftj_per_y) ~ (( Normal_hours_worked_in_1980_kh_per_ftj_per_y * Hours_worked_mult_from_GDPpp__1_) - Normal_hours_worked_kh_per_ftj_per_y) /  Time_to_adjust_hours_worked_y,
Average_wellbeing_from_progress__1_ ~ ( 1 + sROPeoAW_0 * ( Observed_rate_of_progress_1_per_y - Threshold_progress_rate_1_per_y )) * Wellbeing_effect_of_participation__1_,
Workers_new_debt_G__per_y ~ max(0, ( Max_workers_debt_G_ - Workers_debt_G_ ) / Workers_drawdown_period_y),
Fossil_electricity_production_TWh_per_y ~ Fossil_electricity_capacity_GW * Fossil_capacity_up_time_kh_per_y,
Worker_tax_rate__1_ ~ Worker_taxes_G__per_y / Worker_income_G__per_y,
CO2_forcing_per_ppm_W_per_m2_per_ppm ~ interpolate(t, [(1980.0,0.0032),(1990.0,0.0041),(2000.0,0.0046),(2020.0,0.0051),(2100.0,0.006)]),
tCO2_per_toe ~ 2.8*exp(ROC_in_tCO2_per_toe_1_per_y * (t -1980)),
Traditional_cost_of_fossil_fuel_for_non_el_use_G__per_y ~ ( Demand_for_fossil_fuel_for_non_el_use_before_NE_Mtoe_per_y * Traditional_cost_of_fossil_fuel_for_non_el_use___per_toe / 1000 ) * Adjustment_factor_to_make_costs_match_1980_2022__1_,
Cost_of_energy_as_share_of_GDP__1_ ~ Cost_of_energy_G__per_y / GDP_G__per_y,
Desired_no_of_children_1 ~ ( ( DNCmin + ( DNC_in_1980 - DNCmin ) * exp(-DNCgamma * ( Effective_GDP_per_person_k__per_p_per_y - GDP_per_person_in_1980_k__per_p_per_y ))) * (1 + DNCalfa_0 * (Effective_GDP_per_person_k__per_p_per_y - GDP_per_person_in_1980_k__per_p_per_y)) ) * ( 1 - Extra_fertility_reduction__1_ ) * Fertility_multiplier__1_,
Fraction_new_red_meat__1_ ~ ramp(t,Goal_for_fraction_new_red_meat__1_ / Introduction_period_for_policy_y , 2022, 2022 + Introduction_period_for_policy_y),
On_pension_Mp ~ Aged_60___Mp * (Life_expectancy_y - Pension_age_y ) / ( Life_expectancy_y - 60 ),
Number_of_doublings_in_sun_and_wind_capacity__1_ ~ log(2)+ log(Accumulated_sun_and_wind_capacity_from_1980_GW / Sun_and_wind_capacity_in_1980_GW),
Inequity_effect_on_logistic_k__1_ ~ 1 + sINEeoLOK_0 * ( Inequality__1_ / 0.5 - 1 ),
Demand_in_1980_G__per_y ~ Optimal_output_in_1980_Gu_per_y * Price_per_unit___per_u * SWI_in_1980__1_,
D(Output_growth_rate_1_per_y) ~ (( (Optimal_real_output_Gu_per_y - Output_last_year_G__per_y ) / Output_last_year_G__per_y / 1) - Output_growth_rate_1_per_y) / 1,
OPEX_renewable_el_G__per_y ~ OPEX_renewable_el___per_kWh * Renewable_electricity_production_TWh_per_y,
Govmnt_cash_inflow_G__per_y ~ Govmnt_net_income_G__per_y - Cash_flow_from_govmnt_to_banks_G__per_y,
Extra_cooling_from_ice_melt_ZJ_per_y ~ Melting_rate_deep_ice_1_per_y * Amount_of_ice_in_1980_Mkm3 * Ton_per_m3_ice * Heat_required_to_melt_ice_kJ_per_kg,
WSO_effect_on_flow_to_capacity_addition__1_ ~ 1 + sWSOeoFRA_0 * (Wage_share__1_ / WSO_in_1980__1_ - 1 ),
four_TWh_el_per_Mtoe ~ TWh_el_per_EJ___engineering_equivalent / Mtoe_per_EJ___calorific_equivalent,
Desired_fossil_el_capacity_change_GW_per_y ~ ( Desired_fossil_el_capacity_GW - Fossil_electricity_capacity_GW ) / Fossil_el_cap_construction_time_y + Discard_of_fossil_el_capacity_GW_per_y,
xExtra_cost_of_TAs_as_share_of_GDP__1_ ~ xExtra_TA_cost_in_2022__share_of_GDP_ + ramp(t,(xExtra_TA_cost_in_2100__share_of_GDP_-xExtra_TA_cost_in_2022__share_of_GDP_)/78, 2022, 2022 + 78),
Price_per_unit___per_u ~ Cost_per_unit_in_1980___per_u * ( 1 + Margin_in_1980__1_ ),
D(Social_trust__1_) ~ (Indicated_social_trust__1_ - Social_trust__1_) / Time_to_establish_social_trust_y,
Cost_of_electricity_G__per_y ~ Cost_of_fossil_electricity_G__per_y + Cost_of_renewable_electricity_G__per_y + Cost_of_nuclear_electricity_G__per_y,
Govmnt_spending_as_share_of_GDP ~ Govmnt_spending_G__per_y / GDP_G__per_y,
Traditional_use_of_crops_per_person_kg_crop_per_p_per_y ~ interpolate(GDP_per_person_k__per_p_per_y, [(0.0,400.0),(6.1,680.0),(8.7,780.0),(13.9,950.0),(20.0,1050.0),(30.0,1150.0),(40.0,1250.0),(60.0,1350.0),(100.0,1550.0)]),
Worker_income_after_tax_G__per_y ~ Worker_income_G__per_y - Worker_taxes_G__per_y + Transfer_payments_G__per_y,
N2O_conc_in_1980_ppm ~ N2O_in_atm_in_1980_GtN2O / Mass_of_atmosphere_Zt,
Average_hours_worked_kh_per_y ~ Normal_hours_worked_kh_per_ftj_per_y / Persons_per_full_time_job_p_per_ftj,
Fertilizer_use_per_person_kg_per_p_per_y ~ ( Fertilizer_use_Mt_per_y / Population_Mp ) * 1000,
Labour_productivity___per_ph ~ ( Output_Gu_per_y * Price_per_unit___per_u ) / Labour_use_Gph_per_y,
Worker_disposable_income_k__per_p_per_y ~ Permanent_worker_cash_inflow_G__per_y / Workforce_Mp,
Goal_for_extra_taxes_from_2022_G__per_y ~ Extra_general_tax_from_2022_G__per_y + Extra_taxes_for_TAs_from_2022_G__per_y,
FRACA_mult_from_GDPpp___Table__1_ ~ interpolate(GDP_per_person_k__per_p_per_y / GDP_per_person_in_1980, [(0.0,1.0),(1.0,1.0),(2.0,0.85),(2.1,0.84),(4.0,0.65),(8.0,0.55),(16.0,0.5)]),
Change_in_wso_1_per_y ~ Worker_share_of_output__1_ * ROC_in_WSO___Table_1_per_y,
CH4_forcing_per_ppm_W_per_m2_per_ppm ~ interpolate(t, [(1980.0,0.82),(2000.0,0.94),(2020.0,1.01),(2100.0,1.1)]),
Labour_use_Gph_per_y ~ Workforce_Mp * Average_hours_worked_kh_per_y,
CO2_absorption_GtCO2_per_y ~ ( CO2_in_atmosphere_GtCO2 - CO2_in_atm_in_1850_GtCO2 ) / Life_of_extra_CO2_in_atm_y,
Sales_tax_workers_G__per_y ~ Worker_consumption_demand_G__per_y * Sales_tax_rate__1_,
Traditional_per_person_use_of_fossil_fuels_for_non_el_use_before_EE_toe_per_p_per_y ~ interpolate(GDP_per_person_k__per_p_per_y, [(0.0,0.3),(15.0,2.0),(25.0,3.1),(35.0,4.0),(50.0,5.0)]),
Renewable_heat_production_Mtoe_per_y ~ Biomass_energy_Mtoe_per_y + Green_hydrogen_Mtoe_per_y,
Govmnt_interest_cost_G__per_y ~ Govmnt_debt_G_ * Govmnt_borrowing_cost_1_per_y,
Traditional_use_of_feed_for_red_meat_Mt_crop_per_y ~ (((Traditional_use_of_red_meat_per_person_kg_red_meat_per_p_per_y / 1000) * Population_Mp ) - Red_meat_from_grazing_land_Mt_red_meat_per_y )*kg_crop_per_kg_red_meat,
Indicated_social_trust__1_ ~ Public_spending_effect_on_social_trust__1_ * Inequity_effect_on_social_trust__1_,
Worker_debt_burden_y ~ Workers_debt_G_ / Worker_income_after_tax_G__per_y,
D(Capacity_PIS_Gcu) ~ Capacity_addition_PIS_Gcu_per_y-Capacity_discard_PIS_Gcu_per_y,
Red_meat_from_feedlots_Mt_red_meat_per_y ~ Demand_for_red_meat_Mt_red_meat_per_y- Red_meat_from_grazing_land_Mt_red_meat_per_y,
D(Aged_20_40_years_Mp) ~ Passing_20_Mp_per_y-Passing_40_Mp_per_y,
Warming_effect_on_land_yield__1_ ~ IfElse.ifelse(t > 2022, 1 + sOWeoACY_0 * ( Observed_warming_deg_C / Observed_warming_in_2022_deg_C - 1 ), 1),
Cash_flow_from_govmnt_to_banks_G__per_y ~ Govmnt_interest_cost_G__per_y + Govmnt_payback_G__per_y - Govmnt_new_debt_G__per_y,
Optimal_real_output_Gu_per_y ~ Optimal_output_in_1980_Gu_per_y *  ( ( Capacity_PIS_Gcu + Capacity_PUS_Gcu ) / ( CAP_PIS_in_1980_Gcu + CAP_PUS_in_1980_Gcu) )^Kappa *  ( Labour_use_Gph_per_y / Labour_use_in_1980_Gph_per_y )^Lambda  *  ( Embedded_TFP__1_ ),
Ratio_of_Energy_cost_to_Trad_energy_cost__1_ ~ Cost_of_energy_G__per_y / Traditional_cost_of_energy_G__per_y,
Desired_fossil_el_capacity_GW ~ Demand_for_fossil_electricity_TWh_per_y / eight_khours_per_year,
Cost_index_for_sun_and_wind_capacity__1_ ~ ( 1 - Cost_reduction_per_doubling_of_sun_and_wind_capacity__1_ ) ^ Number_of_doublings_in_sun_and_wind_capacity__1_,
Govmnt_purchases_G__per_y ~ Permanent_govmnt_cash_inflow_G__per_y * Government_consumption_fraction__1_,
Food_footprint_in_1980 ~ Cropland_in_1980_Mha * Fertilizer_use_in_1980_Mt_per_y,
Govmnt_investment_in_public_capacity_G__per_y ~ Permanent_govmnt_cash_inflow_G__per_y - Govmnt_purchases_G__per_y,
D(Fraction_of_available_capital_to_new_capacity__1_) ~ ((FRA_in_1980__1_ * FRACA_mult_from_GDPpp___Line__1_ * ( WSO_effect_on_flow_to_capacity_addition__1_  +  CBC_effect_on_flow_to_capacity_addion__1_  +  ED_effect_on_flow_to_capacity_addition__1_  ) / 3) - Fraction_of_available_capital_to_new_capacity__1_) / Investment_planning_time_y,
Capacity_Gcu ~ Capacity_PIS_Gcu + Capacity_PUS_Gcu,
Green_hydrogen_Mtoe_per_y ~ Green_hydrogen_MtH2_per_y * toe_per_tH2,
ROC_in_ECLR_1_per_y ~ ROC_in_ECLR_in_1980_1_per_y * GDPppeoROCCLR,
Bank_cash_inflow_as_share_of_NI__1_ ~ Bank_cash_inflow_from_lending_G__per_y / National_income_G__per_y,
Working_age_population_Mp ~ Aged_20_pension_age_Mp,
Use_of_fossil_fuels_Mtoe_per_y ~ Demand_for_fossil_fuel_for_non_el_use_Mtoe_per_y + Fossil_fuels_for_electricity_Mtoe_per_y,
Demand_for_electricity_before_NE_TWh_per_y ~ ( Population_Mp  * Traditional_per_person_use_of_electricity_before_EE_MWh_per_p_per_y  * exp(-Normal_increase_in_energy_efficiency_1_per_y * ( t - 1980))) / Extra_energy_productivity_index_20221,
Govmnt_borrowing_cost_1_per_y ~ threem_interest_rate_1_per_y,
CO2_per_GDP__kgCO2_per___ ~ ( CO2_emissions_GtCO2_per_y / GDP_G__per_y ) * 1000,
Average_wellbeing_from_global_warming__1_ ~ max(Min_wellbeing_from_global_warming__1_, min(1, 1 + sGWeoAW_0 * ( Perceived_warming_deg_C / Threshold_warming_deg_C - 1))),
Excess_demand__1_ ~ Total_purchasing_power_G__per_y / Optimal_ouput___value_G__per_y,
CO2_absorption_in_forestry_land_GtCO2_per_y ~ Forestry_land_Mha  * (CO2_absorption_in_forestry_land_tCO2_per_ha_per_y / 1000 ) * CO2_effect_on_land_yield__1_ * Warming_effect_on_land_yield__1_,
Forcing_from_CH4_W_per_m2 ~ CH4_concentration_in_atm_ppm * CH4_forcing_per_ppm_W_per_m2_per_ppm,
Off_balance_sheet_govmnt_inv_in_PIS__share_of_GDP_ ~ IfElse.ifelse(t > 2022, Unconventional_stimulus_in_PIS_from_2022__share_of_GDP_, 0),
Hiring_per_firing_delay_y ~ ten_yr_loop_delay_y / 3,
ED_effect_on_flow_to_capacity_addition__1_ ~ 1 + sEDeoFRA_0 * ( Perceived_excess_demand__1_/ Excess_demand_in_1980__1_ - 1 ),
Consumption_share_of_GDP__1_ ~ Consumption_demand_G__per_y / National_income_G__per_y,
Addition_of_renewable_el_capacity_GW_per_y ~ max(0, ( Desired_renewable_el_capacity_change_GW / Renewable_el_construction_time_y ) + ( Discard_of_renewable_el_capacity_GW_per_y )),
D(Wage_effect_on_optimal_CLR__1_) ~ (Indicated_wage_effect_on_optimal_CLR__1_ - Wage_effect_on_optimal_CLR__1_) / Time_to_change_tooling_y,
Feed_for_red_meat_Mt_crop_per_y ~ Red_meat_from_feedlots_Mt_red_meat_per_y * kg_crop_per_kg_red_meat,
Cost_of_food_and_energy_TAs_G__per_y ~ Cost_of_food_G__per_y + Cost_of_energy_G__per_y,
D(Perceived_excess_demand__1_) ~ (Excess_demand__1_ - Perceived_excess_demand__1_) / Time_to_observe_excess_demand_y,
Indicated_TFP__1_ ~ TFP_including_effect_of_5TAs__1_ * OWeoTFP,
D(Expected_long_term_inflation_1_per_y) ~ (Perceived_inflation_CB_1_per_y - Expected_long_term_inflation_1_per_y) / Inflation_expectation_formation_time_y,
D(Shifts_worked___index__1_) ~ (Desired_shifts_worked___index__1_ - Shifts_worked___index__1_) / Time_to_adjust_shifts_y,
Inequality__1_ ~ Owner_operating_income_after_tax_G__per_y / Worker_income_after_tax_G__per_y,
Desired_crop_supply_Mt_crop_per_y ~ Crop_demand_Mt_crop_per_y,
Red_meat_supply_per_person_kg_red_meat_per_p_per_y ~ (Red_meat_from_grazing_land_Mt_red_meat_per_y + Red_meat_from_feedlots_Mt_red_meat_per_y * min(1, Crop_balance__1_) ) * 1000 / Population_Mp,
Fossil_fuels_for_electricity_Mtoe_per_y ~ Fossil_electricity_production_TWh_per_y / four_TWh_el_per_Mtoe,
Extra_cost_of_Food_Turnaround_as_share_of_GDP__1_ ~ Extra_cost_of_Food_Turnaround_G__per_y / GDP_G__per_y,
CH4_concentration_in_atm_ppm ~ CH4_in_atmosphere_GtCH4 / GtCH4_per_ppm,
Owner_savings_fraction__1_ ~ Owner_savings_fraction_in_1980  *  ( 1 + sGDPeoOSR_0 *  ( Effective_GDP_per_person_k__per_p_per_y / GDP_per_person_in_1980_k__per_p_per_y - 1 )),
Cancellation_of_debt_G__per_y ~ pulse(t, 2022, 1)* Govmnt_debt_G_ * Fraction_of_govmnt_debt_cancelled_in_2022_1_per_y,
Investment_in_new_capacity_PIS_G__per_y ~ Available_capital_G__per_y * Fraction_of_available_capital_to_new_capacity__1_,
Desired_renewable_el_capacity_change_GW ~ Desired_renewable_el_capacity_GW - Renewable_electricity_capacity_GW,
Melting_Mha_per_y ~ Ice_and_snow_cover_excl_G_A_Mkm2 * Melting_rate_surface_1_per_y,
Normal_LPR__1_ ~ (Normal_LPR_in_1980__1_  * (1 + sWSOeoLPR_0 * ( Worker_share_of_output__1_ / WSO_in_1980__1_ - 1 ))) + Extra_normal_LPR_from_2022__1_,
Extra_cost_of_Energy_Turnaround_as_share_of_GDP__1_ ~ IfElse.ifelse(t > 2022, ( Cost_of_energy_G__per_y - Traditional_cost_of_energy_G__per_y ) / GDP_G__per_y, 0),
Demand_for_fossil_fuel_for_non_el_use_Mtoe_per_y ~ Demand_for_fossil_fuel_for_non_el_use_before_NE_Mtoe_per_y -  Extra_reduction_in_demand_for_non_el_fossil_fuel_from_NE_Mtoe_per_y,
Excess_demand_effect_on_life_of_capacity__1_ ~ 1 + sEDeoLOC_0 * (Perceived_excess_demand__1_ / Excess_demand_in_1980__1_ - 1),
Addition_of_sun_and_wind_capacity_GW_per_y ~ Addition_of_renewable_el_capacity_GW_per_y,
Cost_of_air_capture_G__per_y ~ Direct_air_capture_of_CO2_GtCO2_per_y * Cost_of_CCS___per_tCO2,
CO2_from_energy_and_industry_GtCO2_per_y ~ CO2_from_energy_production_GtCO2_per_y + CO2_from_non_fossil_industrial_processes_GtCO2_per_y,
N2O_breakdown_GtN2O_per_y ~ N2O_in_atmosphere_GtN2O / Life_of_N2O_in_atm_y,
Fertilizer_cost_reduction_G__per_y ~ ( Amount_of_fertilizer_saved_in_reg_ag_kgN_per_ha_per_y / 1000) * Regenerative_agriculture_area_Mha * (Cost_per_ton_fertilizer___per_t ),
CH4_conc_in_1980_ppm ~ CH4_in_atm_in_1980_GtCH4 / Mass_of_atmosphere_Zt,
Addition_of_fossil_el_capacity_GW_per_y ~ max(0, Desired_fossil_el_capacity_change_GW_per_y),
Worker_finance_cost_as_share_of_income__1_ ~ Cash_flow_from_workers_to_banks_G__per_y / Worker_income_after_tax_G__per_y,
Inequity_effect_on_social_trust__1_ ~ interpolate(Inequality__1_/ Acceptable_inequality__1_, [(0.0,1.0),(1.0,1.0),(2.0,0.0)]),
Cost_index_for_Regenerative_agriculture__1_ ~ ( 1 - Cost_reduction_per_doubling_in_Regenerative_agriculture__1_ ) ^ Number_of_doublings_in_reg_ag__1_,
Fertilizer_productivity_index__19801_ ~ exp(ROC_in_fertilizer_productivity_1_per_y * ( t - 1980)),
D(Ice_and_snow_cover_excl_G_A_Mkm2) ~ -Melting_Mha_per_y,
kg_CH4_emission_per_kg_crop ~ kg_CH4_per_kg_crop_in_1980  *   exp(-(Rate_of_decline_in_CH4_per_kg_crop_1_per_y)  * ( t - 1980)) *IfElse.ifelse(t > 2022, exp(-(Extra_rate_of_decline_in_CH4_pr_kg_crop_after_2022_1_per_y)  * ( t - 2022)), 1),
Fossil_capacity_up_time_kh_per_y ~ Demand_for_fossil_electricity_TWh_per_y / Fossil_electricity_capacity_GW,
Natural_CH4_emissions_GtCH4_per_y ~ interpolate(t, [(1980.0,0.19),(2020.0,0.19),(2100.0,0.19)]),
New_grazing_land_Mha_per_y ~ Old_growth_removal_Mha_per_y * Fraction_cleared_for_grazing__1_,
D(Worker_share_of_output__1_) ~ Change_in_wso_1_per_y-Long_term_erosion_of_wso_1_per_y,
Albedo_in_1980__1_ ~ ( Ice_and_snow_cover_excl_Greenland_and_Antarctica_in_1980_Mkm2 * Albedo_ice_and_snow__1_ + ( Global_surface_Mkm2 - Ice_and_snow_cover_excl_Greenland_and_Antarctica_in_1980_Mkm2 ) * Albedo_global_average__1_ ) / Global_surface_Mkm2,
Average_wellbeing_from_disposable_income__1_ ~ exp(Diminishing_return_disposable_income__1_ + log(Worker_disposable_income_k__per_p_per_y / Threshold_disposable_income_k__per_p_per_y )),
CAPEX_fossil_el_G__per_y ~ CAPEX_fossil_el___per_W * Addition_of_fossil_el_capacity_GW_per_y,
Cropland_loss_Mha_per_y ~ Cropland_Mha * Land_erosion_rate_1_per_y,
Worker_interest_cost_G__per_y ~ Workers_debt_G_ * Worker_borrowing_cost_1_per_y,
D(Permanent_worker_cash_inflow_G__per_y) ~ (Worker_cash_inflow_G__per_y - Permanent_worker_cash_inflow_G__per_y) / Time_to_adjust_worker_consumption_y,
Desired_shifts_worked___index__1_ ~ 1 + sINVeoSWI_0 * (Perceived_relative_inventory__1_ / Desired_relative_inventory__1_ - 1 ),
Observed_warming_deg_C ~ Warming_in_1980_deg_C + ( Extra_heat_in_surface_ZJ - Extra_heat_in_1980_ZJ )*Warming_from_extra_heat_deg_per_ZJ,
Extra_reduction_in_demand_for_non_el_fossil_fuel_from_NE_Mtoe_per_y ~ Fraction_new_electrification__1_ * Demand_for_fossil_fuel_for_non_el_use_before_NE_Mtoe_per_y,
D(Capacity_under_construction_PIS_Gcu) ~ Capacity_initiation_PIS_Gcu_per_y-Capacity_addition_PIS_Gcu_per_y,
Fraction_below_15_k__per_p_per_y__1_ ~ 1 - ( 1 / ( 1 + exp( - Logistic_k__1_ * ( GDP_per_person_k__per_p_per_y - 14)))),
CAPEX_renewable_el___per_W ~ CAPEX_renewable_el_in_1980___per_W * Cost_index_for_sun_and_wind_capacity__1_,
D(Labour_participation_rate__1_) ~ (Indicated_labour_participation_rate__1_ - Labour_participation_rate__1_) / Time_to_enter_per_leave_labor_market_y,
Nuclear_capacity_GW ~ interpolate(t, [(1980.0,75.0),(2000.0,310.0),(2020.0,310.0),(2098.9,310.0)]),
Crop_use_per_person_t_crop_per_p_per_y ~ Crop_use_Mt_per_y / Population_Mp,
CO2_concentration_in_atm_ppm ~ CO2_in_atmosphere_GtCO2 / GtCO2_per_ppm,
Traditional_use_of_red_meat_per_person_kg_red_meat_per_p_per_y ~ interpolate(GDP_per_person_k__per_p_per_y, [(0.0,0.0),(6.1,6.0),(8.8,8.5),(14.0,13.0),(30.0,27.0),(40.0,32.0),(50.0,33.0),(100.0,25.0)]),
Effect_of_capacity_renewal_1_per_y ~ ( Indicated_TFP__1_ - Embedded_TFP__1_ ) * Capacity_renewal_rate_1_per_y,
Sales_tax_G__per_y ~ Sales_tax_workers_G__per_y + Sales_tax_owners_G__per_y,
Off_balance_sheet_govmnt_inv_in_PUS__share_of_GDP_ ~ IfElse.ifelse(t > 2022, 0.01 + Unconventional_stimulus_in_PUS_from_2022__share_of_GDP_, 0.01),
Average_wellbeing_from_inequality__1_ ~ 1 + sIIeoAW_0 * ( Inequality__1_ / Threshold_inequality__1_ - 1 ),
Change_in_wage_rate___per_ph_per_y ~ Wage_rate___per_ph * ROC_in_WSO___Table_1_per_y,
Fraction_new_electrification__1_ ~ Fraction_new_electrification_in_1980__1_ + ramp(t,(Fraction_new_electrification_in_2022__1_ - Fraction_new_electrification_in_1980__1_ ) / 42, 1980, 2022) + ramp(t,( Goal_for_fraction_new_electrification__1_ - Fraction_new_electrification_in_2022__1_ ) / Introduction_period_for_policy_y , 2022, 2022 + Introduction_period_for_policy_y),
Productivity_of_public_purchases__1_ ~ max(0, 1 + sIPReoVPSS_0* log(Infrastructure_purchases_ratio_y/Infrastructure_purchases_ratio_in_1980_y)),
Demand_for_red_meat_Mt_red_meat_per_y ~ ( ( Population_Mp * Demand_for_red_meat_per_person_kg_red_meat_per_p_per_y ) / 1000 ) * ( 1 - Fraction_new_red_meat__1_ ),
AVERAGE_WELLBEING_INDEX__1_ ~ ( 0.5 * Average_wellbeing_from_disposable_income__1_ + 0.5 * Average_wellbeing_from_public_spending__1_) * Average_wellbeing_from_inequality__1_ * Average_wellbeing_from_global_warming__1_ * Average_wellbeing_from_progress__1_,
Income_tax_workers__1_ ~ Basic_income_tax_rate_workers__1_  * National_income_G__per_y * Worker_share_of_output__1_,
Max_govmnt_debt_G_ ~ National_income_G__per_y * Max_govmnt_debt_burden_y,
Owner_consumptin_fraction__1_ ~ 1 - Owner_savings_fraction__1_,
Population_growth_rate_1_per_y ~ Birth_rate_1_per_y - Death_rate_1_per_y,
Desired_supply_of_renewable_electricity_TWh_per_y ~ Demand_for_electricity_TWh_per_y * Desired_renewable_electricity_share__1_,
Discard_of_fossil_el_capacity_GW_per_y ~ Fossil_electricity_capacity_GW/ Life_of_fossil_el_capacity_y,
ROC_in_DDI_1_per_y ~ 0 + sINVeoDDI_0 * ( Perceived_relative_inventory__1_ / Sufficient_relative_inventory__1_ - 1 ),
D(Workforce_Mp) ~ Change_in_workforce_Mp_per_y,
OPEX_fossil_el_G__per_y ~ OPEX_fossil_el___per_kWh * Fossil_electricity_production_TWh_per_y,
D(Effective_GDP_per_person_k__per_p_per_y) ~ (GDP_per_person_k__per_p_per_y - Effective_GDP_per_person_k__per_p_per_y) /  Time_to_adapt_to_higher_income_y,
Food_footprint ~ Cropland_Mha * Fertilizer_use_Mt_per_y,
Long_term_erosion_of_wso_1_per_y ~ Worker_share_of_output__1_ * Real_wage_erosion_rate_1_per_y,
INV_in_1980_Gu ~ Optimal_output_in_1980_Gu_per_y * SWI_in_1980__1_ * Desired_inventory_coverage_y,
Public_spending_as_share_of_GDP ~ Public_spending_per_person_k__per_p_per_y / GDP_per_person_k__per_p_per_y,
INEQUALITY_INDEX__19801_ ~ Inequality__1_ / Inequality_in_1980__1_,
D(Inventory_Gu) ~ Output_Gu_per_y - Deliveries_Gu_per_y,
Life_of_extra_CO2_in_atm_y ~ Life_of_extra_CO2_in_atm_in_1980_y * OWeoLoCO2,
D(Capacity_under_construction_PUS_Gcu) ~ Capacity_initiation_PUS_Gcu_per_y-Capacity_addition_PUS_Gcu_per_y,
Indicated_wage_effect_on_optimal_CLR__1_ ~ 1 + sWSOeoCLR_0 * ( Worker_share_of_output__1_ / WSO_in_1980__1_ - 1 ),
Desired_crop_supply_conv_ag_Mt_crop_per_y ~ Desired_crop_supply_Mt_crop_per_y - Crop_supply_reg_ag_Mt_crop_per_y,
Consumption_demand_G__per_y ~ Worker_consumption_demand_G__per_y - Sales_tax_workers_G__per_y +  Owner_consumption_G__per_y - Sales_tax_owners_G__per_y,
Red_meat_from_grazing_land_Mt_red_meat_per_y ~ min(Demand_for_red_meat_Mt_red_meat_per_y, Potential_red_meat_from_grazing_land_Mt_red_meat_per_y),
ROC_in_soil_quality_in_conv_ag_1_per_y ~ 0 + sFUeoSQ_0 * ( Fertilizer_use_in_conv_ag_kgN_per_ha_per_y / Sustainable_fertiliser_use_kgN_per_ha_per_y - 1 ),
Inflation_rate_1_per_y ~ sINVeoIN_0 * ( Perceived_relative_inventory__1_ / Minimum_relative_inventory_without_inflation__1_ - 1 ),
Capacity_initiation_PIS_Gcu_per_y ~ max(( Investment_in_new_capacity_PIS_G__per_y + Off_balance_sheet_govmnt_inv_in_PIS__share_of_GDP_ * GDP_G__per_y )  / Cost_of_capacity___per_cu , 0),
Death_rate_1_per_y ~ Deaths_Mp_per_y / Population_Mp,
Melting_rate_deep_ice_1_per_y ~ Melting_rate_surface_1_per_y / Surface_vs_deep_rate__1_,
Govmnt_new_debt_G__per_y ~ max(0, ( Max_govmnt_debt_G_ - Govmnt_debt_G_ ) / Govmnt_drawdown_period_y) +  WorldDynamics.step(t, Govmnt_stimulus_from_2022__share_of_NI_, 2022) * National_income_G__per_y,
Crop_supply__after_20___waste__Mt_crop_per_y ~ Average_crop_yield_t_crop_per_ha_per_y * Cropland_Mha,
D(Grazing_land_Mha) ~ New_grazing_land_Mha_per_y,
Number_of_doublings_in_reg_ag__1_ ~ log(( Regenerative_agriculture_area_Mha + Experience_gained_before_2022_Mha ) / Experience_gained_before_2022_Mha) / 0.693,
Savings_share_of_GDP__1_ ~ Total_savings_G__per_y / National_income_G__per_y,
Wellbeing_effect_of_participation__1_ ~ 1 + sLPeoAWP_0 * ( Labour_participation_rate__1_ / Threshold_participation__1_ - 1 ),
Fertilizer_effect_on_erosion_rate__1_ ~ 1 + sFUeoLER_0 * ( Fertilizer_use_in_conv_ag_kgN_per_ha_per_y/ Sustainable_fertiliser_use_kgN_per_ha_per_y - 1 ),
Ice_and_snow_cover_Mha ~ Ice_and_snow_cover_excl_G_A_Mkm2 * 100,
Cost_of_food_and_energy_G__per_y ~ Cost_of_food_G__per_y + Cost_of_energy_G__per_y,
Land_erosion_multiplier__1_ ~ IfElse.ifelse(t > 2022,  1 - SSP2_land_management_action_from_2022___1_ *  ramp(t,(1 - 0 )/ 78, 2022, 2100), 1),
Corporate_borrowing_cost_in_1980_1_per_y ~ Normal_signal_rate_1_per_y + Normal_basic_bank_margin_1_per_y + Normal_bank_operating_margin_1_per_y + Normal_corporate_credit_risk_1_per_y,
Change_in_DDI_1_per_y ~ ROC_in_DDI_1_per_y* Delivery_delay___index__1_,
TFP_including_effect_of_5TAs__1_ ~ TFP_excluding_effect_of_5TAs__1_ * ( 1 - Reduction_in_TFP_from_unprofitable_activity__1_ ),
Average_gross_income_per_worker_k__per_p_per_y ~ Wage_rate___per_ph * Average_hours_worked_kh_per_y,
Normal_corporate_credit_risk_1_per_y ~ 0.02 * ( 1 + sGReoCR_0 * ( Output_growth_rate_1_per_y / 0.03 - 1 )),
D(Past_AWI__1_) ~ (AVERAGE_WELLBEING_INDEX__1_ - Past_AWI__1_) /  Average_wellbeing_perception_delay_y,
Owner_tax_rate__1_ ~ Owner_taxes_G__per_y / Owner_income_G__per_y,
Traditional_use_of_crops_Mt_per_y ~ Traditional_use_of_crops_per_person_kg_crop_per_p_per_y * Population_Mp / 1000,
CO2_from_CH4_GtCO2_per_y ~ CH4_breakdown_GtCH4_per_y * tCO2_per_tCH4,
Loss_of_cropland_Mha_per_y ~ Cropland_loss_Mha_per_y + Urban_expansion_Mha_per_y,
Extra_cost_of_reg_ag___per_ha_per_y ~ Extra_cost_of_reg_ag_in_2022___per_ha_per_y * Cost_index_for_Regenerative_agriculture__1_,
threem_interest_rate_1_per_y ~ Central_bank_signal_rate_1_per_y + Normal_basic_bank_margin_1_per_y,
Govmnt_debt_burden_y ~ Govmnt_debt_G_ / National_income_G__per_y,
Life_of_capacity_PIS_y ~ ( Life_of_capacity_PIS_in_1980_y * OWeoLOC__1_ ) / Excess_demand_effect_on_life_of_capacity__1_,
Change_in_soil_quality_in_conv_ag_t_crop_per_ha_per_y_per_y ~ ROC_in_soil_quality_in_conv_ag_1_per_y * Soil_quality_index_in_conv_ag__19801_,
Wage_rate_erosion_rate_1_per_y ~ Inflation_rate_1_per_y * ( 1 - Fraction_of_inflation_compensated__1_ ),
D(CH4_in_atmosphere_GtCH4) ~ CH4_emissions_GtCH4_per_y-CH4_breakdown_GtCH4_per_y,
Cost_of_new_electrification_G__per_y ~ ( Extra_cost_per_reduced_use_of_non_el_FF___per_toe / 1000 ) * Extra_reduction_in_demand_for_non_el_fossil_fuel_from_NE_Mtoe_per_y,
Fraction_fossil_plus_nuclear_electricity__1_ ~ ( Fossil_electricity_production_TWh_per_y + Nuclear_electricity_production_TWh_per_y ) / Electricity_production_TWh_per_y,
CBC_effect_on_flow_to_capacity_addion__1_ ~ 1 + sCBCeoFRA_0 * (Corporate_borrowing_cost_1_per_y / Corporate_borrowing_cost_in_1980_1_per_y - 1 ),
Capacity_discard_PUS_Gcu_per_y ~ Capacity_PUS_Gcu / Life_of_capacity_PUS_y,
Water_vapour_feedback_W_per_m2 ~ Water_vapor_feedback_in_1980_W_per_m2  * ( 1 + sWVeoWVF_0 * ( Water_vapor_concentration_g_per_kg / Water_vapour_concentration_1980_g_per_kg - 1 )),
Extra_general_tax_from_2022_G__per_y ~ IfElse.ifelse(t > 2022, Extra_general_tax_rate_from_2022__1_ + Extra_empowerment_tax_from_2022__share_of_NI_ + Extra_pension_tax_from_2022__share_of_NI_, 0) * National_income_G__per_y,
Available_capital_G__per_y ~ Total_savings_G__per_y + Foreign_capital_inflow_G__per_y,
Change_in_ECLR_k__per_y_per_y ~ ROC_in_CLR_1_per_y * Embedded_CLR_k__per_j,
CO2_emissions_per_person_tCO2_per_y ~ ( CO2_from_energy_and_industry_GtCO2_per_y / Population_Mp ) * 1000,
Life_expectancy_multipler__1_ ~ IfElse.ifelse(SSP2_family_action_from_2022___1_ > 0,  IfElse.ifelse(t > 2022, 1 + ramp(t,(Max_life_expectancy_multiplier__1_ - 1 )/78, 2022, 2100), 1),  1),
Cash_flow_from_workers_to_banks_G__per_y ~ Worker_interest_cost_G__per_y + Workers_payback_G__per_y - Workers_new_debt_G__per_y,
Man_made_N2O_emissions_GtN2O_per_y ~ Fertilizer_use_Mt_per_y * kg_N2O_emission_per_kg_fertiliser / 1000,
OWeoLoCO2 ~ IfElse.ifelse(t > 2022, 1 + sOWeoLoCO2_0 * ( Observed_warming_deg_C / Observed_warming_in_2022_deg_C - 1 ), 1),
Lambda ~ 1 - Kappa,
D(Accumulated_sun_and_wind_capacity_from_1980_GW) ~ Addition_of_sun_and_wind_capacity_GW_per_y,
Capacity_addition_PIS_Gcu_per_y ~ Capacity_under_construction_PIS_Gcu / Construction_time_PIS_y,
Imported_ROTA_1_per_y ~ IfElse.ifelse(t > 2022, max(0,  Max_imported_ROTA_from_2022_1_per_y *  ( 1 - 1 * ( GDP_per_person_k__per_p_per_y / GDPpp_of_technology_leader_k__per_p_per_y - 1 )) ),  0),
Workers_payback_G__per_y ~ Workers_debt_G_ / Workers_payback_period_y,
FFLReoOGRR ~ max(1, 1 + sFFLReoOGRR_0 * ( Fraction_forestry_land_remaining__1_ - Threshold_FFLR__1_ )),
GDPppeoROCCLR ~ max(0 , 1 + sGDPppeoROCCLR_0 * ( GDP_per_person_k__per_p_per_y / GDP_per_person_in_1980 - 1 )),
D(Aged_0_20_years_Mp) ~ Births_Mp_per_y-Passing_20_Mp_per_y,
D(Central_bank_signal_rate_1_per_y) ~ Change_in_signal_rate_1_per_yy,
Life_expectancy_y ~ ( ( LEmax - (LEmax - LE_in_1980) * exp(- LEgamma * (Effective_GDP_per_person_k__per_p_per_y - GDP_per_person_in_1980_k__per_p_per_y)) ) * ( 1 + LEalfa * ( Effective_GDP_per_person_k__per_p_per_y - GDP_per_person_in_1980_k__per_p_per_y )) ) * Warming_effect_on_life_expectancy__1_ * Life_expectancy_multipler__1_,
Govmnt_gross_income__as_share_of_NI_ ~ Govmnt_gross_income_G__per_y / National_income_G__per_y,
Forcing_from_CO2_W_per_m2 ~ CO2_concentration_in_atm_ppm * CO2_forcing_per_ppm_W_per_m2_per_ppm,
Risk_of_extreme_heat_event__1_ ~ interpolate(Observed_warming_deg_C, [(0.0,1.0),(1.2,4.8),(2.0,8.6),(2.9,14.0),(5.2,40.0)]),
Pensioners_per_worker_p_per_p ~ On_pension_Mp / Aged_20_pension_age_Mp,
Cost_of_fossil_electricity_G__per_y ~ CAPEX_fossil_el_G__per_y + OPEX_fossil_el_G__per_y,
RATE_OF_GROWTH_IN_GDP_PER_PERSON_1_per_y ~ (( GDP_per_person_k__per_p_per_y - Past_GDP_per_person_k__per_y ) / Past_GDP_per_person_k__per_y) / Time_to_establish_growth_rate_y,
Amount_of_fertilizer_saved_in_reg_ag_kgN_per_ha_per_y ~ 268 - Sustainable_fertiliser_use_kgN_per_ha_per_y,
Cost_of_energy_G__per_y ~ Cost_of_fossil_fuel_for_non_el_use_G__per_y + Cost_of_electricity_G__per_y + Cost_of_grid_G__per_y + Cost_of_new_electrification_G__per_y  + Cost_of_CCS_G__per_y + Cost_of_air_capture_G__per_y,
Goal_for_fraction_of_govmnt_budget_to_workers__1_ ~ Fraction_transferred_in_1980__1_ + IfElse.ifelse(t > 2022, Extra_transfer_of_govmnt_budget_to_workers__1_, 0),
Regenerative_agriculture_area_Mha ~ Cropland_Mha * Fraction_regenerative_agriculture__1_,
CH4_emissions_GtCH4_per_y ~ Man_made_CH4_emissions_GtCH4_per_y + Natural_CH4_emissions_GtCH4_per_y,
Population_Mp ~ Aged_0_20_years_Mp + Aged_20_40_years_Mp + Aged_40_60_Mp + Aged_60___Mp,
Biofuels_use_Mtoe_per_y ~ interpolate(t, [(1980.0,0.0),(1990.0,0.0),(2000.0,0.0),(2020.0,0.0),(2100.0,0.0)]),
Cost_of_grid_G__per_y ~ Electricity_production_TWh_per_y * Transmission_cost___per_kWh,
Extra_fertility_reduction__1_ ~ ramp(t,Goal_for_extra_fertility_reduction__1_ / Introduction_period_for_policy_y , 2022, 2022 + Introduction_period_for_policy_y),
Forest_absorption_multipler__1_ ~ IfElse.ifelse(t > 2022, 1 + SSP2_land_management_action_from_2022___1_* ramp(t,(Max_forest_absorption_multiplier__1_ - 1)/78, 2022, 2100), 1),
Optimal_capital_labour_ratio_kcu_per_ftj ~ Embedded_CLR_kcu_per_ftj * Wage_effect_on_optimal_CLR__1_,
Unemployed_Mp ~ max(0, Available_workforce_Mp - Workforce_Mp),
FCUTeoLOFC__1_ ~ 1 + sFCUTeoLOFC_0 * ( (Fossil_capacity_up_time_kh_per_y / eight_khours_per_year ) - 1 ),
Cost_of_renewable_electricity_G__per_y ~ CAPEX_renewable_el_G__per_y + OPEX_renewable_el_G__per_y,
Transfer_rate_for_heat_going_to_space_1_per_y ~ ( Transfer_rate_surface_space_in_1980_1_per_y * (( Observed_warming_deg_C + 297 ) /  297 ) ) * ( Albedo__1_ / Albedo_in_1980__1_ ),
Birth_rate_1_per_y ~ Births_Mp_per_y / Population_Mp,
Productivity_loss_from_unprofitable_activity__1_ ~ Extra_cost_of_TAs_as_share_of_GDP__1_ * Fraction_unprofitable_activity_in_TAs__1_,
CO2_emissions_from_LULUC_GtCO2_per_y ~ CO2_release_from_forest_cut_GtCO2_per_y - CO2_absorption_in_forestry_land_GtCO2_per_y - Extra_CO2_absorption_in_reg_ag_GtCO2_per_y,
IIASA_Renewable_energy_production_EJ_per_yr ~ Renewable_electricity_production_TWh_per_y / TWh_el_per_EJ___engineering_equivalent + Renewable_heat_production_Mtoe_per_y / Mtoe_per_EJ___calorific_equivalent,
D(Cropland_Mha) ~ Cropland_expansion_Mha_per_y-Cropland_loss_Mha_per_y-Urban_expansion_Mha_per_y,
Fraction_forestry_land_remaining__1_ ~ max(0, Forestry_land_Mha / Forestry_land_in_1980_Mha ),
Forcing_from_N2O_W_per_m2 ~ N2O_concentration_in_atm_ppm * N2O_forcing_per_ppm_W_per_m2_per_ppm,
D(Workers_debt_G_) ~ Workers_new_debt_G__per_y-Workers_payback_G__per_y,
D(Perceived_relative_inventory__1_) ~ ((Inventory_coverage_y / Desired_inventory_coverage_y) - Perceived_relative_inventory__1_) /  Inventory_coverage_perception_time_y,
D(Barren_land_Mha) ~ Cropland_loss_Mha_per_y,
Worker_borrowing_cost_1_per_y ~ Cost_of_capital_for_secured_debt_1_per_y,
ROC_in_CLR_1_per_y ~ ROC_in_CLR_in_1980_1_per_y,
Traditional_cost_of_energy_as_share_of_GDP__1_ ~ Traditional_cost_of_energy_G__per_y / GDP_G__per_y,
D(Embedded_CLR_k__per_j) ~ Change_in_ECLR_k__per_y_per_y,
Life_of_capacity_PUS_in_1980_y ~ 15 * OWeoLOC__1_,
D(Embedded_TFP__1_) ~ Effect_of_capacity_renewal_1_per_y,
Crop_balance__1_ ~ Crop_use_Mt_per_y / Desired_crop_supply_Mt_crop_per_y,
Nuclear_electricity_production_TWh_per_y ~ Nuclear_capacity_GW * Nuclear_capacity_up_time_kh_per_y,
Warming_effect_on_life_expectancy__1_ ~ IfElse.ifelse(t > 2022, max(0, 1 + sOWeoLE_0 *  ( Observed_warming_deg_C / Observed_warming_in_2022_deg_C - 1 )), 1 ),
Crop_waste_reduction__1_ ~ ramp(t,Goal_for_crop_waste_reduction__1_ / Introduction_period_for_policy_y , 2022, 2022 + Introduction_period_for_policy_y ),
Wage_rate_in_1980___per_ph ~ Labour_productivity_in_1980___per_ph * WSO_in_1980__1_,
Renewable_electricity_production_TWh_per_y ~ Renewable_electricity_capacity_GW *  Renewable_capacity_up_time_kh_per_y,
N2O_emissions_GtN2O_per_y ~ Natural_N2O_emissions_GtN2O_per_y + Man_made_N2O_emissions_GtN2O_per_y,
Change_in_Price_Index_1_per_y ~ Price_Index__19801_ * Inflation_rate_1_per_y,
Electricity_balance__1_ ~ Electricity_production_TWh_per_y / Demand_for_electricity_TWh_per_y,
Social_tension_effect_on_reform_delay__1_ ~ 1 + sSTEeoRD_0 * ( Social_tension__1_ / Social_tension_in_1980__1_ - 1 ),
Albedo__1_ ~ ( Ice_and_snow_cover_excl_G_A_Mkm2 * Albedo_ice_and_snow__1_ + ( Global_surface_Mkm2 - Ice_and_snow_cover_excl_G_A_Mkm2 ) * Albedo_global_average__1_ ) / Global_surface_Mkm2,
Inventory_coverage_y ~ Inventory_Gu / Recent_sales_Gu_per_y,
Sales_G__per_y ~ Deliveries_Gu_per_y * Price_per_unit___per_u,
D(Wage_rate___per_ph) ~ Change_in_wage_rate___per_ph_per_y-Wage_rate_erosion___per_ph_per_y,
Govmnt_gross_income_G__per_y ~ Worker_taxes_G__per_y + Owner_taxes_G__per_y + Sales_tax_workers_G__per_y + Sales_tax_owners_G__per_y + Income_from_commons_from_2022_G__per_y,
CO2_release_from_forest_cut_GtCO2_per_y ~ (( Old_growth_removal_Mha_per_y + Cropland_expansion_Mha_per_y ) *  CO2_release_per_ha_of_forest_cut_tCO2_per_ha) / 1000,
Capacity_renewal_rate_1_per_y ~ Capacity_addition_PIS_Gcu_per_y / Capacity_PIS_Gcu,
Extra_cost_of_TAs_as_share_of_GDP__1_ ~ Extra_cost_of_TAs_from_2022_G__per_y / GDP_G__per_y,
Owner_consumption_G__per_y ~ Permanent_owner_cash_inflow_G__per_y * Owner_consumptin_fraction__1_,
Fertilizer_use_Mt_per_y ~ Cropland_Mha * ( 1 - Fraction_regenerative_agriculture__1_ ) * Fertilizer_use_in_conv_ag_kgN_per_ha_per_y/ 1000,
Worker_cash_inflow_G__per_y ~ Worker_income_after_tax_G__per_y -  Cash_flow_from_workers_to_banks_G__per_y,
Worker_consumption_demand_G__per_y ~ Permanent_worker_cash_inflow_G__per_y * Worker_consumption_fraction__1_,
Reduction_in_ROTA_from_inequality_1_per_y ~ min(1, 1 + sIIEeoROTA_0 * ( INEQUALITY_INDEX__19801_ / 1 - 1) ),
Unemployment_perception_time_y ~ ten_yr_loop_delay_y / 3,
Traditional_cost_of_electricity_G__per_y ~ ( Demand_for_electricity_before_NE_TWh_per_y * Traditional_cost_of_electricity___per_kWh / 1000 )  * Adjustment_factor_to_make_costs_match_1980_2022__1_,
Time_to_change_tooling_y ~ ten_yr_loop_delay_y/3,
Domestic_rate_of_technological_advance_1_per_y ~ ( Domestic_ROTA_in_1980_1_per_y + (IfElse.ifelse(t > 2022, Extra_domestic_ROTA_from_2022_1_per_y, 0)) *  ( 1 +  sSCeoROTA_0 * ( State_capacity__fraction_of_GDP_ / State_capacity_in_1980__fraction_of_GDP_  - 1 ))),
D(Renewable_electricity_capacity_GW) ~ Addition_of_renewable_el_capacity_GW_per_y-Discard_of_renewable_el_capacity_GW_per_y,
CO2_from_non_fossil_industrial_processes_GtCO2_per_y ~ ( Non_fossil_CO2_per_person_tCO2_per_p_per_y / 1000 ) * Population_Mp * ( 1 - Fraction_of_CO2_sources_with_CCS__1_),
FRACA_mult_from_GDPpp___Line__1_ ~ max(FRACA_min, 1 + sGDPppeoFRACA_0 * ( GDP_per_person_k__per_p_per_y / GDP_per_person_in_1980 - 1 )),
Old_growth_removal_rate_multiplier__1_ ~ IfElse.ifelse(t > 2022,  1 - SSP2_land_management_action_from_2022___1_ * ramp(t,(1 - 0 )/78, 2022, 2100), 1),
Cost_of_fertilizer_G__per_y ~ Fertilizer_use_Mt_per_y * Cost_per_ton_fertilizer___per_t / 1000,
D(Price_Index__19801_) ~ Change_in_Price_Index_1_per_y,
D(Extra_heat_in_surface_ZJ) ~ Extra_warming_from_forcing_ZJ_per_y-Extra_cooling_from_ice_melt_ZJ_per_y-Heat_to_deep_ocean_ZJ_per_y-Heat_to_space_ZJ_per_y,
CUC_PIS_in_1980_Gcu ~ ( CAP_PIS_in_1980_Gcu / Life_of_capacity_PIS_in_1980_y ) * Construction_time_PIS_y * Extra_mult_on_CUC__to_avoid_initial_transient_in_Investment_share_of_GDP,
Traditional_fertilizer_use_in_conv_ag_kgN_per_ha_per_y ~ interpolate(Desired_crop_yield_in_conv_ag_t_crop_per_ha_per_y, [(1.0,0.0),(2.0,40.0),(2.5,50.0),(3.0,60.0),(3.5,70.0),(4.5,100.0),(6.5,200.0),(10.0,600.0)]),
Indicated_signal_rate_1_per_y ~ Normal_signal_rate_1_per_y * ( 1 + sINeoSR_0 * (Perceived_inflation_CB_1_per_y / Inflation_target_1_per_y - 1) + sUNeoSR_0 * (Perceived_unemployment_CB__1_ / Unemployment_target__1_ - 1) ),
Desired_renewable_el_capacity_GW ~ Desired_supply_of_renewable_electricity_TWh_per_y / Renewable_capacity_up_time_kh_per_y,
Govmnt_payback_G__per_y ~ Govmnt_debt_G_ / Govmnt_payback_period_y,
D(CO2_in_atmosphere_GtCO2) ~ CO2_emissions_GtCO2_per_y + CO2_from_CH4_GtCO2_per_y - CO2_absorption_GtCO2_per_y + CO2_from_CH4_GtCO2_per_y,
]

@named sys = ODESystem(eqs)
sys = structural_simplify(sys)

end
