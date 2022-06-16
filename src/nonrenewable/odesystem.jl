using ModelingToolkit, DifferentialEquations

include("NonRenewable.jl")


@named pop = NonRenewable.population()
@named io = NonRenewable.industrial_output()
@named ic = NonRenewable.industrial_capital()
@named nr = NonRenewable.non_renewable()


connection_eqs = [
    nr.pop ~ pop.pop
    nr.iopc ~ io.iopc
    io.ic ~ ic.ic
    io.fcaor ~ nr.fcaor
    io.pop ~ pop.pop
    ic.io ~ io.io
]


@variables t

@named _nr_model = ODESystem(connection_eqs, t)
@named nr_model = compose(_nr_model, [nr, pop, io, ic])

nr_sys = structural_simplify(nr_model)

prob = ODEProblem(nr_sys, [], (1900, 2100.0))
sol = solve(prob, Tsit5())


using PlotlyJS

function plot_sol_5_25(sol)
    traces = GenericTrace[]
    push!(traces, scatter(x=sol[t], y=sol[nr.nrfr],  name="nrfr",  yaxis="y1"))
    push!(traces, scatter(x=sol[t], y=sol[nr.fcaor], name="fcaor", yaxis="y2"))
    push!(traces, scatter(x=sol[t], y=sol[ic.ic],    name="ic",    yaxis="y3"))
    push!(traces, scatter(x=sol[t], y=sol[io.io],    name="io",    yaxis="y4"))
    push!(traces, scatter(x=sol[t], y=sol[pop.pop],  name="pop",   yaxis="y5"))
    plot(traces,
        Layout(xaxis_domain=[0.3, 0.7],
            yaxis  = attr(title="nrfr", range=[0, 1]),
            yaxis2 = attr(title="fcaor", overlaying="y", side="right", position=0.70, range=[0, 1]),
            yaxis3 = attr(title="ic",    overlaying="y", side="right", position=0.74, range=[0, 40e12]),
            yaxis4 = attr(title="io",    overlaying="y", side="right", position=0.78, range=[0, 10e12]),
            yaxis5 = attr(title="pop",   overlaying="y", side="right", position=0.82, range=[0, 16e9]),
        )
    )
end
