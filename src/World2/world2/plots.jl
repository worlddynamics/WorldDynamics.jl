function nrdepletionsolution()
    isdefined(@__MODULE__, :_solution_nrdepletion) && return _solution_nrdepletion
    global _solution_nrdepletion = solve(natural_resource_depletion(), (1900, 2100))
    return _solution_nrdepletion
end

function pollutioncrisissolution()
    isdefined(@__MODULE__, :_solution_pollutioncrisis) && return _solution_pollutioncrisis
    global _solution_pollutioncrisis = solve(pollution_crisis(), (1900, 2100))
    return _solution_pollutioncrisis
end

function crowdingsolution()
    isdefined(@__MODULE__, :_solution_crowding) && return _solution_crowding
    global _solution_crowding = solve(crowding(), (1900, 2300))
    return _solution_crowding
end

function foodshortagesolution()
    isdefined(@__MODULE__, :_solution_foodshortage) && return _solution_foodshortage
    global _solution_foodshortage = solve(food_shortage(), (1900, 2300))
    return _solution_foodshortage
end

function increasedcapitalinvestmentgenerationsolution()
    isdefined(@__MODULE__, :_solution_increasedcapitalinvestmentgeneration) && return _solution_increasedcapitalinvestmentgeneration
    global _solution_increasedcapitalinvestmentgeneration = solve(increased_capital_investment_generation(), (1900, 2100))
    return _solution_increasedcapitalinvestmentgeneration
end

function reducedbirthratesolution()
    isdefined(@__MODULE__, :_solution_reducedbirthrate) && return _solution_reducedbirthrate
    global _solution_reducedbirthrate = solve(reduced_birth_rate(), (1900, 2100))
    return _solution_reducedbirthrate
end

function pollutioncrisisandreducebirthratesolution()
    isdefined(@__MODULE__, :_solution_pollutioncrisisandreducebirthrate) && return _solution_pollutioncrisisandreducebirthrate
    global _solution_pollutioncrisisandreducebirthrate = solve(pollution_crisis_and_reduce_birth_rate(), (1900, 2100))
    return _solution_pollutioncrisisandreducebirthrate
end

function crowdingandreducedbirthratesolution()
    isdefined(@__MODULE__, :_solution_crowdingandreducedbirthrate) && return _solution_crowdingandreducedbirthrate
    global _solution_crowdingandreducedbirthrate = solve(crowding_and_reduced_birth_rate(), (1900, 2100))
    return _solution_crowdingandreducedbirthrate
end

function crowdingandreducedbirthrate2solution()
    isdefined(@__MODULE__, :_solution_crowdingandreducedbirthrate2) && return _solution_crowdingandreducedbirthrate2
    global _solution_crowdingandreducedbirthrate2 = solve(crowding_and_reduced_birth_rate2(), (1900, 2100))
    return _solution_crowdingandreducedbirthrate2
end

function lesspollutionsolution()
    isdefined(@__MODULE__, :_solution_lesspollution) && return _solution_lesspollution
    global _solution_lesspollution = solve(less_pollution(), (1900, 2100))
    return _solution_lesspollution
end

function higheragricultureproductivitysolution()
    isdefined(@__MODULE__, :_solution_higheragricultureproductivity) && return _solution_higheragricultureproductivity
    global _solution_higheragricultureproductivity = solve(higher_agriculture_productivity(), (1900, 2100))
    return _solution_higheragricultureproductivity
end

function lesspollutionandhigheragricultureproductivitysolution()
    isdefined(@__MODULE__, :_solution_lesspollutionandhigheragricultureproductivity) && return _solution_lesspollutionandhigheragricultureproductivity
    global _solution_lesspollutionandhigheragricultureproductivity = solve(less_pollution_and_higher_agriculture_productivity(), (1900, 2100))
    return _solution_lesspollutionandhigheragricultureproductivity
end

function lesspollutionandhigheragricultureincreasedcapitalinvestmentsolution()
    isdefined(@__MODULE__, :_solution_lesspollutionandhigheragricultureincreasedcapitalinvestment) && return _solution_lesspollutionandhigheragricultureincreasedcapitalinvestment
    global _solution_lesspollutionandhigheragricultureincreasedcapitalinvestment = solve(less_pollution_and_higher_agriculture_increased_capital_investment(), (1900, 2100))
    return _solution_lesspollutionandhigheragricultureincreasedcapitalinvestment
