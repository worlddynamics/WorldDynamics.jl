using WorldDynamics
using ModelingToolkit

function world3_historicalrun(;
    pop_params=WorldDynamics.World3.Pop4.params,
    capital_params=WorldDynamics.World3.Capital.params,
    agriculture_params=WorldDynamics.World3.Agriculture.params,
    nonrenewable_params=WorldDynamics.World3.NonRenewable.params,
    pollution_params=WorldDynamics.World3.Pollution.params,
)
    @named pop = WorldDynamics.World3.Pop4.population(; params=pop_params)
    @named dr = WorldDynamics.World3.Pop4.death_rate(; params=pop_params)
    @named br = WorldDynamics.World3.Pop4.birth_rate(; params=pop_params)

    @named is = WorldDynamics.World3.Capital.industrial_subsector(; params=capital_params)
    @named ss = WorldDynamics.World3.Capital.service_subsector(; params=capital_params)
    @named js = WorldDynamics.World3.Capital.job_subsector(; params=capital_params)

    @named ld = WorldDynamics.World3.Agriculture.land_development(; params=agriculture_params)
    @named ai = WorldDynamics.World3.Agriculture.agricultural_inputs(; params=agriculture_params)
    @named iad = WorldDynamics.World3.Agriculture.investment_allocation_decision(; params=agriculture_params)
    @named leuiu = WorldDynamics.World3.Agriculture.land_erosion_urban_industrial_use(; params=agriculture_params)
    @named dlm = WorldDynamics.World3.Agriculture.discontinung_land_maintenance(; params=agriculture_params)
    @named lfr = WorldDynamics.World3.Agriculture.land_fertility_regeneration(; params=agriculture_params)
    @named lfd = WorldDynamics.World3.Agriculture.land_fertility_degradation(; params=agriculture_params)

    @named nr = WorldDynamics.World3.NonRenewable.non_renewable(; params=nonrenewable_params)

    @named pp = WorldDynamics.World3.Pollution.persistent_pollution(; params=pollution_params)
    @named pd = WorldDynamics.World3.Pollution.pollution_damage(; params=pollution_params)
    @named atcc = WorldDynamics.World3.Pollution.adaptive_technological_control_cards(; params=pollution_params)

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

    return WorldDynamics.solvesystems(systems, connection_eqs, (1900.0, 2100.0))
end
