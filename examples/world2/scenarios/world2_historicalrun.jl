using WorldDynamics
using ModelingToolkit

function world2_natural_resource_depletion()
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


    systems = [
        pop, dr, br,
        ci, cig, cid,
        ai,
        nr, nrur,
        pol, pola, polg,
        ql,
    ]


    connection_eqs = [
        # population
        pop.br ~ br.br
        pop.dr ~ dr.dr
        br.p ~ pop.p
        br.msl ~ ci.msl
        br.cr ~ pop.cr
        br.fr ~ ai.fr
        br.polr ~ pol.polr
        dr.p ~ pop.p
        dr.msl ~ ci.msl
        dr.cr ~ pop.cr
        dr.fr ~ ai.fr
        dr.polr ~ pol.polr
        # natural resources
        nr.nrur ~ nrur.nrur
        nrur.p ~ pop.p
        nrur.msl ~ ci.msl
        # capital investment
        ci.ciaf ~ ai.ciaf
        ci.nrem ~ nr.nrem
        ci.p ~ pop.p
        ci.cig ~ cig.cig
        ci.cid ~ cid.cid
        cig.p ~ pop.p
        cig.msl ~ ci.msl
        cid.ci ~ ci.ci
        # agricultural investment
        ai.cr ~ pop.cr
        ai.cira ~ ci.cira
        ai.polr ~ pol.polr
        ai.qlm ~ ql.qlm
        ai.qlf ~ ql.qlf
        # pollution
        pol.polg ~ polg.polg
        pol.pola ~ pola.pola
        pola.pol ~ pol.pol
        pola.polr ~ pol.polr
        polg.p ~ pop.p
        polg.cir ~ ci.cir
        # quality life
        ql.msl ~ ci.msl
        ql.cr ~ pop.cr
        ql.fr ~ ai.fr
        ql.polr ~ pol.polr
    ]

    return WorldDynamics.compose(systems, connection_eqs)
end