end

function lesspollutionandhigheragricultureincreasedcapitalinvestment2solution()
    isdefined(@__MODULE__, :_solution_lesspollutionandhigheragricultureincreasedcapitalinvestment2) && return _solution_lesspollutionandhigheragricultureincreasedcapitalinvestment2
    global _solution_lesspollutionandhigheragricultureincreasedcapitalinvestment2 = solve(less_pollution_and_higher_agriculture_increased_capital_investment2(), (1900, 2100))
    return _solution_lesspollutionandhigheragricultureincreasedcapitalinvestment2
end

function lesspollutionandhigheragricultureincreasedcapitalinvestment3solution()
    isdefined(@__MODULE__, :_solution_lesspollutionandhigheragricultureincreasedcapitalinvestment3) && return _solution_lesspollutionandhigheragricultureincreasedcapitalinvestment3
    global _solution_lesspollutionandhigheragricultureincreasedcapitalinvestment3 = solve(less_pollution_and_higher_agriculture_increased_capital_investment3(), (1900, 2100))
    return _solution_lesspollutionandhigheragricultureincreasedcapitalinvestment3
end

function lesspollution2solution()
    isdefined(@__MODULE__, :_solution_lesspollution2) && return _solution_lesspollution2
    global _solution_lesspollution2 = solve(less_pollution2(), (1900, 2100))
    return _solution_lesspollution2
end

function lesspollution3solution()
    isdefined(@__MODULE__, :_solution_lesspollution3) && return _solution_lesspollution3
    global _solution_lesspollution3 = solve(less_pollution3(), (1900, 2100))
    return _solution_lesspollution3
end

function lesspollution4solution()
    isdefined(@__MODULE__, :_solution_lesspollution4) && return _solution_lesspollution4
    global _solution_lesspollution4 = solve(less_pollution4(), (1900, 2100))
    return _solution_lesspollution4
end

function lesspollution5solution()
    isdefined(@__MODULE__, :_solution_lesspollution5) && return _solution_lesspollution5
    global _solution_lesspollution5 = solve(less_pollution5(), (1900, 2100))
    return _solution_lesspollution5
end


@variables t

function _variables_1()
    @named pop = Population.population()
    @named nr = NaturalResources.natural_resources()
    @named ci = CapitalInvestment.capital_investment()
    @named pol = Pollution.pollution()
    @named ql = QualityLife.quality_life()

    variables = [
        (pop.p,    0, 8e9,  "Population"),
        (nr.nr,    0, 1e12, "Natural resources"),
        (ci.ci,    0, 20e9, "Capital investment"),
        (pol.polr, 0, 40,   "Pollution"),
        (ql.ql,    0, 2,    "Quality of life"),
    ]

    return variables
end

function _variables_2()
    @named ai = AgricultureInvestment.agriculture_investment()
    @named ci = CapitalInvestment.capital_investment()
    @named ql = QualityLife.quality_life()

    variables = [
        (ai.fr,   0,   2,   "Food ratio"),
        (ci.msl,  0,   2,   "Material standard of living"),
        (ql.qlc,  0,   2,   "Quality of life from crowding"),
        (ql.qlp,  0,   2,   "Quality of life from pollution"),
        (ai.ciaf, 0.2, 0.6, "Capital investment in agriculture fraction"),
    ]

    return variables
end


"""
    Reproduce Fig. 4-1. The original figure is presented in Chapter 4 of [WD](https://archive.org/details/worlddynamics00forr).

    Caption: Basic behavior of the world model, showing the mode in which industrialization and population are suppressed by falling natural resources.
"""
function fig_4_1(; kwargs...)
    return plotvariables(nrdepletionsolution(), (t, 1900, 2100), _variables_1(); title="Fig. 4-1", kwargs...)
end

"""
    Reproduce Fig. 4-2. The original figure is presented in Chapter 4 of [WD](https://archive.org/details/worlddynamics00forr).

    Caption: Original model as in Fig. 4-1. Material standard of living reaches a maximum and then declines as natural resources are depleted.
"""
function fig_4_2(; kwargs...)
    return plotvariables(nrdepletionsolution(), (t, 1900, 2100), _variables_2(); title="Fig. 4-2", kwargs...)
