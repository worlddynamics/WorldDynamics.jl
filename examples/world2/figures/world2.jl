using WorldDynamics

include("../scenarios/world2_historicalrun.jl")


system = world2_natural_resource_depletion()
sol = WorldDynamics.solve(system, (1900, 2100))


@named pop = WorldDynamics.World2.Population.population()
@named dr = WorldDynamics.World2.Population.death_rate()
@named br = WorldDynamics.World2.Population.birth_rate()
@named ci = WorldDynamics.World2.CapitalInvestment.capital_investment()
@named cig = WorldDynamics.World2.CapitalInvestment.capital_investment_generation()
@named cid = WorldDynamics.World2.CapitalInvestment.capital_investment_discard()
@named ai = WorldDynamics.World2.AgricultureInvestment.agriculture_investment()
@named nr = WorldDynamics.World2.NaturalResources.natural_resources()
@named nrur = WorldDynamics.World2.NaturalResources.natural_resources_usage_rate()
@named pol = WorldDynamics.World2.Pollution.pollution()
@named pola = WorldDynamics.World2.Pollution.pollution_absorption()
@named polg = WorldDynamics.World2.Pollution.pollution_generation()
@named ql = WorldDynamics.World2.QualityLife.quality_life()

@variables t

fig_4_1_variables = [
    (pop.p, 0, 3e9, "Population"),
    (nr.nr, 0, 1e12, "Natural resources"),
    (ci.ci, 0, 20e9, "Capital investment"),
    (pol.polr, 0, 40, "Pollution"),
    (ql.ql, 0, 2, "Quality of life"),
]

plotvariables(sol, (t, 1900, 2100), fig_4_1_variables, name="Fig. 4-1", showlegend=true, showaxis=true, colored=true)
