function historicalrun(;
    pop_params = Pop4._params,
    capital_params = Capital._params,
    agriculture_params = Agriculture._params,
    nonrenewable_params = NonRenewable._params,
    pollution_params = Pollution._params,
    pop_inits = Pop4._inits,
    capital_inits = Capital._inits,
    agriculture_inits = Agriculture._inits,
    nonrenewable_inits = NonRenewable._inits,
    pollution_inits = Pollution._inits,
    pop_tables = Pop4._tables,
    capital_tables = Capital._tables,
    agriculture_tables = Agriculture._tables,
    nonrenewable_tables = NonRenewable._tables,
    pollution_tables = Pollution._tables,
    pop_ranges = Pop4._ranges,
    capital_ranges = Capital._ranges,
    agriculture_ranges = Agriculture._ranges,
    nonrenewable_ranges = NonRenewable._ranges,
    pollution_ranges = Pollution._ranges,
)
    pop_inits[:iopc] = 6.65e10 / pop_inits[:pop]

    @named pop = Pop4.population(; params=pop_params, inits=pop_inits, tables=pop_tables, ranges=pop_ranges)
    @named dr = Pop4.death_rate(; params=pop_params, inits=pop_inits, tables=pop_tables, ranges=pop_ranges)
    @named br = Pop4.birth_rate(; params=pop_params, inits=pop_inits, tables=pop_tables, ranges=pop_ranges)

    capital_params[:pyear] = 1975

    @named is = Capital.industrial_subsector(; params=capital_params, inits=capital_inits, tables=capital_tables, ranges=capital_ranges)
    @named ss = Capital.service_subsector(; params=capital_params, inits=capital_inits, tables=capital_tables, ranges=capital_ranges)
    @named js = Capital.job_subsector(; params=capital_params, inits=capital_inits, tables=capital_tables, ranges=capital_ranges)

    @named ld = Agriculture.land_development(; params=agriculture_params, inits=agriculture_inits, tables=agriculture_tables, ranges=agriculture_ranges)
    @named ai = Agriculture.agricultural_inputs(; params=agriculture_params, inits=agriculture_inits, tables=agriculture_tables, ranges=agriculture_ranges)
    @named iad = Agriculture.investment_allocation_decision(; params=agriculture_params, inits=agriculture_inits, tables=agriculture_tables, ranges=agriculture_ranges)
    @named leuiu = Agriculture.land_erosion_urban_industrial_use(; params=agriculture_params, inits=agriculture_inits, tables=agriculture_tables, ranges=agriculture_ranges)
    @named dlm = Agriculture.discontinuing_land_maintenance(; params=agriculture_params, inits=agriculture_inits, tables=agriculture_tables, ranges=agriculture_ranges)
    @named lfr = Agriculture.land_fertility_regeneration(; params=agriculture_params, inits=agriculture_inits, tables=agriculture_tables, ranges=agriculture_ranges)
    @named lfd = Agriculture.land_fertility_degradation(; params=agriculture_params, inits=agriculture_inits, tables=agriculture_tables, ranges=agriculture_ranges)

    @named nr = NonRenewable.non_renewable(; params=nonrenewable_params, inits=nonrenewable_inits, tables=nonrenewable_tables, ranges=nonrenewable_ranges)

    @named ppd = Pollution.persistent_pollution_dummy(; params=pollution_params, inits=pollution_inits, tables=pollution_tables, ranges=pollution_ranges)
    @named pp = Pollution.persistent_pollution(; params=pollution_params, inits=pollution_inits, tables=pollution_tables, ranges=pollution_ranges)

    @named se = SupplementaryEquations.supplementary_equations()


    systems = [
        pop, dr, br,
        is, ss, js,
        ld, ai, iad, leuiu, dlm, lfr, lfd,
        nr,
        pp, ppd,
        se,
    ]

    connection_eqs = WorldDynamics.variable_connections(systems)

    return WorldDynamics.compose(systems, connection_eqs)
end
