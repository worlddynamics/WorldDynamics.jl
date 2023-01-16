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
    @variables Deaths_Mp_per_y(t) = ((params[:LE_in_1980] - 60) / 10) * params[:Dying_in_1980_Mp_per_y]
    @variables Deaths_Mp_per_y1(t) = ((params[:LE_in_1980] - 60) / 10) * params[:Dying_in_1980_Mp_per_y]
    @variables Deaths_Mp_per_y1(t) = ((params[:LE_in_1980] - 60) / 10) * params[:Dying_in_1980_Mp_per_y]
    @variables Deaths_Mp_per_y2(t) = ((params[:LE_in_1980] - 60) / 10) * params[:Dying_in_1980_Mp_per_y]
    @variables Deaths_Mp_per_y3(t) = ((params[:LE_in_1980] - 60) / 10) * params[:Dying_in_1980_Mp_per_y]
    @variables Deaths_Mp_per_y4(t) = ((params[:LE_in_1980] - 60) / 10) * params[:Dying_in_1980_Mp_per_y]
    @variables Deaths_Mp_per_y5(t) = ((params[:LE_in_1980] - 60) / 10) * params[:Dying_in_1980_Mp_per_y]
    @variables Deaths_Mp_per_y6(t) = ((params[:LE_in_1980] - 60) / 10) * params[:Dying_in_1980_Mp_per_y]
    @variables Deaths_Mp_per_y7(t) = ((params[:LE_in_1980] - 60) / 10) * params[:Dying_in_1980_Mp_per_y]
    @variables Deaths_Mp_per_y8(t) = ((params[:LE_in_1980] - 60) / 10) * params[:Dying_in_1980_Mp_per_y]
    @variables Deaths_Mp_per_y9(t) = ((params[:LE_in_1980] - 60) / 10) * params[:Dying_in_1980_Mp_per_y]
    @variables Deaths_Mp_per_y10(t) = ((params[:LE_in_1980] - 60) / 10) * params[:Dying_in_1980_Mp_per_y]
    @variables Desired_no_of_children(t)
    @variables Effective_GDP_per_person_kdollar_per_p_per_y(t) = params[:GDP_per_person_in_1980_kdollar_per_p_per_y]
    @variables Extra_fertility_reduction(t)
    @variables Fertility_multiplier(t)
    @variables GDP_per_person_kdollar_per_p_per_y(t)
    @variables LE_at_60_y(t)
    @variables Life_expectancy_y(t)
    @variables Life_expectancy_multipler(t)
    @variables Observed_fertility(t)
    @variables Passing_20_Mp_per_y(t) = params[:Passing_20_in_1980_Mp_per_y]
    @variables Passing_20_Mp_per_y1(t) = params[:Passing_20_in_1980_Mp_per_y]
    @variables Passing_20_Mp_per_y2(t) = params[:Passing_20_in_1980_Mp_per_y]
    @variables Passing_20_Mp_per_y3(t) = params[:Passing_20_in_1980_Mp_per_y]
    @variables Passing_20_Mp_per_y4(t) = params[:Passing_20_in_1980_Mp_per_y]
    @variables Passing_20_Mp_per_y5(t) = params[:Passing_20_in_1980_Mp_per_y]
    @variables Passing_20_Mp_per_y6(t) = params[:Passing_20_in_1980_Mp_per_y]
    @variables Passing_20_Mp_per_y7(t) = params[:Passing_20_in_1980_Mp_per_y]
    @variables Passing_20_Mp_per_y8(t) = params[:Passing_20_in_1980_Mp_per_y]
    @variables Passing_20_Mp_per_y9(t) = params[:Passing_20_in_1980_Mp_per_y]
    @variables Passing_40_Mp_per_y(t) = params[:Passing_40_in_1980_Mp_per_y]
    @variables Passing_40_Mp_per_y1(t) = params[:Passing_40_in_1980_Mp_per_y]
    @variables Passing_40_Mp_per_y2(t) = params[:Passing_40_in_1980_Mp_per_y]
    @variables Passing_40_Mp_per_y3(t) = params[:Passing_40_in_1980_Mp_per_y]
    @variables Passing_40_Mp_per_y4(t) = params[:Passing_40_in_1980_Mp_per_y]
    @variables Passing_40_Mp_per_y5(t) = params[:Passing_40_in_1980_Mp_per_y]
    @variables Passing_40_Mp_per_y6(t) = params[:Passing_40_in_1980_Mp_per_y]
    @variables Passing_40_Mp_per_y7(t) = params[:Passing_40_in_1980_Mp_per_y]
    @variables Passing_40_Mp_per_y8(t) = params[:Passing_40_in_1980_Mp_per_y]
    @variables Passing_40_Mp_per_y9(t) = params[:Passing_40_in_1980_Mp_per_y]
    @variables Passing_60_Mp_per_y(t) = params[:Passing_60_in_1980_Mp_per_y]
    @variables Passing_60_Mp_per_y1(t) = params[:Passing_60_in_1980_Mp_per_y]
    @variables Passing_60_Mp_per_y2(t) = params[:Passing_60_in_1980_Mp_per_y]
    @variables Passing_60_Mp_per_y3(t) = params[:Passing_60_in_1980_Mp_per_y]
    @variables Passing_60_Mp_per_y4(t) = params[:Passing_60_in_1980_Mp_per_y]
    @variables Passing_60_Mp_per_y5(t) = params[:Passing_60_in_1980_Mp_per_y]
    @variables Passing_60_Mp_per_y6(t) = params[:Passing_60_in_1980_Mp_per_y]
    @variables Passing_60_Mp_per_y7(t) = params[:Passing_60_in_1980_Mp_per_y]
    @variables Passing_60_Mp_per_y8(t) = params[:Passing_60_in_1980_Mp_per_y]
    @variables Passing_60_Mp_per_y9(t) = params[:Passing_60_in_1980_Mp_per_y]
    @variables Population_Mp(t)
    @variables Warming_effect_on_life_expectancy(t)

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
        LE_at_60_y ~ Life_expectancy_y - 60,
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
        Deaths_Mp_per_y ~ (10 / LE_at_60_y) * Deaths_Mp_per_y10,
        D(Deaths_Mp_per_y10) ~ (10 / LE_at_60_y) * Deaths_Mp_per_y9 - Deaths_Mp_per_y,
        D(Deaths_Mp_per_y9) ~ (10 / LE_at_60_y) * (Deaths_Mp_per_y8 - Deaths_Mp_per_y9),
        D(Deaths_Mp_per_y8) ~ (10 / LE_at_60_y) * (Deaths_Mp_per_y7 - Deaths_Mp_per_y8),
        D(Deaths_Mp_per_y7) ~ (10 / LE_at_60_y) * (Deaths_Mp_per_y6 - Deaths_Mp_per_y7),
        D(Deaths_Mp_per_y6) ~ (10 / LE_at_60_y) * (Deaths_Mp_per_y5 - Deaths_Mp_per_y6),
        D(Deaths_Mp_per_y5) ~ (10 / LE_at_60_y) * (Deaths_Mp_per_y4 - Deaths_Mp_per_y5),
        D(Deaths_Mp_per_y4) ~ (10 / LE_at_60_y) * (Deaths_Mp_per_y3 - Deaths_Mp_per_y4),
        D(Deaths_Mp_per_y3) ~ (10 / LE_at_60_y) * (Deaths_Mp_per_y2 - Deaths_Mp_per_y3),
        D(Deaths_Mp_per_y2) ~ (10 / LE_at_60_y) * (Deaths_Mp_per_y1 - Deaths_Mp_per_y2),
        D(Deaths_Mp_per_y1) ~ Passing_60_Mp_per_y - (10 / LE_at_60_y) * Deaths_Mp_per_y1,
        #   
        Population_Mp ~ Aged_0_20_years_Mp + Aged_20_40_years_Mp + Aged_40_60_years_Mp + Aged_60_plus_years_Mp,
        Introduction_period_for_policy_y ~ interpolate(t, tables[:Introduction_period_for_policy_y], ranges[:Introduction_period_for_policy_y]),
        GDP_Gdollar_per_y ~ interpolate(t, tables[:GDP_Gdollar_per_y], ranges[:GDP_Gdollar_per_y]),
        Observed_warming_deg_C ~ interpolate(t, tables[:Observed_warming_deg_C], ranges[:Observed_warming_deg_C]),
    ]

    ODESystem(eqs; name)
end
