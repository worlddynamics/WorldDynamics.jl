@variables t
D = Differential(t)

function delay_n(eqs::Vector{Equation}, inits, x, rt, lv, delay, order, v0)
    append!(eqs, [rt[1] ~ lv[1] / (delay / order)])
    append!(eqs, [D(lv[1]) ~ x - rt[1]])
    # inits[lv[order]] = v0
    for d in 2:order
        append!(eqs, [rt[d] ~ lv[d] / (delay / order)])
        append!(eqs, [D(lv[d]) ~ rt[d-1] - rt[d]])
        # inits[lv[order-d+1]] = v0
    end
end

function population(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @parameters A00_20_1980 = params[:A00_20_1980]
    @parameters A20_40_1980 = params[:A20_40_1980]
    @parameters A40_60_1980 = params[:A40_60_1980]
    @parameters A60_PL_1980 = params[:A60_PL_1980]

    # Endogenous variables
    @variables A00_20(t) = params[:A00_20_1980]
    @variables A20_40(t) = params[:A20_40_1980]
    @variables A40_60(t) = params[:A40_60_1980]
    @variables A60_PL(t) = params[:A60_PL_1980]
    @variables (RT_PASS20(t))[1:10] (LV_PASS20(t))[1:10] = fill(inits[:LV_PASS20], 10)
    # @variables (RT_PASS20(t))[1:10]
    @variables (RT_PASS40(t))[1:10] (LV_PASS40(t))[1:10] = fill(inits[:LV_PASS40], 10)
    # @variables (RT_PASS40(t))[1:10]
    @variables (RT_PASS60(t))[1:10] (LV_PASS60(t))[1:10] = fill(inits[:LV_PASS60], 10)
    # @variables (RT_PASS60(t))[1:10]
    @variables POP(t)

    # Exogenous variables
    @variables BIRTHS(t)
    @variables DEATHS(t)

    eqs = [
        POP ~ A00_20 + A20_40 + A40_60 + A60_PL
        D(A00_20) ~ BIRTHS - RT_PASS20[10]
        D(A20_40) ~ RT_PASS20[10] - RT_PASS40[10]
        D(A40_60) ~ RT_PASS40[10] - RT_PASS60[10]
        D(A60_PL) ~ RT_PASS60[10] - DEATHS
        BIRTHS ~ interpolate(t, tables[:BIRTHS], ranges[:BIRTHS])
        DEATHS ~ interpolate(t, tables[:DEATHS], ranges[:DEATHS])
    ]

    delay_n(eqs, inits, BIRTHS, LV_PASS20, RT_PASS20, 20, 10, 2 * 94.6)
    delay_n(eqs, inits, RT_PASS20[10], LV_PASS40, RT_PASS40, 20, 10, 2 * params[:PASS20_1980])
    delay_n(eqs, inits, RT_PASS40[10], LV_PASS60, RT_PASS60, 20, 10, 2 * params[:PASS40_1980])

    ODESystem(eqs; name)
end

# function birth(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
#     @parameters Goal_for_extra_fertility_reduction = params[:Goal_for_extra_fertility_reduction]
#     @parameters DNC_in_1980 = params[:DNC_in_1980]
#     @parameters DNCalfa_less_than_0 = params[:DNCalfa_less_than_0]
#     @parameters DNCgamma = params[:DNCgamma]
#     @parameters DNCmin = params[:DNCmin]
#     @parameters Dying_in_1980_Mp_per_y = params[:Dying_in_1980_Mp_per_y]
#     @parameters FW = params[:FW]
#     @parameters Fertile_period_y = params[:Fertile_period_y]
#     @parameters Fraction_achieving_desired_family_size = params[:Fraction_achieving_desired_family_size]
#     @parameters GDP_per_person_in_1980_kdollar_per_p_per_y = params[:GDP_per_person_in_1980_kdollar_per_p_per_y]
#     @parameters Goal_for_extra_fertility_reduction = params[:Goal_for_extra_fertility_reduction]
#     @parameters LE_in_1980 = params[:LE_in_1980]
#     @parameters LEalfa = params[:LEalfa]
#     @parameters LEgamma = params[:LEgamma]
#     @parameters LEmax = params[:LEmax]
#     @parameters Max_fertility_multiplier = params[:Max_fertility_multiplier]
#     @parameters Max_life_expectancy_multiplier = params[:Max_life_expectancy_multiplier]
#     @parameters Observed_warming_in_2022_deg_C = params[:Observed_warming_in_2022_deg_C]
#     @parameters Passing_20_in_1980_Mp_per_y = params[:Passing_20_in_1980_Mp_per_y]
#     @parameters Passing_40_in_1980_Mp_per_y = params[:Passing_40_in_1980_Mp_per_y]
#     @parameters Passing_60_in_1980_Mp_per_y = params[:Passing_60_in_1980_Mp_per_y]
#     @parameters sOWeoLE_less_than_0 = params[:sOWeoLE_less_than_0]
#     @parameters SSP2_family_action_from_2022 = params[:SSP2_family_action_from_2022]
#     @parameters Time_to_adapt_to_higher_income_y = params[:Time_to_adapt_to_higher_income_y]

#     @variables A00_20(t) = params[:Aged_0_20_in_1980_Mp]
#     @variables A20_40(t) = params[:Aged_20_40_in_1980_Mp]
#     @variables A40_60(t) = params[:Aged_40_60_in_1980_Mp]
#     @variables A60_PL(t) = params[:Aged_60_plus_in_1980_Mp]
#     @variables B(t)
#     @variables D(t) = ((params[:LE_in_1980] - 60) / 10) * params[:Dying_in_1980_Mp_per_y]
#     @variables D1(t) = ((params[:LE_in_1980] - 60) / 10) * params[:Dying_in_1980_Mp_per_y]
#     @variables D1(t) = ((params[:LE_in_1980] - 60) / 10) * params[:Dying_in_1980_Mp_per_y]
#     @variables D2(t) = ((params[:LE_in_1980] - 60) / 10) * params[:Dying_in_1980_Mp_per_y]
#     @variables D3(t) = ((params[:LE_in_1980] - 60) / 10) * params[:Dying_in_1980_Mp_per_y]
#     @variables D4(t) = ((params[:LE_in_1980] - 60) / 10) * params[:Dying_in_1980_Mp_per_y]
#     @variables D5(t) = ((params[:LE_in_1980] - 60) / 10) * params[:Dying_in_1980_Mp_per_y]
#     @variables D6(t) = ((params[:LE_in_1980] - 60) / 10) * params[:Dying_in_1980_Mp_per_y]
#     @variables D7(t) = ((params[:LE_in_1980] - 60) / 10) * params[:Dying_in_1980_Mp_per_y]
#     @variables D8(t) = ((params[:LE_in_1980] - 60) / 10) * params[:Dying_in_1980_Mp_per_y]
#     @variables D9(t) = ((params[:LE_in_1980] - 60) / 10) * params[:Dying_in_1980_Mp_per_y]
#     @variables D10(t) = ((params[:LE_in_1980] - 60) / 10) * params[:Dying_in_1980_Mp_per_y]
#     @variables Desired_no_of_children(t)
#     @variables Effective_GDP_per_person_kdollar_per_p_per_y(t) = params[:GDP_per_person_in_1980_kdollar_per_p_per_y]
#     @variables Extra_fertility_reduction(t)
#     @variables Fertility_multiplier(t)
#     @variables GDP_per_person_kdollar_per_p_per_y(t)
#     @variables LE_at_60_y(t)
#     @variables Life_expectancy_y(t)
#     @variables Life_expectancy_multipler(t)
#     @variables Observed_fertility(t)
#     @variables PASS20(t) = params[:Passing_20_in_1980_Mp_per_y]
#     @variables PASS201(t) = params[:Passing_20_in_1980_Mp_per_y]
#     @variables PASS202(t) = params[:Passing_20_in_1980_Mp_per_y]
#     @variables PASS203(t) = params[:Passing_20_in_1980_Mp_per_y]
#     @variables PASS204(t) = params[:Passing_20_in_1980_Mp_per_y]
#     @variables PASS205(t) = params[:Passing_20_in_1980_Mp_per_y]
#     @variables PASS206(t) = params[:Passing_20_in_1980_Mp_per_y]
#     @variables PASS207(t) = params[:Passing_20_in_1980_Mp_per_y]
#     @variables PASS208(t) = params[:Passing_20_in_1980_Mp_per_y]
#     @variables PASS209(t) = params[:Passing_20_in_1980_Mp_per_y]
#     @variables PASS40(t) = params[:Passing_40_in_1980_Mp_per_y]
#     @variables PASS401(t) = params[:Passing_40_in_1980_Mp_per_y]
#     @variables PASS402(t) = params[:Passing_40_in_1980_Mp_per_y]
#     @variables PASS403(t) = params[:Passing_40_in_1980_Mp_per_y]
#     @variables PASS404(t) = params[:Passing_40_in_1980_Mp_per_y]
#     @variables PASS405(t) = params[:Passing_40_in_1980_Mp_per_y]
#     @variables PASS406(t) = params[:Passing_40_in_1980_Mp_per_y]
#     @variables PASS407(t) = params[:Passing_40_in_1980_Mp_per_y]
#     @variables PASS408(t) = params[:Passing_40_in_1980_Mp_per_y]
#     @variables PASS409(t) = params[:Passing_40_in_1980_Mp_per_y]
#     @variables PASS60(t) = params[:Passing_60_in_1980_Mp_per_y]
#     @variables PASS601(t) = params[:Passing_60_in_1980_Mp_per_y]
#     @variables PASS602(t) = params[:Passing_60_in_1980_Mp_per_y]
#     @variables PASS603(t) = params[:Passing_60_in_1980_Mp_per_y]
#     @variables PASS604(t) = params[:Passing_60_in_1980_Mp_per_y]
#     @variables PASS605(t) = params[:Passing_60_in_1980_Mp_per_y]
#     @variables PASS606(t) = params[:Passing_60_in_1980_Mp_per_y]
#     @variables PASS607(t) = params[:Passing_60_in_1980_Mp_per_y]
#     @variables PASS608(t) = params[:Passing_60_in_1980_Mp_per_y]
#     @variables PASS609(t) = params[:Passing_60_in_1980_Mp_per_y]
#     @variables POP(t)
#     @variables Warming_effect_on_life_expectancy(t)

#     @variables Introduction_period_for_policy_y(t)
#     @variables GDP_Gdollar_per_y(t)
#     @variables Observed_warming_deg_C(t)

#     eqs = [
#         POP ~ A00_20 + A20_40 + A40_60 + A60_PL,
#         D(A00_20) ~ B - PASS20,
#         D(A20_40) ~ PASS20 - PASS40,
#         D(A40_60) ~ PASS40 - PASS60,
#         D(A60_PL) ~ PASS60 - D,
#         B ~ A20_40 * FW * (Observed_fertility / Fertile_period_y),
#         Observed_fertility ~ Desired_no_of_children * Fraction_achieving_desired_family_size,
#         Desired_no_of_children ~ ((DNCmin + (DNC_in_1980 - DNCmin) * exp(-DNCgamma * (Effective_GDP_per_person_kdollar_per_p_per_y - GDP_per_person_in_1980_kdollar_per_p_per_y))) * (1 + DNCalfa_less_than_0 * (Effective_GDP_per_person_kdollar_per_p_per_y - GDP_per_person_in_1980_kdollar_per_p_per_y))) * (1 - Extra_fertility_reduction) * Fertility_multiplier,
#         Extra_fertility_reduction ~ ramp(t, Goal_for_extra_fertility_reduction / Introduction_period_for_policy_y, 2022, 2022 + Introduction_period_for_policy_y),
#         GDP_per_person_kdollar_per_p_per_y ~ GDP_Gdollar_per_y / POP,
#         D(Effective_GDP_per_person_kdollar_per_p_per_y) ~ (GDP_per_person_kdollar_per_p_per_y - Effective_GDP_per_person_kdollar_per_p_per_y) / Time_to_adapt_to_higher_income_y,
#         Fertility_multiplier ~ IfElse.ifelse(SSP2_family_action_from_2022 > 0, IfElse.ifelse(t > 2022, 1 + ramp(t, (Max_fertility_multiplier - 1) / 78, 2022, 2100), 1), 1),
#         Life_expectancy_multipler ~ IfElse.ifelse(SSP2_family_action_from_2022 > 0, IfElse.ifelse(t > 2022, 1 + ramp(t, (Max_life_expectancy_multiplier - 1) / 78, 2022, 2100), 1), 1),
#         Warming_effect_on_life_expectancy ~ IfElse.ifelse(t > 2022, max(0, 1 + sOWeoLE_less_than_0 * (Observed_warming_deg_C / Observed_warming_in_2022_deg_C - 1)), 1),
#         Life_expectancy_y ~ ((LEmax - (LEmax - LE_in_1980) * exp(-LEgamma * (Effective_GDP_per_person_kdollar_per_p_per_y - GDP_per_person_in_1980_kdollar_per_p_per_y))) * (1 + LEalfa * (Effective_GDP_per_person_kdollar_per_p_per_y - GDP_per_person_in_1980_kdollar_per_p_per_y))) * Warming_effect_on_life_expectancy * Life_expectancy_multipler,
#         LE_at_60_y ~ Life_expectancy_y - 60,
#         D(PASS201) ~ 10 * (B - PASS201) / 20,
#         D(PASS202) ~ 10 * (PASS201 - PASS202) / 20,
#         D(PASS203) ~ 10 * (PASS202 - PASS203) / 20,
#         D(PASS204) ~ 10 * (PASS203 - PASS204) / 20,
#         D(PASS205) ~ 10 * (PASS204 - PASS205) / 20,
#         D(PASS206) ~ 10 * (PASS205 - PASS206) / 20,
#         D(PASS207) ~ 10 * (PASS206 - PASS207) / 20,
#         D(PASS208) ~ 10 * (PASS207 - PASS208) / 20,
#         D(PASS209) ~ 10 * (PASS208 - PASS209) / 20,
#         D(PASS20) ~ 10 * (PASS209 - PASS20) / 20,
#         D(PASS401) ~ 10 * (PASS20 - PASS401) / 20,
#         D(PASS402) ~ 10 * (PASS401 - PASS402) / 20,
#         D(PASS403) ~ 10 * (PASS402 - PASS403) / 20,
#         D(PASS404) ~ 10 * (PASS403 - PASS404) / 20,
#         D(PASS405) ~ 10 * (PASS404 - PASS405) / 20,
#         D(PASS406) ~ 10 * (PASS405 - PASS406) / 20,
#         D(PASS407) ~ 10 * (PASS406 - PASS407) / 20,
#         D(PASS408) ~ 10 * (PASS407 - PASS408) / 20,
#         D(PASS409) ~ 10 * (PASS408 - PASS409) / 20,
#         D(PASS40) ~ 10 * (PASS409 - PASS40) / 20,
#         D(PASS601) ~ 10 * (PASS40 - PASS601) / 20,
#         D(PASS602) ~ 10 * (PASS601 - PASS602) / 20,
#         D(PASS603) ~ 10 * (PASS602 - PASS603) / 20,
#         D(PASS604) ~ 10 * (PASS603 - PASS604) / 20,
#         D(PASS605) ~ 10 * (PASS604 - PASS605) / 20,
#         D(PASS606) ~ 10 * (PASS605 - PASS606) / 20,
#         D(PASS607) ~ 10 * (PASS606 - PASS607) / 20,
#         D(PASS608) ~ 10 * (PASS607 - PASS608) / 20,
#         D(PASS609) ~ 10 * (PASS608 - PASS609) / 20,
#         D(PASS60) ~ 10 * (PASS609 - PASS60) / 20,
#         D ~ (10 / LE_at_60_y) * D10,
#         D(D10) ~ (10 / LE_at_60_y) * D9 - D,
#         D(D9) ~ (10 / LE_at_60_y) * (D8 - D9),
#         D(D8) ~ (10 / LE_at_60_y) * (D7 - D8),
#         D(D7) ~ (10 / LE_at_60_y) * (D6 - D7),
#         D(D6) ~ (10 / LE_at_60_y) * (D5 - D6),
#         D(D5) ~ (10 / LE_at_60_y) * (D4 - D5),
#         D(D4) ~ (10 / LE_at_60_y) * (D3 - D4),
#         D(D3) ~ (10 / LE_at_60_y) * (D2 - D3),
#         D(D2) ~ (10 / LE_at_60_y) * (D1 - D2),
#         D(D1) ~ PASS60 - (10 / LE_at_60_y) * D1,
#         #   
#         Introduction_period_for_policy_y ~ interpolate(t, tables[:Introduction_period_for_policy_y], ranges[:Introduction_period_for_policy_y]),
#         GDP_Gdollar_per_y ~ interpolate(t, tables[:GDP_Gdollar_per_y], ranges[:GDP_Gdollar_per_y]),
#         Observed_warming_deg_C ~ interpolate(t, tables[:Observed_warming_deg_C], ranges[:Observed_warming_deg_C]),
#     ]

#     ODESystem(eqs; name)
# end
