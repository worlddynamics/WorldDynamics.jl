include("../../plotvariables.jl")


@variables t


function _nrdepletionsolution()
    isdefined(@__MODULE__, :_solution_nrdepletion) && return _solution_nrdepletion
    global _solution_nrdepletion = solve(natural_resource_depletion(), (1900, 2100))
    return _solution_nrdepletion
end


function fig_1()
    @named pop = Population.population()
    @named dr = Population.death_rate()
    @named br = Population.birth_rate()
    @named ci = CapitalInvestment.capital_investment()
    @named cig = CapitalInvestment.capital_investment_generation()
    @named cid = CapitalInvestment.capital_investment_discard()
    @named ai = AgricultureInvestment.agriculture_investment()
    @named nr = NaturalResources.natural_resources()
    @named nrur = NaturalResources.natural_resources_usage_rate()
    @named pol = Pollution.pollution()
    @named pola = Pollution.pollution_absorption()
    @named polg = Pollution.pollution_generation()
    @named ql = QualityLife.quality_life()

    variables = [
        (pop.p,    0, 8e9,  "Population"),
        (nr.nr,    0, 1e12, "Natural resources"),
        (ci.ci,    0, 20e9, "Capital investment"),
        (pol.polr, 0, 40,   "Pollution"),
        (ql.ql,    0, 2,    "Quality of life"),
    ]

    return plotvariables(_nrdepletionsolution(), (t, 1900, 2100), variables; title="Fig. 4-1")
end