end

"""
    Reproduce Fig. 4-3. The original figure is presented in Chapter 4 of [WD](https://archive.org/details/worlddynamics00forr).

    Caption: Original model as in Fig 4-1. Natural-resource-usage rate reaches a peak about year 2010 and declines as natural resources, population, and capital investment decline.
"""
function fig_4_3(; kwargs...)
    @named nr = NaturalResources.natural_resources()

    variables = [
        (nr.nr,   0, 1e12, "Natural resources"),
        (nr.nrur, 0, 8e9,  "Natural resource usage rate"),
    ]

    return plotvariables(nrdepletionsolution(), (t, 1900, 2100), variables; title="Fig. 4-3", kwargs...)
end

"""
    Reproduce Fig. 4-4. The original figure is presented in Chapter 4 of [WD](https://archive.org/details/worlddynamics00forr).

    Caption:Original model as in Fig. 4-1. The rate of capital-investment generation declines after 2010 but does not fall below the rate of capital-investment discard until 2040, at which time the level of capital investment begins to decline.
"""
function fig_4_4(; kwargs...)
    @named ci = CapitalInvestment.capital_investment()
    @named cig = CapitalInvestment.capital_investment_generation()
    @named cid = CapitalInvestment.capital_investment_discard()

    variables = [
        (ci.ci,   0, 20e9,  "Capital investment"),
        (cig.cig, 0, 400e6, "Capital investment generation"),
        (cid.cid, 0, 400e6, "Capital investment discard"),
    ]

    return plotvariables(nrdepletionsolution(), (t, 1900, 2100), variables; title="Fig. 4-4", kwargs...)
end

"""
    Reproduce Fig. 4-5. The original figure is presented in Chapter 4 of [WD](https://archive.org/details/worlddynamics00forr).

    Caption: Reduced usage rate of natural resources leads to a pollution crisis.
"""
fig_4_5(; kwargs...) = plotvariables(pollutioncrisissolution(), (t, 1900, 2100), _variables_1(); title="Fig. 4-5", kwargs...)

"""
    Reproduce Fig. 4-6. The original figure is presented in Chapter 4 of [WD](https://archive.org/details/worlddynamics00forr).

    Caption: System ratios during the pollution mode of growth suppression.
"""
fig_4_6(; kwargs...) = plotvariables(pollutioncrisissolution(), (t, 1900, 2100), _variables_2(); title="Fig. 4-6", kwargs...)

"""
    Reproduce Fig. 4-7. The original figure is presented in Chapter 4 of [WD](https://archive.org/details/worlddynamics00forr).

    Caption: Dynamics of the pollution sector. A positive-feedback growth in pollution occurs when the pollution-absorption time increases faster than the pollution.
"""
function fig_4_7(; kwargs...)
    @named pol = Pollution.pollution()
    @named pola = Pollution.pollution_absorption()
    @named polg = Pollution.pollution_generation()

    variables = [
        (pol.polr,   0, 40,   "Pollution"),
        (pola.polat, 0, 16,   "Pollution absorption time"),
        (polg.polg,  0, 20e9, "Pollution generation"),
        (pola.pola,  0, 20e9, "Pollution absorption"),
    ]

    plotvariables(pollutioncrisissolution(), (t, 1900, 2100), variables; title="Fig. 4-7", kwargs...)
end

"""
    Reproduce Fig. 4-8. The original figure is presented in Chapter 4 of [WD](https://archive.org/details/worlddynamics00forr).

    Caption: Population sector during the pollution mode.
"""
function fig_4_8(; kwargs...)
    @named pop = Population.population()
    @named br = Population.birth_rate()
    @named dr = Population.death_rate()

    variables = [
        (pop.p, 0, 8e9,   "Population"),
        (br.br, 0, 400e6, "Birth rate"),
        (dr.dr, 0, 400e6, "Death rate"),
    ]

    plotvariables(pollutioncrisissolution(), (t, 1900, 2100), variables; title="Fig. 4-8", kwargs...)
end

