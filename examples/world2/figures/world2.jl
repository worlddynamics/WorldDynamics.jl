using WorldDynamics

include("../scenarios/world2_historicalrun.jl")


system = world2_natural_resource_depletion()
sol = WorldDynamics.solve(system, (1900, 2100))


@named pop = World2.Population.population()
@named dr = World2.Population.death_rate()
@named br = World2.Population.birth_rate()
@named ci = World2.CapitalInvestment.capital_investment()
@named cig = World2.CapitalInvestment.capital_investment_generation()
@named cid = World2.CapitalInvestment.capital_investment_discard()
@named ai = World2.AgricultureInvestment.agriculture_investment()
@named nr = World2.NaturalResources.natural_resources()
@named nrur = World2.NaturalResources.natural_resources_usage_rate()
@named pol = World2.Pollution.pollution()
@named pola = World2.Pollution.pollution_absorption()
@named polg = World2.Pollution.pollution_generation()
@named ql = World2.QualityLife.quality_life()

@variables t

fig_4_1_variables = [
    (pop.p, 0, 8e9, "Population"),
    (nr.nr, 0, 1e12, "Natural resources"),
    (ci.ci, 0, 20e9, "Capital investment"),
    (pol.polr, 0, 40, "Pollution"),
    (ql.ql, 0, 2, "Quality of life"),
]

plotvariables(sol, (t, 1900, 2100), fig_4_1_variables, name="Fig. 4-1", showlegend=true, showaxis=true, colored=true)
