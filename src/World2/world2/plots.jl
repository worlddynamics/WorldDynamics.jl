function nrdepletionsolution()
    isdefined(@__MODULE__, :_solution_nrdepletion) && return _solution_nrdepletion
    global _solution_nrdepletion = solve(natural_resource_depletion(), (1900, 2100))
    return _solution_nrdepletion
end

function fig_1(; kwargs...)
    @named pop = Population.population()
    @named nr = NaturalResources.natural_resources()
    @named ci = CapitalInvestment.capital_investment()
    @named pol = Pollution.pollution()
    @named ql = QualityLife.quality_life()

    @variables t

    variables = [
        (pop.p,    0, 8e9,  "Population"),
        (nr.nr,    0, 1e12, "Natural resources"),
        (ci.ci,    0, 20e9, "Capital investment"),
        (pol.polr, 0, 40,   "Pollution"),
        (ql.ql,    0, 2,    "Quality of life"),
    ]

    return plotvariables(nrdepletionsolution(), (t, 1900, 2100), variables; title="Fig. 4-1", kwargs...)
end

function fig_2(; kwargs...)
    @named ai = AgricultureInvestment.agriculture_investment()
    @named ci = CapitalInvestment.capital_investment()
    @named ql = QualityLife.quality_life()

    @variables t

    variables = [
        (ai.fr,   0,   2,   "fr"),
        (ci.msl,  0,   2,   "msl"),
        (ql.qlc,  0,   2,   "qlc"),
        (ql.qlp,  0,   2,   "qlp"),
        (ai.ciaf, 0.2, 0.6, "ciaf"),
    ]

    return plotvariables(nrdepletionsolution(), (t, 1900, 2100), variables; title="Fig. 4-2", kwargs...)
end
