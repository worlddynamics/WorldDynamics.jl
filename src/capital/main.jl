using Interpolations, ModelingToolkit, DifferentialEquations

include("odesystem.jl")
using .Capital


@named pop = Capital.population()
@named nr = Capital.non_renewable()
@named ag = Capital.agriculture()
@named is = industrial_subsector()
@named ss = service_subsector()
@named js = job_subsector()

t = Capital.t


connection_eqs = [
    is.pop ~ pop.pop
    is.fcaor ~ nr.fcaor
    is.cuf ~ js.cuf
    is.fioaa ~ ag.fioaa
    is.fioas ~ ss.fioas
    ss.iopc ~ is.iopc
    ss.io ~ is.io
    ss.cuf ~ js.cuf
    ss.pop ~ pop.pop
    js.ic ~ is.ic
    js.iopc ~ is.iopc
    js.sc ~ ss.sc
    js.sopc ~ ss.sopc
    js.al ~ ag.al
    js.aiph ~ ag.aiph
    js.p2 ~ pop.p2
    js.p3 ~ pop.p3
]

@named _cap_model = ODESystem(connection_eqs, t)
@named cap_model = compose(_cap_model, [pop, nr, ag, is, ss, js])

cap_sys = structural_simplify(cap_model)

prob = ODEProblem(cap_sys, [], (1900, 2000.0))
sol = solve(prob, Tsit5())


using PlotlyJS

function plot_sol_3_36(sol)
    traces = GenericTrace[]
    push!(traces, scatter(x=sol[t], y=sol[pop.pop],  name="pop",   yaxis="y1"))
    push!(traces, scatter(x=sol[t], y=sol[ag.al],    name="al",    yaxis="y2"))
    push!(traces, scatter(x=sol[t], y=sol[ag.fioaa], name="fioaa", yaxis="y3"))
    push!(traces, scatter(x=sol[t], y=sol[nr.fcaor], name="fcaor", yaxis="y4"))
    push!(traces, scatter(x=sol[t], y=sol[ag.aiph],  name="aiph",  yaxis="y5"))
    plot(traces,
        Layout(xaxis_domain=[0.3, 0.7],
            yaxis  = attr(title="pop", range=[0, 5e9]),
            yaxis2 = attr(title="al",    overlaying="y", side="right", position=0.70, range=[0, 1.5e9]),
            yaxis3 = attr(title="fioaa", overlaying="y", side="right", position=0.74, range=[0, 0.5]),
            yaxis4 = attr(title="fcaor", overlaying="y", side="right", position=0.78, range=[0, 0.25]),
            yaxis5 = attr(title="aiph",  overlaying="y", side="right", position=0.82, range=[0, 50])
        )
    )
end

function plot_sol_3_37(sol)
    traces = GenericTrace[]
    push!(traces, scatter(x=sol[t], y=sol[is.iopc],  name="iopc",  yaxis="y1"))
    push!(traces, scatter(x=sol[t], y=sol[ss.sopc],  name="sopc",  yaxis="y2"))
    push!(traces, scatter(x=sol[t], y=sol[is.io],    name="io",    yaxis="y3"))
    push!(traces, scatter(x=sol[t], y=sol[ss.fioas], name="fioas", yaxis="y4"))
    push!(traces, scatter(x=sol[t], y=sol[js.cuf],   name="cuf",   yaxis="y5"))
    plot(traces,
        Layout(xaxis_domain=[0.3, 0.7],
            yaxis  = attr(title="iopc", range=[0, 1000]),
            yaxis2 = attr(title="sopc",  overlaying="y", side="right", position=0.70, range=[0, 1000]),
            yaxis3 = attr(title="io",    overlaying="y", side="right", position=0.74, range=[0, 4e12]),
            yaxis4 = attr(title="fioas", overlaying="y", side="right", position=0.78, range=[0, 0.4]),
            yaxis5 = attr(title="cuf",   overlaying="y", side="right", position=0.82, range=[0, 1])
        )
    )
end
