function historicalrun(;
    pop_params = Pop4.params,
    capital_params = Capital.params,
    agriculture_params = Agriculture.params,
    nonrenewable_params = NonRenewable.params,
    pollution_params = Pollution.params,
    pop_inits = Pop4.inits,
    capital_inits = Capital.inits,
    agriculture_inits = Agriculture.inits,
    nonrenewable_inits = NonRenewable.inits,
    pollution_inits = Pollution.inits,
    pop_tables = Pop4.tables,
    capital_tables = Capital.tables,
    agriculture_tables = Agriculture.tables,
    nonrenewable_tables = NonRenewable.tables,
    pollution_tables = Pollution.tables,
    pop_ranges = Pop4.ranges,
    capital_ranges = Capital.ranges,
    agriculture_ranges = Agriculture.ranges,
    nonrenewable_ranges = NonRenewable.ranges,
    pollution_ranges = Pollution.ranges,
)
    pop_inits[:iopc] =  6.65e10 / pop_inits[:pop]

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

    @named pp = Pollution.persistent_pollution(; params=pollution_params, inits=pollution_inits, tables=pollution_tables, ranges=pollution_ranges)

    @named se = SupplementaryEquations.supplementary_equations()


    systems = [
        pop, dr, br,
        is, ss, js,
        ld, ai, iad, leuiu, dlm, lfr, lfd,
        nr,
        pp,
        se,
    ]


    connection_eqs = [
        # population
        pop.le ~ dr.le
        pop.tf ~ br.tf
        dr.dr ~ pop.dr
        dr.pop ~ pop.pop
        dr.fpc ~ ld.fpc
        dr.sopc ~ ss.sopc
        dr.iopc ~ is.iopc
        dr.ppolx ~ pp.ppolx
        br.br ~ pop.br
        br.pop ~ pop.pop
        br.le ~ dr.le
        br.iopc ~ is.iopc
        br.sopc ~ ss.sopc
        # capital
        is.pop ~ pop.pop
        is.fcaor ~ nr.fcaor
        is.cuf ~ js.cuf
        is.fioaa ~ ld.fioaa
        is.fioas ~ ss.fioas
        ss.iopc ~ is.iopc
        ss.io ~ is.io
        ss.cuf ~ js.cuf
        ss.pop ~ pop.pop
        js.ic ~ is.ic
        js.iopc ~ is.iopc
        js.sc ~ ss.sc
        js.sopc ~ ss.sopc
        js.al ~ ld.al
        js.aiph ~ ai.aiph
        js.p2 ~ pop.p2
        js.p3 ~ pop.p3
        # agriculture
        ld.ler ~ leuiu.ler
        ld.lrui ~ leuiu.lrui
        ld.ly ~ ai.ly
        ld.pop ~ pop.pop
        ld.iopc ~ is.iopc
        ld.io ~ is.io
        ld.fiald ~ iad.fiald
        ai.tai ~ ld.tai
        ai.fiald ~ iad.fiald
        ai.falm ~ dlm.falm
        ai.al ~ ld.al
        ai.lfert ~ lfd.lfert
        ai.io ~ is.io
        iad.ly ~ ai.ly
        iad.dcph ~ ld.dcph
        iad.alai ~ ai.alai
        iad.lymc ~ ai.lymc
        iad.aiph ~ ai.aiph
        leuiu.ly ~ ai.ly
        leuiu.al ~ ld.al
        leuiu.iopc ~ is.iopc
        leuiu.pop ~ pop.pop
        dlm.fpc ~ ld.fpc
        lfr.lfert ~ lfd.lfert
        lfr.falm ~ dlm.falm
        lfd.lfr ~ lfr.lfr
        lfd.ppolx ~ pp.ppolx
        # non-renewable
        nr.pop ~ pop.pop
        nr.iopc ~ is.iopc
        # pollution
        pp.ppgf22 ~ 1.0
        pp.pcrum ~ nr.pcrum
        pp.pop ~ pop.pop
        pp.aiph ~ ai.aiph
        pp.al ~ ld.al
        # supplementary eqs
        se.f ~ ld.f
        se.so ~ ss.so
        se.io ~ is.io
    ]

    return compose(systems, connection_eqs)
end
