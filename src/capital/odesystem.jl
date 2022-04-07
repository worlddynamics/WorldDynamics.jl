# Parameter declarations
# @parameters len sfpc hsid iphst ffw rlt pet mtfn lpd zpgt dcfsn sad ieat fcest lt lt2 cio ps pt cso cfood
@parameters pyear, icor1, icor2, alic1, alic2, iet, iopcd, fioac1, fioac2
@parameters alsc1, alsc2, scor1, scor2, lfpf, lufdt
# Function declarations
@variables t
@variables io(t)
# CAPITAL SECTOR
@variables lufd(t) iopc(t) ic(t) fcaor(t) cuf(t) icor(t) alic(t) fioai(t)
@variables fioaa(t) fioas(t) fioac(t) fioas2(t) fioas1(t)
@variables sopc(t) so(t) isopc(t) isopc1(t) isopc2(t) fioac(t) fioacv(t) fioacc(t)
@variables icir(t) icdr(t) scir(t) sc(t) scdr(t) alsc(t) cuf(t) scor(t)
@variables j(t) pjis(t) pjas(t) pjss(t) jpicu(t) jph(t) al(t) aiph(t)
@variables jpscu(t) lf(t) pop(t) p2(t) p3(t) luf(t)
D = Differential(t)
# Registered functions used in equations
@register interpolate(x, y::NTuple, xs::Tuple)
@register clip(f1, f2, va, th)
@register min(v1, v2)
@register step(t, hght, sttm)

global eqs = [
    # INDUSTRIAL OUTPUT
    iopc ~ io / pop,
    # SERVICE OUTPUT
    sopc ~ so / pop,
    # CAPITAL SECTOR
    io ~ ic * (1 - fcaor) * cuf / icor,
    fcaor ~ interpolate(t, fcaort, fcaorts),
    icor ~ clip(icor2, icor1, t, pyear),
    D(ic) ~ icir - icdr,
    icdr ~ ic / alic,
    alic ~ clip(alic2, alic1, t, pyear),
    icir ~ io * fioai,
    fioai ~ 1 - fioaa - fioas - fioac,
    fioaa ~ interpolate(t, fioaat, fioaats),
    fioas ~ clip(fioas2, fioas1, t, pyear),
    fioas1 ~ interpolate(sopc / isopc, fioas1t, fioas1ts),
    fioas2 ~ interpolate(sopc / isopc, fioas2t, fioas2ts),
    isopc ~ clip(isopc2, isopc1, t, pyear),
    isopc1 ~ interpolate(iopc, isopc1t, isopc1ts),
    isopc2 ~ interpolate(iopc, isopc2t, isopc2ts),
    fioac ~ clip(fioacv, fioacc, t, iet),
    fioacv ~ interpolate(iopc / iopcd, fioacvt, fioacvts),
    fioacc ~ clip(fioac2, fioac1, t, pyear),
    scir ~ io * fioas,
    D(sc) ~ scir - scdr,
    scdr ~ sc / alsc,
    alsc ~ clip(alsc2, alsc1, t, pyear),
    # SERVICE SUBSECTOR
    so ~ sc * cuf / scor,
    cuf ~ interpolate(lufd, cuft, cufts),
    scor ~ clip(scor2, scor1, t, pyear),
    # JOB SUBSECTOR
    j ~ pjis + pjas + pjss,
    pjis ~ ic * jpicu,
    jpicu ~ interpolate(iopc, jpicut, jpicuts) * (1e-3),
    pjas ~ jph * al,
    jph ~ interpolate(aiph, jpht, jphts),
    aiph ~ interpolate(t, aipht, aiphts),
    al ~ interpolate(t, alt, alts) * (1e8),
    pjss ~ sc * jpscu,
    jpscu ~ interpolate(sopc, jpscut, jpscuts) * (1e-3),
    lf ~ (p2 + p3) * lfpf,
    p2 ~ 0.25 * pop,
    p3 ~ 0.25 * pop,
    pop ~ interpolate(t, popt, popts) * (1e9),
    luf ~ j / lf,
    D(lufd) ~ (luf - lufd) / lufdt
]
# Parameter values
global p = [
    pyear => pyearv, icor1 => icor1v, icor2 => icor2v, alic1 => alic1v, alic2 => alic2v,
    iet => ietv, iopcd => iopcdv, fioac1 => fioac1v, fioac2 => fioac2v,
    alsc1 => alsc1v, alsc2 => alsc2v, scor1 => scor1v, scor2 => scor2v,
    lfpf => lfpfv, lufdt => lufdtv
]
# Initializations
global u0 = [
    pop => pop0,
    # CAPITAL SECTOR
    ic => ic0,
    sc => sc0,
    # SERVICE SUBSECTOR
    cuf => cuf0,
    lufd => lufd0
]
# ODE solution plot
function plot_sol_3_36(sol)
    traces = GenericTrace[]
    push!(traces, scatter(x=sol[t], y=sol[pop], name="pop", yaxis="y1"))
    push!(traces, scatter(x=sol[t], y=sol[al], name="al", yaxis="y2"))
    push!(traces, scatter(x=sol[t], y=sol[fioaa], name="fioaa", yaxis="y3"))
    push!(traces, scatter(x=sol[t], y=sol[fcaor], name="fcaor", yaxis="y4"))
    push!(traces, scatter(x=sol[t], y=sol[aiph], name="aiph", yaxis="y5"))
    plot(traces,
        Layout(xaxis_domain=[0.3, 0.7],
            yaxis=attr(title="pop", range=[0, 5e9]),
            yaxis2=attr(title="al", overlaying="y", side="right", position=0.70, range=[0, 1.5e9]),
            yaxis3=attr(title="fioaa", overlaying="y", side="right", position=0.74, range=[0, 0.5]),
            yaxis4=attr(title="fcaor", overlaying="y", side="right", position=0.78, range=[0, 0.25]),
            yaxis5=attr(title="aiph", overlaying="y", side="right", position=0.82, range=[0, 50])
        )
    )
end

function plot_sol_2_85(sol)
    pop = sol[p1] + sol[p2] + sol[p3] + sol[p4]
    traces = GenericTrace[]
    push!(traces, scatter(x=sol[t], y=sol[p1] ./ pop, name="p1", yaxis="y1"))
    push!(traces, scatter(x=sol[t], y=sol[p2] ./ pop, name="p2", yaxis="y2"))
    push!(traces, scatter(x=sol[t], y=sol[p3] ./ pop, name="p3", yaxis="y3"))
    push!(traces, scatter(x=sol[t], y=sol[p4] ./ pop, name="p4", yaxis="y4"))
    plot(traces,
        Layout(xaxis_domain=[0.3, 0.7],
            yaxis=attr(title="p1", range=[0, 1]),
            yaxis2=attr(title="p2", overlaying="y", side="right", position=0.70, range=[0, 1]),
            yaxis3=attr(title="p3", overlaying="y", side="right", position=0.74, range=[0, 1]),
            yaxis4=attr(title="p4", overlaying="y", side="right", position=0.78, range=[0, 1])
        )
    )
end