"""
    Reproduce Fig. 4-9. The original figure is presented in Chapter 4 of [WD](https://archive.org/details/worlddynamics00forr).

    Caption: Growth suppressed by crowding when natural resources and pollution are inactive.
"""
function fig_4_9(; kwargs...)
    @named pop = Population.population()
    @named nr = NaturalResources.natural_resources()
    @named ci = CapitalInvestment.capital_investment()
    @named pol = Pollution.pollution()
    @named ql = QualityLife.quality_life()

    variables = [
        (pop.p,    0, 16e9, "Population"),
        (nr.nr,    0, 2e12, "Natural resources"),
        (ci.ci,    0, 40e9, "Capital investment"),
        (pol.polr, 0, 80,   "Pollution"),
        (ql.ql,    0, 4,    "Quality of life"),
    ]

    plotvariables(crowdingsolution(), (t, 1900, 2300), variables; title="Fig. 4-9", kwargs...)
end

"""
    Reproduce Fig. 4-10. The original figure is presented in Chapter 4 of [WD](https://archive.org/details/worlddynamics00forr).

    Caption: System ratios when growth is suppressed by crowding.
"""
function fig_4_10(; kwargs...)
    @named ai = AgricultureInvestment.agriculture_investment()
    @named ci = CapitalInvestment.capital_investment()
    @named ql = QualityLife.quality_life()

    variables = [
        (ai.fr,   0,   2.5, "Food ratio"),
        (ci.msl,  0,   2.5, "Material standard of living"),
        (ql.qlc,  0,   2.5, "Quality of life from crowding"),
        (ql.qlp,  0,   2.5, "Quality of life from pollution"),
        (ai.ciaf, 0.2, 0.7, "Capital investment in agriculture fraction"),
    ]

    plotvariables(crowdingsolution(), (t, 1900, 2300), variables; title="Fig. 4-10", kwargs...)
end

"""
    Reproduce Fig. 4-11. The original figure is presented in Chapter 4 of [WD](https://archive.org/details/worlddynamics00forr).

    Caption: Food shortage as the only remaining pressure to stop population growth.
"""
function fig_4_11(; kwargs...)
    @named pop = Population.population()
    @named nr = NaturalResources.natural_resources()
    @named ci = CapitalInvestment.capital_investment()
    @named pol = Pollution.pollution()
    @named ql = QualityLife.quality_life()

    variables = [
        (pop.p,    0, 12e9,   "Population"),
        (nr.nr,    0, 1.5e12, "Natural resources"),
        (ci.ci,    0, 30e9,   "Capital investment"),
        (pol.polr, 0, 60,     "Pollution"),
        (ql.ql,    0, 3,      "Quality of life"),
    ]

    plotvariables(foodshortagesolution(), (t, 1900, 2300), variables; title="Fig. 4-11", kwargs...)
end

"""
    Reproduce Fig. 4-12. The original figure is presented in Chapter 4 of [WD](https://archive.org/details/worlddynamics00forr).

    Caption: System ratios during the food-shortage mode.
"""
fig_4_12(; kwargs...) = plotvariables(foodshortagesolution(), (t, 1900, 2300), _variables_2(); title="Fig. 4-12", kwargs...)

"""
    Reproduce Fig. 5-1. The original figure is presented in Chapter 5 of [WD](https://archive.org/details/worlddynamics00forr).

    Caption: Higher capital-investment generation triggers the pollution crisis.
"""
function fig_5_1(; kwargs...)
    return plotvariables(increasedcapitalinvestmentgenerationsolution(), (t, 1900, 2100), _variables_1(); title="Fig. 5-1", kwargs...)
end

"""
    Reproduce Fig. 5-2. The original figure is presented in Chapter 5 of [WD](https://archive.org/details/worlddynamics00forr).

    Caption: Lower birth rate does not affect suppression of growth by falling natural resources.
"""
function fig_5_2(; kwargs...)
    return plotvariables(reducedbirthratesolution(), (t, 1900, 2100), _variables_1(); title="Fig. 5-2", kwargs...)
end

"""
    Reproduce Fig. 5-3. The original figure is presented in Chapter 5 of [WD](https://archive.org/details/worlddynamics00forr).

    Caption: Ratios for the same condition of lower birth rate as in Fig. 5-2.
"""
function fig_5_3(; kwargs...)
    return plotvariables(reducedbirthratesolution(), (t, 1900, 2100), _variables_2(); title="Fig. 5-3", kwargs...)
