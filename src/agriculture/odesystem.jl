using ModelingToolkit, DifferentialEquations

include("Agriculture.jl")


@named pop = Agriculture.population()
@named io = Agriculture.industrial_output()
@named pp = Agriculture.persistent_pollution()
@named ld = Agriculture.land_development()
@named ai = Agriculture.agricultural_inputs()
@named iad = Agriculture.investment_allocation_decision()
@named leuiu = Agriculture.land_erosion_urban_industrial_use()
@named dlm = Agriculture.discontinung_land_maintenance()
@named lfr = Agriculture.land_fertility_regeneration()
@named lfd = Agriculture.land_fertility_degradation()


connection_eqs = [
    ld.ler ~ leuiu.ler
    ld.lrui ~ leuiu.lrui
    ld.ly ~ ai.ly
    ld.pop ~ pop.pop
    ld.iopc ~ io.iopc
    ld.io ~ io.io
    ld.fiald ~ iad.fiald
    ai.tai ~ ld.tai
    ai.fiald ~ iad.fiald
    ai.falm ~ dlm.falm
    ai.al ~ ld.al
    ai.lfert ~ lfd.lfert
    ai.io ~ io.io
    iad.ly ~ ai.ly
    iad.dcph ~ ld.dcph
    iad.alai ~ ai.alai
    iad.lymc ~ ai.lymc
    iad.aiph ~ ai.aiph
    leuiu.ly ~ ai.ly
    leuiu.al ~ ld.al
    leuiu.iopc ~ io.iopc
    leuiu.pop ~ pop.pop
    dlm.fpc ~ ld.fpc
    lfr.lfert ~ lfd.lfert
    lfr.falm ~ dlm.falm
    lfd.lfr ~ lfr.lfr
    lfd.ppolx ~ pp.ppolx
    io.pop ~ pop.pop
]


@variables t

@named _ag_model = ODESystem(connection_eqs, t)
@named ag_model = compose(_ag_model, [pop, io, pp, ld, ai, iad, leuiu, dlm, lfr, lfd])

ag_sys = structural_simplify(ag_model)

prob = ODEProblem(ag_sys, [], (1900.0, 1970.0))
sol = solve(prob, Tsit5())


using PlotlyJS

function plot_sol_4_69(sol)
    traces = GenericTrace[]
    push!(traces, scatter(x=sol[t], y=sol[ld.al],      name="al",   yaxis="y1"))
    push!(traces, scatter(x=sol[t], y=sol[ld.pal],     name="pal",  yaxis="y2"))
    push!(traces, scatter(x=sol[t], y=sol[leuiu.ler],  name="ler",  yaxis="y3"))
    push!(traces, scatter(x=sol[t], y=sol[ld.ldr],     name="ldr",  yaxis="y4"))
    push!(traces, scatter(x=sol[t], y=sol[leuiu.lrui], name="lrui", yaxis="y5"))
    push!(traces, scatter(x=sol[t], y=sol[ld.dcph],    name="dcph", yaxis="y6"))
    plot(traces,
        Layout(xaxis_domain=[0.3, 0.7],
            yaxis  = attr(title="al", range=[0, 4e9]),
            yaxis2 = attr(title="pal",  overlaying="y", side="right", position=0.70, range=[0, 4e9]),
            yaxis3 = attr(title="ler",  overlaying="y", side="right", position=0.74, range=[0, 40e6]),
            yaxis4 = attr(title="ldr",  overlaying="y", side="right", position=0.78, range=[0, 40e6]),
            yaxis5 = attr(title="lrui", overlaying="y", side="right", position=0.82, range=[0, 40e6]),
            yaxis6 = attr(title="dcph", overlaying="y", side="right", position=0.86, range=[0, 10000])
        )
    )
end
