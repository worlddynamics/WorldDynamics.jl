include("../../src/Pop4.jl")
include("../../src/Capital.jl")
include("../../src/Agriculture.jl")
include("../../src/NonRenewable.jl")
include("../../src/Pollution.jl")
include("../../src/World3.jl")
include("../../src/solvesystems.jl")


function solveworld3()
    @named pop = Pop4.population()
    @named dr = Pop4.death_rate()
    @named br = Pop4.birth_rate()

    @named is = Capital.industrial_subsector()
    @named ss = Capital.service_subsector()
    @named js = Capital.job_subsector()

    @named ld = Agriculture.land_development()
    @named ai = Agriculture.agricultural_inputs()
    @named iad = Agriculture.investment_allocation_decision()
    @named leuiu = Agriculture.land_erosion_urban_industrial_use()
    @named dlm = Agriculture.discontinung_land_maintenance()
    @named lfr = Agriculture.land_fertility_regeneration()
    @named lfd = Agriculture.land_fertility_degradation()

    @named nr = NonRenewable.non_renewable()

    @named pp = Pollution.persistent_pollution()
    @named pd = Pollution.pollution_damage()
    @named atcc = Pollution.adaptive_technological_control_cards()

    @named se = World3.supplementary_eqs()


    systems = [
        pop, dr, br, 
        is, ss, js, 
        ld, ai, iad, leuiu, dlm, lfr, lfd, 
        nr, 
        pp, pd, atcc, 
        se
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

    return solvesystems(systems, connection_eqs, (1900.0, 2100.0))
end