end

"""
    Reproduce Fig. 5-4. The original figure is presented in Chapter 5 of [WD](https://archive.org/details/worlddynamics00forr).

    Caption: Reduced birth rate still leads to the pollution crisis.
"""
function fig_5_4(; kwargs...)
    return plotvariables(pollutioncrisisandreducebirthratesolution(), (t, 1900, 2100), _variables_1(); title="Fig. 5-4", kwargs...)
end

"""
    Reproduce Fig. 5-5. The original figure is presented in Chapter 5 of [WD](https://archive.org/details/worlddynamics00forr).

    Caption: With resource depletion and pollution suppressed, population still climbs even with a 30% reduction in "normal" birth rate.
"""
function fig_5_5(; kwargs...)
    return plotvariables(crowdingandreducedbirthratesolution(), (t, 1900, 2100), _variables_1(); title="Fig. 5-5", kwargs...)
end

"""
    Reproduce Fig. 5-6. The original figure is presented in Chapter 5 of [WD](https://archive.org/details/worlddynamics00forr).

    Caption: A 50% reduction in "normal" birth rate causes growth of population to pause for 20 years, then resume.
"""
function fig_5_6(; kwargs...)
    return plotvariables(crowdingandreducedbirthrate2solution(), (t, 1900, 2100), _variables_1(); title="Fig. 5-6", kwargs...)
end

"""
    Reproduce Fig. 5-7. The original figure is presented in Chapter 5 of [WD](https://archive.org/details/worlddynamics00forr).

    Caption: Ratios for conditions of Fig. 5-6.
"""
function fig_5_7(; kwargs...)
    return plotvariables(crowdingandreducedbirthrate2solution(), (t, 1900, 2100), _variables_2(); title="Fig. 5-7", kwargs...)
end

"""
    Reproduce Fig. 5-8. The original figure is presented in Chapter 5 of [WD](https://archive.org/details/worlddynamics00forr).

    Caption: Reduction of pollution generation allows population and capital investment to increase further before the pollution crisis.
"""
function fig_5_8(; kwargs...)
    return plotvariables(lesspollutionsolution(), (t, 1900, 2100), _variables_1(); title="Fig. 5-8", kwargs...)
end

"""
    Reproduce Fig. 5-9. The original figure is presented in Chapter 5 of [WD](https://archive.org/details/worlddynamics00forr).

    Caption: Increased food production causes increased population.
"""
function fig_5_9(; kwargs...)
    return plotvariables(higheragricultureproductivitysolution(), (t, 1900, 2100), _variables_1(); title="Fig. 5-9", kwargs...)
end

"""
    Reproduce Fig. 5-10. The original figure is presented in Chapter 5 of [WD](https://archive.org/details/worlddynamics00forr).

    Caption: Ratios for the conditions of Fig. 5-9. Higher food productivity causes capital reallocation away from agriculture.
"""
function fig_5_10(; kwargs...)
    return plotvariables(higheragricultureproductivitysolution(), (t, 1900, 2100), _variables_2(); title="Fig. 5-10", kwargs...)
end

"""
    Reproduce Fig. 5-11. The original figure is presented in Chapter 5 of [WD](https://archive.org/details/worlddynamics00forr).

    Caption: Increased food production causes greater population and earlier pollution crisis compared with Fig. 5-8.
"""
function fig_5_11(; kwargs...)
    return plotvariables(lesspollutionandhigheragricultureproductivitysolution(), (t, 1900, 2100), _variables_1(); title="Fig. 5-11", kwargs...)
end

"""
    Reproduce Fig. 5-12. The original figure is presented in Chapter 5 of [WD](https://archive.org/details/worlddynamics00forr).

    Caption: Compared with Fig. 5-11, increased capital generation causes an earlier pollution crisis.
"""
function fig_5_12(; kwargs...)
    return plotvariables(lesspollutionandhigheragricultureincreasedcapitalinvestmentsolution(), (t, 1900, 2100), _variables_1(); title="Fig. 5-12", kwargs...)
end

