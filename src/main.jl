using ModelingToolkit, DifferentialEquations


include("common_pop/odesystem.jl")
include("pop4/odesystem.jl")
include("capital/odesystem.jl")
include("agriculture/odesystem.jl")
include("nonrenewable/odesystem.jl")
include("pollution/odesystem.jl")
include("odesystem.jl")


@named pop = Pop4.population()
@named dr = CommonPop.death_rate()
@named br = CommonPop.birth_rate()

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


@variables t

@named _world3_model = ODESystem(connection_eqs, t)
@named world3_model = compose(_world3_model, [pop, dr, br, is, ss, js, ld, ai, iad, leuiu, dlm, lfr, lfd, nr, pp, pd, atcc, se])

world3_sys = structural_simplify(world3_model)

prob = ODEProblem(world3_sys, [], (1900, 2100.0))
sol = solve(prob, Tsit5())


using PlotlyJS

function plot_sol_7_7(sol)
    traces = GenericTrace[]
    push!(traces, scatter(x=sol[t], y=sol[nr.nrfr],  name="nrfr",  yaxis="y1"))
    push!(traces, scatter(x=sol[t], y=sol[is.iopc],  name="iopc",  yaxis="y2"))
    push!(traces, scatter(x=sol[t], y=sol[ld.fpc],   name="fpc",   yaxis="y3"))
    push!(traces, scatter(x=sol[t], y=sol[pop.pop],  name="pop",   yaxis="y4"))
    push!(traces, scatter(x=sol[t], y=sol[pp.ppolx], name="ppolx", yaxis="y5"))
    push!(traces, scatter(x=sol[t], y=sol[br.cbr],   name="cbr",   yaxis="y6"))
    push!(traces, scatter(x=sol[t], y=sol[dr.cdr],   name="cdr",   yaxis="y7"))
    plot(traces,
        Layout(xaxis_domain=[0.1, 0.7],
            yaxis  = attr(title="nrfr", range=[0, 1]),
            yaxis2 = attr(title="iopc",  overlaying="y", side="right", position=0.70, range=[0, 1000]),
            yaxis3 = attr(title="fpc",   overlaying="y", side="right", position=0.74, range=[0, 1000]),
            yaxis4 = attr(title="pop",   overlaying="y", side="right", position=0.78, range=[0, 16e9]),
            yaxis5 = attr(title="ppolx", overlaying="y", side="right", position=0.82, range=[0, 32]),
            yaxis6 = attr(title="cbr",   overlaying="y", side="right", position=0.86, range=[0, 50]),
            yaxis7 = attr(title="cdr",   overlaying="y", side="right", position=0.90, range=[0, 50]),
        )
    )
end
