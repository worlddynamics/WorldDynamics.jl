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

@variables t

function variables_1()
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

function variables_2()
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
    Reproduce Fig. 4-1. The original figure is presented on Chapter 4.
"""
function fig_4_1(; kwargs...)
    return plotvariables(nrdepletionsolution(), (t, 1900, 2100), variables_1(); title="Fig. 4-1", kwargs...)
end

"""
    Reproduce Fig. 4-2. The original figure is presented on Chapter 4.
"""
function fig_4_2(; kwargs...)
    return plotvariables(nrdepletionsolution(), (t, 1900, 2100), variables_2(); title="Fig. 4-2", kwargs...)
end

"""
    Reproduce Fig. 4-3. The original figure is presented on Chapter 4.
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
    Reproduce Fig. 4-4. The original figure is presented on Chapter 4.
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
    Reproduce Fig. 4-5. The original figure is presented on Chapter 4.
"""
fig_4_5(; kwargs...) = plotvariables(pollutioncrisissolution(), (t, 1900, 2100), variables_1(); title="Fig. 4-5", kwargs...)

"""
    Reproduce Fig. 4-6. The original figure is presented on Chapter 4.
"""
fig_4_6(; kwargs...) = plotvariables(pollutioncrisissolution(), (t, 1900, 2100), variables_2(); title="Fig. 4-6", kwargs...)

"""
    Reproduce Fig. 4-7. The original figure is presented on Chapter 4.
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
    Reproduce Fig. 4-8. The original figure is presented on Chapter 4.
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
    Reproduce Fig. 4-9. The original figure is presented on Chapter 4.
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
    Reproduce Fig. 4-10. The original figure is presented on Chapter 4.
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
    Reproduce Fig. 4-11. The original figure is presented on Chapter 4.
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
    Reproduce Fig. 4-12. The original figure is presented on Chapter 4.
"""
fig_4_12(; kwargs...) = plotvariables(foodshortagesolution(), (t, 1900, 2300), variables_2(); title="Fig. 4-12", kwargs...)

"""
    Reproduce Fig. 5-1. The original figure is presented in Chapter 5 of [WD](https://archive.org/details/worlddynamics00forr).
    
    Caption: Higher capital-investment generation triggers the pollution crisis.
"""
function fig_5_1(; kwargs...)
    return plotvariables(increasedcapitalinvestmentgenerationsolution(), (t, 1900, 2100), variables_1(); title="Fig. 5-1", kwargs...)
end

"""
    Reproduce Fig. 5-2. The original figure is presented in Chapter 5 of [WD](https://archive.org/details/worlddynamics00forr).

    Caption: Lower birth rate does not affect suppression of growth by falling natural resources.
    
"""
function fig_5_2(; kwargs...)
    return plotvariables(reducedbirthratesolution(), (t, 1900, 2100), variables_1(); title="Fig. 5-2", kwargs...)
end