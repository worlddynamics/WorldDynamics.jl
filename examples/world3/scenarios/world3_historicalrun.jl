using WorldDynamics
using ModelingToolkit

function world3_historicalrun(;
    pop_params = WorldDynamics.World3.Pop4.params,
    capital_params = WorldDynamics.World3.Capital.params,
    agriculture_params = WorldDynamics.World3.Agriculture.params,
    nonrenewable_params = WorldDynamics.World3.NonRenewable.params,
    pollution_params = WorldDynamics.World3.Pollution.params,
    pop_inits = WorldDynamics.World3.Pop4.inits,
    capital_inits = WorldDynamics.World3.Capital.inits,
    agriculture_inits = WorldDynamics.World3.Agriculture.inits,
    nonrenewable_inits = WorldDynamics.World3.NonRenewable.inits,
    pollution_inits = WorldDynamics.World3.Pollution.inits,
    pop_tables = WorldDynamics.World3.Pop4.tables,
    capital_tables = WorldDynamics.World3.Capital.tables,
    agriculture_tables = WorldDynamics.World3.Agriculture.tables,
    nonrenewable_tables = WorldDynamics.World3.NonRenewable.tables,
    pollution_tables = WorldDynamics.World3.Pollution.tables,
    pop_ranges = WorldDynamics.World3.Pop4.ranges,
    capital_ranges = WorldDynamics.World3.Capital.ranges,
    agriculture_ranges = WorldDynamics.World3.Agriculture.ranges,
    nonrenewable_ranges = WorldDynamics.World3.NonRenewable.ranges,
    pollution_ranges = WorldDynamics.World3.Pollution.ranges,
)
    @named pop = WorldDynamics.World3.Pop4.population(; params=pop_params, inits=pop_inits, tables=pop_tables, ranges=pop_ranges)
    @named dr = WorldDynamics.World3.Pop4.death_rate(; params=pop_params, inits=pop_inits, tables=pop_tables, ranges=pop_ranges)
    @named br = WorldDynamics.World3.Pop4.birth_rate(; params=pop_params, inits=pop_inits, tables=pop_tables, ranges=pop_ranges)

    @named is = WorldDynamics.World3.Capital.industrial_subsector(; params=capital_params, inits=capital_inits, tables=capital_tables, ranges=capital_ranges)
    @named ss = WorldDynamics.World3.Capital.service_subsector(; params=capital_params, inits=capital_inits, tables=capital_tables, ranges=capital_ranges)
    @named js = WorldDynamics.World3.Capital.job_subsector(; params=capital_params, inits=capital_inits, tables=capital_tables, ranges=capital_ranges)

    @named ld = WorldDynamics.World3.Agriculture.land_development(; params=agriculture_params, inits=agriculture_inits, tables=agriculture_tables, ranges=agriculture_ranges)
    @named ai = WorldDynamics.World3.Agriculture.agricultural_inputs(; params=agriculture_params, inits=agriculture_inits, tables=agriculture_tables, ranges=agriculture_ranges)
    @named iad = WorldDynamics.World3.Agriculture.investment_allocation_decision(; params=agriculture_params, inits=agriculture_inits, tables=agriculture_tables, ranges=agriculture_ranges)
    @named leuiu = WorldDynamics.World3.Agriculture.land_erosion_urban_industrial_use(; params=agriculture_params, inits=agriculture_inits, tables=agriculture_tables, ranges=agriculture_ranges)
    @named dlm = WorldDynamics.World3.Agriculture.discontinung_land_maintenance(; params=agriculture_params, inits=agriculture_inits, tables=agriculture_tables, ranges=agriculture_ranges)
    @named lfr = WorldDynamics.World3.Agriculture.land_fertility_regeneration(; params=agriculture_params, inits=agriculture_inits, tables=agriculture_tables, ranges=agriculture_ranges)
    @named lfd = WorldDynamics.World3.Agriculture.land_fertility_degradation(; params=agriculture_params, inits=agriculture_inits, tables=agriculture_tables, ranges=agriculture_ranges)

    @named nr = WorldDynamics.World3.NonRenewable.non_renewable(; params=nonrenewable_params, inits=nonrenewable_inits, tables=nonrenewable_tables, ranges=nonrenewable_ranges)

    @named pp = WorldDynamics.World3.Pollution.persistent_pollution(; params=pollution_params, inits=pollution_inits, tables=pollution_tables, ranges=pollution_ranges)
    @named pd = WorldDynamics.World3.Pollution.pollution_damage(; params=pollution_params, inits=pollution_inits, tables=pollution_tables, ranges=pollution_ranges)
    @named atcc = WorldDynamics.World3.Pollution.adaptive_technological_control_cards(; params=pollution_params, inits=pollution_inits, tables=pollution_tables, ranges=pollution_ranges)

    @named se = WorldDynamics.World3.SupplementaryEquations.supplementary_equations()


    systems = [
        pop, dr, br,
        is, ss, js,
        ld, ai, iad, leuiu, dlm, lfr, lfd,
        nr,
        pp, pd, atcc,
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
        pd.ppolx ~ pp.ppolx
        atcc.lmp ~ pd.lmp
        pp.ppgf22 ~ atcc.ppgf22
        pp.pcrum ~ nr.pcrum
        pp.pop ~ pop.pop
        pp.aiph ~ ai.aiph
        pp.al ~ ld.al
        # supplementary eqs
        se.f ~ ld.f
        se.so ~ ss.so
        se.io ~ is.io
    ]

    return WorldDynamics.compose(systems, connection_eqs)
end