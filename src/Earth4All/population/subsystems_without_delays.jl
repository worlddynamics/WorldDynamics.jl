using IfElse

@variables t
D = Differential(t)

function population(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @parameters Aged_0_20_in_1980_Mp = params[:Aged_0_20_in_1980_Mp]
    @parameters Aged_20_40_in_1980_Mp = params[:Aged_20_40_in_1980_Mp]
    @parameters Aged_40_60_in_1980_Mp = params[:Aged_40_60_in_1980_Mp]
    @parameters Aged_60_plus_in_1980_Mp = params[:Aged_60_plus_in_1980_Mp]
    @parameters Goal_for_extra_fertility_reduction = params[:Goal_for_extra_fertility_reduction]
    @parameters DNC_in_1980 = params[:DNC_in_1980]
    @parameters DNCalfa_less_than_0 = params[:DNCalfa_less_than_0]
    @parameters DNCgamma = params[:DNCgamma]
    @parameters DNCmin = params[:DNCmin]
    @parameters Dying_in_1980_Mp_per_y = params[:Dying_in_1980_Mp_per_y]
    @parameters Fraction_women = params[:Fraction_women]
    @parameters Fertile_period_y = params[:Fertile_period_y]
    @parameters Fraction_achieving_desired_family_size = params[:Fraction_achieving_desired_family_size]
    @parameters GDP_per_person_in_1980_kdollar_per_p_per_y = params[:GDP_per_person_in_1980_kdollar_per_p_per_y]
    @parameters Goal_for_extra_fertility_reduction = params[:Goal_for_extra_fertility_reduction]
    @parameters LE_in_1980 = params[:LE_in_1980]
    @parameters LEalfa = params[:LEalfa]
    @parameters LEgamma = params[:LEgamma]
    @parameters LEmax = params[:LEmax]
    @parameters Max_fertility_multiplier = params[:Max_fertility_multiplier]
    @parameters Max_life_expectancy_multiplier = params[:Max_life_expectancy_multiplier]
    @parameters Observed_warming_in_2022_deg_C = params[:Observed_warming_in_2022_deg_C]
    @parameters Passing_20_in_1980_Mp_per_y = params[:Passing_20_in_1980_Mp_per_y]
    @parameters Passing_40_in_1980_Mp_per_y = params[:Passing_40_in_1980_Mp_per_y]
    @parameters Passing_60_in_1980_Mp_per_y = params[:Passing_60_in_1980_Mp_per_y]
    @parameters sOWeoLE_less_than_0 = params[:sOWeoLE_less_than_0]
    @parameters SSP2_family_action_from_2022 = params[:SSP2_family_action_from_2022]
    @parameters Time_to_adapt_to_higher_income_y = params[:Time_to_adapt_to_higher_income_y]

    @variables Aged_0_20_years_Mp(t) = params[:Aged_0_20_in_1980_Mp]
    @variables Aged_20_40_years_Mp(t) = params[:Aged_20_40_in_1980_Mp]
    @variables Aged_40_60_years_Mp(t) = params[:Aged_40_60_in_1980_Mp]
    @variables Aged_60_plus_years_Mp(t) = params[:Aged_60_plus_in_1980_Mp]
    @variables Births_Mp_per_y(t)
    @variables Deaths_Mp_per_y(t)
    # 
    # @variables LV_Deaths_10(t) = params[:Dying_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_Deaths_9(t) = params[:Dying_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_Deaths_8(t) = params[:Dying_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_Deaths_7(t) = params[:Dying_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_Deaths_6(t) = params[:Dying_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_Deaths_5(t) = params[:Dying_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_Deaths_4(t) = params[:Dying_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_Deaths_3(t) = params[:Dying_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_Deaths_2(t) = params[:Dying_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_Deaths_1(t) = params[:Dying_in_1980_Mp_per_y] * (20 / 10)
    # @variables RT_Deaths_10(t)
    # @variables RT_Deaths_9(t)
    # @variables RT_Deaths_8(t)
    # @variables RT_Deaths_7(t)
    # @variables RT_Deaths_6(t)
    # @variables RT_Deaths_5(t)
    # @variables RT_Deaths_4(t)
    # @variables RT_Deaths_3(t)
    # @variables RT_Deaths_2(t)
    # @variables RT_Deaths_1(t)
    # # 
    @variables Desired_no_of_children(t)
    @variables Effective_GDP_per_person_kdollar_per_p_per_y(t) = params[:GDP_per_person_in_1980_kdollar_per_p_per_y]
    @variables Extra_fertility_reduction(t)
    @variables Fertility_multiplier(t)
    @variables GDP_per_person_kdollar_per_p_per_y(t)
    @variables LE_at_60_y(t)
    @variables Life_expectancy_y(t)
    @variables Life_expectancy_multipler(t)
    @variables Observed_fertility(t)
    @variables Passing_20_Mp_per_y(t)
    @variables Passing_40_Mp_per_y(t)
    @variables Passing_60_Mp_per_y(t)
    @variables Population_Mp(t)
    @variables Warming_effect_on_life_expectancy(t)
    # 
    # @variables LV_P20_10(t) = params[:Passing_20_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_P20_9(t) = params[:Passing_20_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_P20_8(t) = params[:Passing_20_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_P20_7(t) = params[:Passing_20_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_P20_6(t) = params[:Passing_20_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_P20_5(t) = params[:Passing_20_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_P20_4(t) = params[:Passing_20_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_P20_3(t) = params[:Passing_20_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_P20_2(t) = params[:Passing_20_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_P20_1(t) = params[:Passing_20_in_1980_Mp_per_y] * (20 / 10)
    # @variables RT_P20_9(t)
    # @variables RT_P20_8(t)
    # @variables RT_P20_7(t)
    # @variables RT_P20_6(t)
    # @variables RT_P20_5(t)
    # @variables RT_P20_4(t)
    # @variables RT_P20_3(t)
    # @variables RT_P20_2(t)
    # @variables RT_P20_1(t)
    # 
    # @variables LV_P40_10(t) = params[:Passing_40_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_P40_9(t) = params[:Passing_40_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_P40_8(t) = params[:Passing_40_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_P40_7(t) = params[:Passing_40_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_P40_6(t) = params[:Passing_40_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_P40_5(t) = params[:Passing_40_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_P40_4(t) = params[:Passing_40_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_P40_3(t) = params[:Passing_40_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_P40_2(t) = params[:Passing_40_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_P40_1(t) = params[:Passing_40_in_1980_Mp_per_y] * (20 / 10)
    # @variables RT_P40_9(t)
    # @variables RT_P40_8(t)
    # @variables RT_P40_7(t)
    # @variables RT_P40_6(t)
    # @variables RT_P40_5(t)
    # @variables RT_P40_4(t)
    # @variables RT_P40_3(t)
    # @variables RT_P40_2(t)
    # @variables RT_P40_1(t)
    # 
    # @variables LV_P60_10(t) = params[:Passing_60_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_P60_9(t) = params[:Passing_60_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_P60_8(t) = params[:Passing_60_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_P60_7(t) = params[:Passing_60_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_P60_6(t) = params[:Passing_60_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_P60_5(t) = params[:Passing_60_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_P60_4(t) = params[:Passing_60_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_P60_3(t) = params[:Passing_60_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_P60_2(t) = params[:Passing_60_in_1980_Mp_per_y] * (20 / 10)
    # @variables LV_P60_1(t) = params[:Passing_60_in_1980_Mp_per_y] * (20 / 10)
    # @variables RT_P60_9(t)
    # @variables RT_P60_8(t)
    # @variables RT_P60_7(t)
    # @variables RT_P60_6(t)
    # @variables RT_P60_5(t)
    # @variables RT_P60_4(t)
    # @variables RT_P60_3(t)
    # @variables RT_P60_2(t)
    # @variables RT_P60_1(t)
    # # 
    @variables Introduction_period_for_policy_y(t)
    @variables GDP_Gdollar_per_y(t)
    @variables Observed_warming_deg_C(t)

    eqs = [
        D(Aged_0_20_years_Mp) ~ Births_Mp_per_y - Passing_20_Mp_per_y,
        D(Aged_20_40_years_Mp) ~ Passing_20_Mp_per_y - Passing_40_Mp_per_y,
        D(Aged_40_60_years_Mp) ~ Passing_40_Mp_per_y - Passing_60_Mp_per_y,
        D(Aged_60_plus_years_Mp) ~ Passing_60_Mp_per_y - Deaths_Mp_per_y,
        Births_Mp_per_y ~ Aged_20_40_years_Mp * Fraction_women * (Observed_fertility / Fertile_period_y),
        Observed_fertility ~ Desired_no_of_children * Fraction_achieving_desired_family_size,
        Desired_no_of_children ~ ((DNCmin + (DNC_in_1980 - DNCmin) * exp(-DNCgamma * (Effective_GDP_per_person_kdollar_per_p_per_y - GDP_per_person_in_1980_kdollar_per_p_per_y))) * (1 + DNCalfa_less_than_0 * (Effective_GDP_per_person_kdollar_per_p_per_y - GDP_per_person_in_1980_kdollar_per_p_per_y))) * (1 - Extra_fertility_reduction) * Fertility_multiplier,
        Extra_fertility_reduction ~ ramp(t, Goal_for_extra_fertility_reduction / Introduction_period_for_policy_y, 2022, 2022 + Introduction_period_for_policy_y),
        GDP_per_person_kdollar_per_p_per_y ~ GDP_Gdollar_per_y / Population_Mp,
        D(Effective_GDP_per_person_kdollar_per_p_per_y) ~ (GDP_per_person_kdollar_per_p_per_y - Effective_GDP_per_person_kdollar_per_p_per_y) / Time_to_adapt_to_higher_income_y,
        Fertility_multiplier ~ IfElse.ifelse(SSP2_family_action_from_2022 > 0, IfElse.ifelse(t > 2022, 1 + ramp(t, (Max_fertility_multiplier - 1) / 78, 2022, 2100), 1), 1),
        Life_expectancy_multipler ~ IfElse.ifelse(SSP2_family_action_from_2022 > 0, IfElse.ifelse(t > 2022, 1 + ramp(t, (Max_life_expectancy_multiplier - 1) / 78, 2022, 2100), 1), 1),
        Warming_effect_on_life_expectancy ~ IfElse.ifelse(t > 2022, max(0, 1 + sOWeoLE_less_than_0 * (Observed_warming_deg_C / Observed_warming_in_2022_deg_C - 1)), 1),
        Life_expectancy_y ~ ((LEmax - (LEmax - LE_in_1980) * exp(-LEgamma * (Effective_GDP_per_person_kdollar_per_p_per_y - GDP_per_person_in_1980_kdollar_per_p_per_y))) * (1 + LEalfa * (Effective_GDP_per_person_kdollar_per_p_per_y - GDP_per_person_in_1980_kdollar_per_p_per_y))) * Warming_effect_on_life_expectancy * Life_expectancy_multipler,
        LE_at_60_y ~ 20, #Life_expectancy_y - 60,
        # 
        # D(LV_P20_1) ~ (Births_Mp_per_y - LV_P20_1),
        # RT_P20_1 ~ LV_P20_1 / (20 / 10),
        # D(LV_P20_2) ~ (RT_P20_1 - LV_P20_2),
        # RT_P20_2 ~ LV_P20_2 / (20 / 10),
        # D(LV_P20_3) ~ (RT_P20_2 - LV_P20_3),
        # RT_P20_3 ~ LV_P20_3 / (20 / 10),
        # D(LV_P20_4) ~ (RT_P20_3 - LV_P20_4),
        # RT_P20_4 ~ LV_P20_4 / (20 / 10),
        # D(LV_P20_5) ~ (RT_P20_4 - LV_P20_5),
        # RT_P20_5 ~ LV_P20_5 / (20 / 10),
        # D(LV_P20_6) ~ (RT_P20_5 - LV_P20_6),
        # RT_P20_6 ~ LV_P20_6 / (20 / 10),
        # D(LV_P20_7) ~ (RT_P20_6 - LV_P20_7),
        # RT_P20_7 ~ LV_P20_7 / (20 / 10),
        # D(LV_P20_8) ~ (RT_P20_7 - LV_P20_8),
        # RT_P20_8 ~ LV_P20_8 / (20 / 10),
        # D(LV_P20_9) ~ (RT_P20_8 - LV_P20_9),
        # RT_P20_9 ~ LV_P20_9 / (20 / 10),
        # D(LV_P20_10) ~ (RT_P20_9 - LV_P20_10),
        # Passing_20_Mp_per_y ~ LV_P20_10 / (20 / 10),
        # 
        # D(LV_P40_1) ~ (Passing_20_Mp_per_y - LV_P40_1),
        # RT_P40_1 ~ LV_P40_1 / (20 / 10),
        # D(LV_P40_2) ~ (RT_P40_1 - LV_P40_2),
        # RT_P40_2 ~ LV_P40_2 / (20 / 10),
        # D(LV_P40_3) ~ (RT_P40_2 - LV_P40_3),
        # RT_P40_3 ~ LV_P40_3 / (20 / 10),
        # D(LV_P40_4) ~ (RT_P40_3 - LV_P40_4),
        # RT_P40_4 ~ LV_P40_4 / (20 / 10),
        # D(LV_P40_5) ~ (RT_P40_4 - LV_P40_5),
        # RT_P40_5 ~ LV_P40_5 / (20 / 10),
        # D(LV_P40_6) ~ (RT_P40_5 - LV_P40_6),
        # RT_P40_6 ~ LV_P40_6 / (20 / 10),
        # D(LV_P40_7) ~ (RT_P40_6 - LV_P40_7),
        # RT_P40_7 ~ LV_P40_7 / (20 / 10),
        # D(LV_P40_8) ~ (RT_P40_7 - LV_P40_8),
        # RT_P40_8 ~ LV_P40_8 / (20 / 10),
        # D(LV_P40_9) ~ (RT_P40_8 - LV_P40_9),
        # RT_P40_9 ~ LV_P40_9 / (20 / 10),
        # D(LV_P40_10) ~ (RT_P40_9 - LV_P40_10),
        # Passing_40_Mp_per_y ~ LV_P40_10 / (20 / 10),
        #    
        # D(LV_P60_1) ~ (Passing_40_Mp_per_y - LV_P60_1),
        # RT_P60_1 ~ LV_P60_1 / (20 / 10),
        # D(LV_P60_2) ~ (RT_P60_1 - LV_P60_2),
        # RT_P60_2 ~ LV_P60_2 / (20 / 10),
        # D(LV_P60_3) ~ (RT_P60_2 - LV_P60_3),
        # RT_P60_3 ~ LV_P60_3 / (20 / 10),
        # D(LV_P60_4) ~ (RT_P60_3 - LV_P60_4),
        # RT_P60_4 ~ LV_P60_4 / (20 / 10),
        # D(LV_P60_5) ~ (RT_P60_4 - LV_P60_5),
        # RT_P60_5 ~ LV_P60_5 / (20 / 10),
        # D(LV_P60_6) ~ (RT_P60_5 - LV_P60_6),
        # RT_P60_6 ~ LV_P60_6 / (20 / 10),
        # D(LV_P60_7) ~ (RT_P60_6 - LV_P60_7),
        # RT_P60_7 ~ LV_P60_7 / (20 / 10),
        # D(LV_P60_8) ~ (RT_P60_7 - LV_P60_8),
        # RT_P60_8 ~ LV_P60_8 / (20 / 10),
        # D(LV_P60_9) ~ (RT_P60_8 - LV_P60_9),
        # RT_P60_9 ~ LV_P60_9 / (20 / 10),
        # D(LV_P60_10) ~ (RT_P60_9 - LV_P60_10),
        # Passing_60_Mp_per_y ~ LV_P60_10 / (20 / 10),
        #    
        # D(LV_Deaths_1) ~ (Passing_60_Mp_per_y - LV_Deaths_1),
        # RT_Deaths_1 ~ LV_Deaths_1 / (LE_at_60_y / 10),
        # D(LV_Deaths_2) ~ (RT_Deaths_1 - LV_Deaths_2),
        # RT_Deaths_2 ~ LV_Deaths_2 / (LE_at_60_y / 10),
        # D(LV_Deaths_3) ~ (RT_Deaths_2 - LV_Deaths_3),
        # RT_Deaths_3 ~ LV_Deaths_3 / (LE_at_60_y / 10),
        # D(LV_Deaths_4) ~ (RT_Deaths_3 - LV_Deaths_4),
        # RT_Deaths_4 ~ LV_Deaths_4 / (LE_at_60_y / 10),
        # D(LV_Deaths_5) ~ (RT_Deaths_4 - LV_Deaths_5),
        # RT_Deaths_5 ~ LV_Deaths_5 / (LE_at_60_y / 10),
        # D(LV_Deaths_6) ~ (RT_Deaths_5 - LV_Deaths_6),
        # RT_Deaths_6 ~ LV_Deaths_6 / (LE_at_60_y / 10),
        # D(LV_Deaths_7) ~ (RT_Deaths_6 - LV_Deaths_7),
        # RT_Deaths_7 ~ LV_Deaths_7 / (LE_at_60_y / 10),
        # D(LV_Deaths_8) ~ (RT_Deaths_7 - LV_Deaths_8),
        # RT_Deaths_8 ~ LV_Deaths_8 / (LE_at_60_y / 10),
        # D(LV_Deaths_9) ~ (RT_Deaths_8 - LV_Deaths_9),
        # RT_Deaths_9 ~ LV_Deaths_9 / (LE_at_60_y / 10),
        # D(LV_Deaths_10) ~ (RT_Deaths_9 - LV_Deaths_10),
        # Deaths_Mp_per_y ~ LV_Deaths_10 / (LE_at_60_y / 10),
        #    
        Population_Mp ~ Aged_0_20_years_Mp + Aged_20_40_years_Mp + Aged_40_60_years_Mp + Aged_60_plus_years_Mp,
        # 
        Passing_20_Mp_per_y ~ interpolate(t, tables[:Passing_20_Mp_per_y], ranges[:Passing_20_Mp_per_y]),
        Passing_40_Mp_per_y ~ interpolate(t, tables[:Passing_40_Mp_per_y], ranges[:Passing_40_Mp_per_y]),
        Passing_60_Mp_per_y ~ interpolate(t, tables[:Passing_60_Mp_per_y], ranges[:Passing_60_Mp_per_y]),
        Deaths_Mp_per_y ~ interpolate(t, tables[:Deaths_Mp_per_y], ranges[:Deaths_Mp_per_y]),
        # 
        Introduction_period_for_policy_y ~ interpolate(t, tables[:Introduction_period_for_policy_y], ranges[:Introduction_period_for_policy_y]),
        GDP_Gdollar_per_y ~ interpolate(t, tables[:GDP_Gdollar_per_y], ranges[:GDP_Gdollar_per_y]),
        Observed_warming_deg_C ~ interpolate(t, tables[:Observed_warming_deg_C], ranges[:Observed_warming_deg_C]),
    ]

    ODESystem(eqs; name)
end
