using Interpolations, ModelingToolkit, DifferentialEquations

@variables t
D = Differential(t)

#include("src/functions.jl")
include("src/functions.jl")
include("src/nonrenewable/tables.jl")
include("src/nonrenewable/initialisations.jl")
include("src/nonrenewable/parameters.jl")

# Registered functions used in equations
@register interpolate(x, y::NTuple, xs::Tuple)
@register clip(f1, f2, va, th)
@register min(v1, v2)
@register max(v1, v2)
@register step(t, hght, sttm)

function Population(; name)
    @parameters gc, pop2, popi, zpgt
    @variables pop(t), pop1(t)
    eqs = [
        pop ~ clip(pop2, pop1, t, zpgt)
        pop1 ~ popi * exp(gc * (t - 1900))
    ]
    ODESystem(eqs; name)
end

function Industrial_Output(; name)
    @parameters icor
    @variables ic(t) io(t) iopc(t) fcaor(t) pop(t)
    eqs = [
        io ~ ic * (1 - fcaor) / icor
        iopc ~ io / pop
    ]
    ODESystem(eqs; name)
end

function Industrial_Capital(; name)
    @parameters fioaa, fioas, fioac, alic
    @variables ic(t) icir(t) icdr(t) io(t)
    eqs = [
        D(ic) ~ icir - icdr
        icir ~ io * (1 - fioaa - fioas - fioac)
        icdr ~ ic / alic
    ]
    ODESystem(eqs; name)
end

function Non_Renewable(; name)
    @parameters nri, nruf1, nruf2, pyear
    @variables fcaor(t) fcaor1(t) fcaor2(t) iopc(t) nr(t) nrur(t) nruf(t) nrfr(t) pop(t) pcrum(t)
    eqs = [
        D(nr) ~ -nrur
        nrur ~ pop * pcrum * nruf
        nruf ~ clip(nruf2, nruf1, t, pyear)
        pcrum ~ interpolate(iopc, pcrumt, pcrumts)
        nrfr ~ nr / nri
        fcaor ~ clip(fcaor2, fcaor1, t, pyear)
        fcaor1 ~ interpolate(nrfr, fcaor1t, fcaor1ts)
        fcaor2 ~ interpolate(nrfr, fcaor2t, fcaor2ts)
    ]
    ODESystem(eqs; name)
end

@named pop = Population()
@named io = Industrial_Output()
@named ic = Industrial_Capital()
@named nr = Non_Renewable()

connection_eqs = [
    nr.pop ~ pop.pop,
    nr.iopc ~ io.iopc,
    nr.fcaor ~ io.fcaor,
    io.ic ~ ic.ic,
    io.pop ~ pop.pop,
    ic.io ~ io.io
]

@named _nr_model = ODESystem(connection_eqs, t)
@named nr_model = compose(_nr_model, [nr, pop, io, ic])

nr_sys = structural_simplify(nr_model)

u0 = [
    nr.nr => nr0, ic.ic => ic0
]

p_nr = [
    nr.nri => nriv,
    nr.nruf1 => nruf1v,
    nr.nruf2 => nruf2v,
    nr.pyear => pyearv,
]
p_pop = [
    pop.popi => popiv,
    pop.gc => gcv,
    pop.pop2 => pop2v,
    pop.zpgt => zpgtv,
]
p_io = [
    io.icor => icorv
]
p_ic = [
    ic.fioaa => fioaav,
    ic.fioas => fioasv,
    ic.fioac => fioacv,
    ic.alic => alicv,
]
p = [p_nr..., p_pop..., p_io..., p_ic...]

prob = ODEProblem(nr_sys, u0, (1900, 2100.0), p)
sol = solve(prob, Tsit5())

using PlotlyJS
# ODE solution plot
function plot_sol_5_25(sol)
    traces = GenericTrace[]
    push!(traces, scatter(x=sol[t], y=sol[nr.nrfr], name="nrfr", yaxis="y1"))
    push!(traces, scatter(x=sol[t], y=sol[nr.fcaor], name="fcaor", yaxis="y2"))
    push!(traces, scatter(x=sol[t], y=sol[ic.ic], name="ic", yaxis="y3"))
    push!(traces, scatter(x=sol[t], y=sol[io.io], name="io", yaxis="y4"))
    push!(traces, scatter(x=sol[t], y=sol[pop.pop], name="pop", yaxis="y5"))
    plot(traces,
        Layout(xaxis_domain=[0.3, 0.7],
            yaxis=attr(title="nrfr", range=[0, 1]),
            yaxis2=attr(title="fcaor", overlaying="y", side="right", position=0.70, range=[0, 1]),
            yaxis3=attr(title="ic", overlaying="y", side="right", position=0.74, range=[0, 40e12]),
            yaxis4=attr(title="io", overlaying="y", side="right", position=0.78, range=[0, 10e12]),
            yaxis5=attr(title="pop", overlaying="y", side="right", position=0.82, range=[0, 16e9]),
        )
    )
end
