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
        (ai.fr,   0,   2,   "fr"),
        (ci.msl,  0,   2,   "msl"),
        (ql.qlc,  0,   2,   "qlc"),
        (ql.qlp,  0,   2,   "qlp"),
        (ai.ciaf, 0.2, 0.6, "ciaf"),
    ]

    return variables
end


function fig_1(; kwargs...)
    return plotvariables(nrdepletionsolution(), (t, 1900, 2100), variables_1(); title="Fig. 4-1", kwargs...)
end

function fig_2(; kwargs...)
    return plotvariables(nrdepletionsolution(), (t, 1900, 2100), variables_2(); title="Fig. 4-2", kwargs...)
end

function fig_3(; kwargs...)
    @named nr = NaturalResources.natural_resources()

    variables = [
        (nr.nr,   0, 1e12, "nr"),
        (nr.nrur, 0, 8e9,  "nrur"),
    ]

    return plotvariables(nrdepletionsolution(), (t, 1900, 2100), variables; title="Fig. 4-3", kwargs...)
end

function fig_4(; kwargs...)
    @named ci = CapitalInvestment.capital_investment()
    @named cig = CapitalInvestment.capital_investment_generation()
    @named cid = CapitalInvestment.capital_investment_discard()

    variables = [
        (ci.ci,   0, 20e9,  "ci"),
        (cig.cig, 0, 400e6, "cig"),
        (cid.cid, 0, 400e6, "cid"),
    ]

    return plotvariables(nrdepletionsolution(), (t, 1900, 2100), variables; title="Fig. 4-4", kwargs...)
end

fig_5(; kwargs...) = plotvariables(pollutioncrisissolution(), (t, 1900, 2100), variables_1(); title="Fig. 4-5", kwargs...)

fig_6(; kwargs...) = plotvariables(pollutioncrisissolution(), (t, 1900, 2100), variables_2(); title="Fig. 4-6", kwargs...)

function fig_7(; kwargs...)
    @named pol = Pollution.pollution()
    @named pola = Pollution.pollution_absorption()
    @named polg = Pollution.pollution_generation()

    variables = [
        (pol.polr,   0, 40,   "polr"),
        (pola.polat, 0, 16,   "polat"),
        (polg.polg,  0, 20e9, "polg"),
        (pola.pola,  0, 20e9, "pola"),
    ]

    plotvariables(pollutioncrisissolution(), (t, 1900, 2100), variables; title="Fig. 4-7", kwargs...)
end

function fig_8(; kwargs...)
    @named pop = Population.population()
    @named br = Population.birth_rate()
    @named dr = Population.death_rate()

    variables = [
        (pop.p, 0, 8e9, "p"),
        (br.br, 0, 400e6, "br"),
        (dr.dr, 0, 400e6, "dr"),
    ]

    plotvariables(pollutioncrisissolution(), (t, 1900, 2100), variables; title="Fig. 4-8", kwargs...)
end

function fig_9(; kwargs...)
    @named pop = Population.population()
    @named nr = NaturalResources.natural_resources()
    @named ci = CapitalInvestment.capital_investment()
    @named pol = Pollution.pollution()
    @named ql = QualityLife.quality_life()

    variables = [
        (pop.p,    0, 16e9,  "Population"),
        (nr.nr,    0, 2e12,  "Natural resources"),
        (ci.ci,    0, 40e9,  "Capital investment"),
        (pol.polr, 0, 80,    "Pollution"),
        (ql.ql,    0, 4,     "Quality of life"),
    ]

    plotvariables(crowdingsolution(), (t, 1900, 2300), variables; title="Fig. 4-9", kwargs...)
end

function fig_10(; kwargs...)
    @named ai = AgricultureInvestment.agriculture_investment()
    @named ci = CapitalInvestment.capital_investment()
    @named ql = QualityLife.quality_life()

    variables = [
        (ai.fr,   0,   2.5, "fr"),
        (ci.msl,  0,   2.5, "msl"),
        (ql.qlc,  0,   2.5, "qlc"),
        (ql.qlp,  0,   2.5, "qlp"),
        (ai.ciaf, 0.2, 0.7, "ciaf"),
    ]

    plotvariables(crowdingsolution(), (t, 1900, 2300), variables; title="Fig. 4-10", kwargs...)
end
