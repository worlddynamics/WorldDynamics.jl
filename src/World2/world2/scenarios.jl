function natural_resource_depletion(;
    pop_params = Population.params,
    capital_params = CapitalInvestment.params,
    agriculture_params = AgricultureInvestment.params,
    naturalresources_params = NaturalResources.params,
    pollution_params = Pollution.params,
    qualitylife_params = QualityLife.params,
    pop_inits = Population.inits,
    capital_inits = CapitalInvestment.inits,
    agriculture_inits = AgricultureInvestment.inits,
    naturalresources_inits = NaturalResources.inits,
    pollution_inits = Pollution.inits,
    qualitylife_inits = QualityLife.inits,
    pop_tables = Population.tables,
    capital_tables = CapitalInvestment.tables,
    agriculture_tables = AgricultureInvestment.tables,
    naturalresources_tables = NaturalResources.tables,
    pollution_tables = Pollution.tables,
    qualitylife_tables = QualityLife.tables,
    pop_ranges = Population.ranges,
    capital_ranges = CapitalInvestment.ranges,
    agriculture_ranges = AgricultureInvestment.ranges,
    naturalresources_ranges = NaturalResources.ranges,
    pollution_ranges = Pollution.ranges,
    qualitylife_ranges = QualityLife.ranges,
)
    @named pop = Population.population(; params=pop_params, inits=pop_inits, tables=pop_tables, ranges=pop_ranges)
    @named dr = Population.death_rate(; params=pop_params, inits=pop_inits, tables=pop_tables, ranges=pop_ranges)
    @named br = Population.birth_rate(; params=pop_params, inits=pop_inits, tables=pop_tables, ranges=pop_ranges)

    @named ci = CapitalInvestment.capital_investment(; params=capital_params, inits=capital_inits, tables=capital_tables, ranges=capital_ranges)
    @named cig = CapitalInvestment.capital_investment_generation(; params=capital_params, inits=capital_inits, tables=capital_tables, ranges=capital_ranges)
    @named cid = CapitalInvestment.capital_investment_discard(; params=capital_params, inits=capital_inits, tables=capital_tables, ranges=capital_ranges)

    @named ai = AgricultureInvestment.agriculture_investment(; params=agriculture_params, inits=agriculture_inits, tables=agriculture_tables, ranges=agriculture_ranges)

    @named nr = NaturalResources.natural_resources(; params=naturalresources_params, inits=naturalresources_inits, tables=naturalresources_tables, ranges=naturalresources_ranges)
    @named nrur = NaturalResources.natural_resources_usage_rate(; params=naturalresources_params, inits=naturalresources_inits, tables=naturalresources_tables, ranges=naturalresources_ranges)

    @named pol = Pollution.pollution(; params=pollution_params, inits=pollution_inits, tables=pollution_tables, ranges=pollution_ranges)
    @named pola = Pollution.pollution_absorption(; params=pollution_params, inits=pollution_inits, tables=pollution_tables, ranges=pollution_ranges)
    @named polg = Pollution.pollution_generation(; params=pollution_params, inits=pollution_inits, tables=pollution_tables, ranges=pollution_ranges)

    @named ql = QualityLife.quality_life(; params=qualitylife_params, inits=qualitylife_inits, tables=qualitylife_tables, ranges=qualitylife_ranges)


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

function pollution_crisis(; kwargs...)
    parameters = NaturalResources.getparameters()
    parameters[:nrun1] = 0.25

    return natural_resource_depletion(; naturalresources_params=parameters, kwargs...)
end

function crowding(; kwargs...)
    nr_parameters = NaturalResources.getparameters()
    nr_parameters[:nrun1] = 0.0

    pol_parameters = Pollution.getparameters()
    pol_parameters[:poln1] = 0.1

    return natural_resource_depletion(; naturalresources_params=nr_parameters, pollution_params=pol_parameters, kwargs...)
end