"""
    Reproduce Fig. 5-13. The original figure is presented in Chapter 5 of [WD](https://archive.org/details/worlddynamics00forr).

    Caption: Compared with Fig. 5-12, less pollution generation increases peak population and delays the pollution crisis.
"""
function fig_5_13(; kwargs...)
    return plotvariables(lesspollutionandhigheragricultureincreasedcapitalinvestment2solution(), (t, 1900, 2100), _variables_1(); title="Fig. 5-13", kwargs...)
end

"""
    Reproduce Fig. 5-14. The original figure is presented in Chapter 5 of [WD](https://archive.org/details/worlddynamics00forr).

    Caption: Compared with Fig. 5-12, reduced birth rate lowers the peak population but does not ellminate or delay the pollution crisis.
"""
function fig_5_14(; kwargs...)
    return plotvariables(lesspollutionandhigheragricultureincreasedcapitalinvestment3solution(), (t, 1900, 2100), _variables_1(); title="Fig. 5-14", kwargs...)
end

"""
    Reproduce Fig. 6-1. The original figure is presented in Chapter 6 of [WD](https://archive.org/details/worlddynamics00forr).

    Caption: Natural-resource-usage rate and pollution generation are reduced in 1970.
"""
function fig_6_1(; kwargs...)
    return plotvariables(lesspollution2solution(), (t, 1900, 2100), _variables_1(); title="Fig. 6-1", kwargs...)
end

"""
    Reproduce Fig. 6-2. The original figure is presented in Chapter 6 of [WD](https://archive.org/details/worlddynamics00forr).

    Caption: Ratios for conditions of Fig. 6-1.
"""
function fig_6_2(; kwargs...)
    return plotvariables(lesspollution2solution(), (t, 1900, 2100), _variables_2(); title="Fig. 6-2", kwargs...)
end

"""
    Reproduce Fig. 6-3. The original figure is presented in Chapter 6 of [WD](https://archive.org/details/worlddynamics00forr).

    Caption: Capital generation is reduced 40% in 1970 in addition to changes in Fig. 6-1. Population
    stabilizes at a lower level; quality of life is increased.
"""
function fig_6_3(; kwargs...)
    return plotvariables(lesspollution3solution(), (t, 1900, 2100), _variables_1(); title="Fig. 6-3", kwargs...)
end

"""
    Reproduce Fig. 6-4. The original figure is presented in Chapter 6 of [WD](https://archive.org/details/worlddynamics00forr).

    Caption: Ratios for conditions of Fig. 6-3.
"""
function fig_6_4(; kwargs...)
    return plotvariables(lesspollution3solution(), (t, 1900, 2100), _variables_2(); title="Fig. 6-4", kwargs...)
end

"""
    Reproduce Fig. 6-5. The original figure is presented in Chapter 6 of [WD](https://archive.org/details/worlddynamics00forr).

    Caption: Food productivity is reduced 20% in 1970 along with changes in Fig. 6-3. Population is lower, quality of life higher.
"""
function fig_6_5(; kwargs...)
    return plotvariables(lesspollution4solution(), (t, 1900, 2100), _variables_1(); title="Fig. 6-5", kwargs...)
end

"""
    Reproduce Fig. 6-6. The original figure is presented in Chapter 6 of [WD](https://archive.org/details/worlddynamics00forr).

    Caption: Ratios for conditions of Fig. 6-5.
"""
function fig_6_6(; kwargs...)
    return plotvariables(lesspollution4solution(), (t, 1900, 2100), _variables_2(); title="Fig. 6-6", kwargs...)
end

"""
    Reproduce Fig. 6-7. The original figure is presented in Chapter 6 of [WD](https://archive.org/details/worlddynamics00forr).

    Caption: Normal birth rate reduced 30% in 1970 along with changes in Fig. 6-5. Population is lower, quality of life higher again.
"""
function fig_6_7(; kwargs...)
    return plotvariables(lesspollution5solution(), (t, 1900, 2100), _variables_1(); title="Fig. 6-7", kwargs...)
end

"""
    Reproduce Fig. 6-8. The original figure is presented in Chapter 6 of [WD](https://archive.org/details/worlddynamics00forr).

    Caption: Ratios for conditions of Fig. 6-7.
"""
function fig_6_8(; kwargs...)
    return plotvariables(lesspollution5solution(), (t, 1900, 2100), _variables_2(); title="Fig. 6-8", kwargs...)
end
