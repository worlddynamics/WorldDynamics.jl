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
