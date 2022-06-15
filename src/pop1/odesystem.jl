using Interpolations, ModelingToolkit, DifferentialEquations

include("../functions.jl")
include("../common_pop/tables.jl")
include("../common_pop/parameters.jl")
include("../common_pop/initialisations.jl")
include("../common_pop/odesystem.jl")


function Pop1(; name)
    @parameters ffw = ffwv rlt = rltv pet = petv

    @variables le(t) tf(t)
    @variables pop(t) = pop0
    @variables dr(t) br(t)

    eqs = [
        D(pop) ~ br - dr,
        dr ~ pop / le,
        br ~ clip(dr, tf * pop * ffw / rlt, t, pet)
    ]

    ODESystem(eqs; name)
end


@named pop = Pop1()

connection_eqs = [
    pop.le ~ dr.le
    pop.tf ~ br.tf
    # common pop
    dr.dr ~ pop.dr
    dr.pop ~ pop.pop
    br.br ~ pop.br
    br.pop ~ pop.pop
    io.pop ~ pop.pop
    so.pop ~ pop.pop
    f.pop ~ pop.pop
]

connection_eqs = vcat(connection_eqs, common_connection_eqs)

@named _pop_model = ODESystem(connection_eqs, t)
@named pop_model = compose(_pop_model, [pop, dr, br, io, so, pp, f])

pop_sys = structural_simplify(pop_model)

prob = ODEProblem(pop_sys, [], (1900.0, 1970.0))
sol = solve(prob, Tsit5())


using PlotlyJS

function plot_sol_2_84(sol)
    traces = GenericTrace[]
    push!(traces, scatter(x=sol[t], y=sol[pop.pop], name="pop", yaxis="y1"))
    push!(traces, scatter(x=sol[t], y=sol[br.cbr],  name="cbr", yaxis="y2"))
    push!(traces, scatter(x=sol[t], y=sol[dr.cdr],  name="cdr", yaxis="y3"))
    push!(traces, scatter(x=sol[t], y=sol[so.sopc], name="sopc", yaxis="y4"))
    push!(traces, scatter(x=sol[t], y=sol[dr.fpu],  name="fpu", yaxis="y5"))
    push!(traces, scatter(x=sol[t], y=sol[f.fpc],   name="fpc", yaxis="y6"))
    push!(traces, scatter(x=sol[t], y=sol[dr.le],   name="le", yaxis="y7"))
    push!(traces, scatter(x=sol[t], y=sol[br.fce],  name="fce", yaxis="y8"))
    push!(traces, scatter(x=sol[t], y=sol[io.iopc], name="iopc", yaxis="y9"))
    plot(traces,
        Layout(xaxis_domain=[0.3, 0.7],
            yaxis =attr(title="pop", range=[0, 1.6e10]),
            yaxis2=attr(title="cbr", overlaying="y", side="right", position=0.70, range=[0, 50]),
            yaxis3=attr(title="cdr", overlaying="y", side="right", position=0.74, range=[0, 50]),
            yaxis4=attr(title="sopc", overlaying="y", side="right", position=0.78, range=[0, 1000]),
            yaxis5=attr(title="fpu", overlaying="y", side="right", position=0.82, range=[0, 1]),
            yaxis6=attr(title="fpc", overlaying="y", side="right", position=0.86, range=[0, 1000]),
            yaxis7=attr(title="le", overlaying="y", side="right", position=0.9, range=[0, 80]),
            yaxis8=attr(title="fce", overlaying="y", side="right", position=0.94, range=[0.5, 1]),
            yaxis9=attr(title="iopc", overlaying="y", side="right", position=0.98, range=[0, 1000])
        )
    )
end
