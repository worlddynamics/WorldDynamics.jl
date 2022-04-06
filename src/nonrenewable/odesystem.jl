# Parameter declarations
@parameters nri, nruf1, nruf2, popi, gc, pop2, zpgt
@parameters fioaa, fioas, fioac, alic, icor, pyear
@variables t
@variables nr(t) nrur(t) nruf(t) pcrum(t) nrfr(t) fcaor(t) fcaor1(t) fcaor2(t)
@variables pop(t) pop1(t) ic(t) icir(t) icdr(t) io(t) iopc(t)
D = Differential(t)
# Registered functions used in equations
@register interpolate(x, y::NTuple, xs::Tuple)
@register clip(f1, f2, va, th)
@register min(v1, v2)
@register max(v1, v2)
@register step(t, hght, sttm)

global eqs = [
    D(nr) ~ -nrur
    nrur ~ pop * pcrum * nruf
    nruf ~ clip(nruf2, nruf1, t, pyear)
    pcrum ~ interpolate(iopc, pcrumt, pcrumts)
    nrfr ~ nr / nri
    fcaor ~ clip(fcaor2, fcaor1, t, pyear)
    fcaor1 ~ interpolate(nrfr, fcaor1t, fcaor1ts)
    fcaor2 ~ interpolate(nrfr, fcaor2t, fcaor2ts)
    # POPULATION
    pop ~ clip(pop2, pop1, t, zpgt)
    pop1 ~ popi * exp(gc * (t - 1900))
    # INDUSTRIAL CAPITAL
    D(ic) ~ icir - icdr
    icir ~ io * (1 - fioaa - fioas - fioac)
    icdr ~ ic / alic
    # INDUSTRIAL OUTPUT
    io ~ ic * (1 - fcaor) / icor
    iopc ~ io / pop
]
# Parameter values
global p = [
    nri => nriv, nruf1 => nruf1v, nruf2 => nruf2v, popi => popiv, gc => gcv, pop2 => pop2v,
    zpgt => zpgtv, fioaa => fioaav, fioas => fioasv, fioac => fioacv,
    alic => alicv, icor => icorv, pyear => pyearv
]
# Initializations
global u0 = [
    nr => nr0, ic => ic0
]
# ODE solution plot
function plot_sol_5_25(sol)
    traces = GenericTrace[]
    push!(traces, scatter(x=sol[t], y=sol[nrfr], name="nrfr", yaxis="y1"))
    push!(traces, scatter(x=sol[t], y=sol[fcaor], name="fcaor", yaxis="y2"))
    push!(traces, scatter(x=sol[t], y=sol[ic], name="ic", yaxis="y3"))
    push!(traces, scatter(x=sol[t], y=sol[io], name="io", yaxis="y4"))
    push!(traces, scatter(x=sol[t], y=sol[pop], name="pop", yaxis="y5"))
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
