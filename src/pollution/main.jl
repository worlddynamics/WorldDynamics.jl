using ModelingToolkit, DifferentialEquations

include("odesystem.jl")


@named pop = Pollution.population()
@named nr = Pollution.non_renewable()
@named ag = Pollution.agriculture()
@named pd = Pollution.pollution_damage()
@named atcc = Pollution.adaptive_technological_control_cards()
@named pp = Pollution.persistent_pollution()


connection_eqs = [
    pd.ppolx ~ pp.ppolx
    atcc.lmp ~ pd.lmp
    pp.ppgf22 ~ atcc.ppgf22
    pp.pcrum ~ nr.pcrum
    pp.pop ~ pop.pop
    pp.aiph ~ ag.aiph
    pp.al ~ ag.al
]


@variables t

@named _pp_model = ODESystem(connection_eqs, t)
@named pp_model = compose(_pp_model, [pop, nr, ag, pd, atcc, pp])

pp_sys = structural_simplify(pp_model)

prob = ODEProblem(pp_sys, [], (1900.0, 1970.0))
sol = solve(prob, Tsit5())


using PlotlyJS

function plot_sol_6_28(sol)
    traces = GenericTrace[]
    push!(traces, scatter(x=sol[t], y=sol[nr.pcrum], name="pcrum", yaxis="y1"))
    push!(traces, scatter(x=sol[t], y=sol[pop.pop],  name="pop",   yaxis="y2"))
    push!(traces, scatter(x=sol[t], y=sol[ag.al],    name="al",    yaxis="y3"))
    push!(traces, scatter(x=sol[t], y=sol[ag.aiph],  name="aiph",  yaxis="y4"))
    push!(traces, scatter(x=sol[t], y=sol[pp.ppgr],  name="ppgr",  yaxis="y5"))
    plot(traces,
        Layout(xaxis_domain=[0.1, 0.7],
            yaxis  = attr(title="pcrum", range=[0, 1]),
            yaxis2 = attr(title="pop",  overlaying="y", side="right", position=0.70, range=[0, 4e9]),
            yaxis3 = attr(title="al",   overlaying="y", side="right", position=0.74, range=[0, 2e9]),
            yaxis4 = attr(title="aiph", overlaying="y", side="right", position=0.78, range=[0, 50]),
            yaxis5 = attr(title="ppgr", overlaying="y", side="right", position=0.82, range=[0, 2e8]),
        )
    )
end

function plot_sol_6_29(sol)
    traces = GenericTrace[]
    push!(traces, scatter(x=sol[t], y=sol[pp.ppgr],  name="ppgr",  yaxis="y1"))
    push!(traces, scatter(x=sol[t], y=sol[pp.ppapr], name="ppapr", yaxis="y2"))
    push!(traces, scatter(x=sol[t], y=sol[pp.ppasr], name="ppasr", yaxis="y3"))
    push!(traces, scatter(x=sol[t], y=sol[pp.ppolx], name="ppolx", yaxis="y4"))
    push!(traces, scatter(x=sol[t], y=sol[pp.ahl],   name="ahl",   yaxis="y5"))
    push!(traces, scatter(x=sol[t], y=sol[pd.lmp],   name="lmp",   yaxis="y6"))
    push!(traces, scatter(x=sol[t], y=sol[pd.lfdr],  name="lfdr",  yaxis="y7"))
    plot(traces,
        Layout(xaxis_domain=[0.1, 0.7],
            yaxis  = attr(title="ppgr", range=[0, 2e8]),
            yaxis2 = attr(title="ppapr", overlaying="y", side="right", position=0.70, range=[0, 2e8]),
            yaxis3 = attr(title="ppasr", overlaying="y", side="right", position=0.74, range=[0, 2e8]),
            yaxis4 = attr(title="ppolx", overlaying="y", side="right", position=0.78, range=[0, 1]),
            yaxis5 = attr(title="ahl",   overlaying="y", side="right", position=0.82, range=[0, 2]),
            yaxis6 = attr(title="lmp",   overlaying="y", side="right", position=0.86, range=[0, 1]),
            yaxis7 = attr(title="lfdr",  overlaying="y", side="right", position=0.90, range=[0, 0.5]),
        )
    )
end
