# Parameter declarations
@parameters ppgf1, ppgf21, frpm, imef, imti, fipm, amti
@parameters pptd1, pptd2, ppol70, ahl70, swat, tdd, pcti, pd, pyear
@variables t
@variables ppgr(t) ppgf(t) ppgf2(t) ppgio(t) ppgao(t) ppapr(t) ppapr3(t) ppapr2(t) ppapr1(t)
@variables pptd(t) ppol(t) ppolx(t) ppasr(t) ahlm(t) ahl(t) pcrum(t) pop(t) aiph(t) al(t)
@variables ppgf22(t) ppgf222(t) ppgf221(t) pcti(t) pctir(t) pctcm(t)
@variables plmp(t) plmp2(t) plmp1(t) lmp(t) lmp1(t) lmp2(t) lfdr(t) lfdr1(t) lfdr2(t)
#@variables nr(t) nrur(t) nruf(t) pcrum(t) nrfr(t) fcaor(t) fcaor1(t) fcaor2(t)
#@variables pop(t) pop1(t) ic(t) icir(t) icdr(t) io(t) iopc(t)
D = Differential(t)
# Registered functions used in equations
@register interpolate(x, y::NTuple, xs::Tuple)
@register clip(f1, f2, va, th)
@register min(v1, v2)
@register max(v1, v2)
@register step(t, hght, sttm)
@register switch(v1, v2, z)

global eqs = [
    ppgr ~ (ppgio + ppgao) * ppgf
    ppgf ~ clip(ppgf2, ppgf1, t, pyear)
    ppgf2 ~ switch(ppgf21, ppgf22, swat)
    ppgio ~ pcrum * pop * frpm * imef * imti
    ppgao ~ aiph * al * fipm * amti
    ppapr ~ 3 * ppapr3 / pptd
    D(ppapr3) ~ (3 * ppapr2 / pptd) - ppapr
    D(ppapr2) ~ 3 * (ppapr1 - ppapr2) / pptd
    D(ppapr1) ~ ppgr - (3 * ppapr1 / pptd)
    pptd ~ clip(pptd2, pptd1, t, pyear)
    D(ppol) ~ ppapr - ppasr
    ppolx ~ ppol / ppol70
    ppasr ~ ppol / (1.4 * ahl)
    ahlm ~ interpolate(ppolx, ahlmt, ahlmts)
    ahl ~ ahl70 * ahlm
    # TABLE FUNCTIONS FOR CONTINUED MATERIAL GROWTH
    pcrum ~ interpolate(t, pcrumt, pcrumts) * 1e-2
    pop ~ interpolate(t, popt, popts) * 1e8
    aiph ~ interpolate(t, aipht, aiphts)
    al ~ interpolate(t, alt, alts) * 1e8
    # ADAPTIVE TECHNOLOGICAL CONTROL CARDS
    D(ppgf22) ~ 3 * (ppgf222 - ppgf22) / tdd
    D(ppgf222) ~ 3 * (ppgf221 - ppgf222) / tdd
    D(ppgf221) ~ 3 * (pcti - ppgf221) / tdd
    D(pcti) ~ pctir
    pctir ~ clip(pcti * pctcm, 0, t, pyear)
    pctcm ~ interpolate(1 - plmp, pctcmt, pctcmts)
    D(plmp) ~ 3 * (plmp2 - plmp) / pd
    D(plmp2) ~ 3 * (plmp1 - plmp2) / pd
    D(plmp1) ~ 3 * (lmp - plmp1) / pd
    # POLLUTION DAMAGE FUNCTIONS
    lmp ~ clip(lmp2, lmp1, t, pyear)
    lmp1 ~ interpolate(ppolx, lmp1t, lmp1ts)
    lmp2 ~ interpolate(ppolx, lmp2t, lmp2ts)
    lfdr ~ clip(lfdr2, lfdr1, t, pyear)
    lfdr1 ~ interpolate(ppolx, lfdr1t, lfdr1ts)
    lfdr2 ~ interpolate(ppolx, lfdr2t, lfdr2ts)
]
# Parameter values
global p = [
    ppgf1 => ppgf1v, ppgf21 => ppgf21v, frpm => frpmv,
    imef => imefv, imti => imtiv, fipm => fipmv, amti => amtiv,
    pptd1 => pptd1v, pptd2 => pptd2v, ppol70 => ppol70v, ahl70 => ahl70v,
    swat => swatv, tdd => tddv, pcti => pctiv, pd => pdv, pyear => pyearv
]
# Initializations
global u0 = [
    t => t0,
    pcrum => pcrum0,
    pop => pop0,
    ppgio => ppgio0,
    aiph => aiph0,
    al => al0,
    ppgao => ppgao0,
    ppgr => ppgr0,
    pptd => pptd0,
    ppapr3 => ppapr30,
    ppapr2 => ppapr30,
    ppapr1 => ppapr30,
    ppol => ppol0,
    pcti => pcti0,
    ppgf22 => ppgf220,
    ppgf222 => ppgf220,
    ppgf221 => ppgf220,
    ppolx => ppolx0,
    lmp1 => lmp10,
    lmp2 => lmp20,
    lmp => lmp0,
    plmp => plmp0,
    plmp2 => plmp0,
    plmp1 => plmp0
]
# ODE solution plot
function plot_sol_6_28(sol)
    traces = GenericTrace[]
    push!(traces, scatter(x=sol[t], y=sol[pcrum], name="pcrum", yaxis="y1"))
    push!(traces, scatter(x=sol[t], y=sol[pop], name="pop", yaxis="y2"))
    push!(traces, scatter(x=sol[t], y=sol[al], name="al", yaxis="y3"))
    push!(traces, scatter(x=sol[t], y=sol[aiph], name="aiph", yaxis="y4"))
    push!(traces, scatter(x=sol[t], y=sol[ppgr], name="ppgr", yaxis="y5"))
    plot(traces,
        Layout(xaxis_domain=[0.1, 0.7],
            yaxis=attr(title="pcrum", range=[0, 1]),
            yaxis2=attr(title="pop", overlaying="y", side="right", position=0.70, range=[0, 4e9]),
            yaxis3=attr(title="al", overlaying="y", side="right", position=0.74, range=[0, 2e9]),
            yaxis4=attr(title="aiph", overlaying="y", side="right", position=0.78, range=[0, 50]),
            yaxis5=attr(title="ppgr", overlaying="y", side="right", position=0.82, range=[0, 2e8]),
        )
    )
end

function plot_sol_6_29(sol)
    traces = GenericTrace[]
    push!(traces, scatter(x=sol[t], y=sol[ppgr], name="ppgr", yaxis="y1"))
    push!(traces, scatter(x=sol[t], y=sol[ppapr], name="ppapr", yaxis="y2"))
    push!(traces, scatter(x=sol[t], y=sol[ppasr], name="ppasr", yaxis="y3"))
    push!(traces, scatter(x=sol[t], y=sol[ppolx], name="ppolx", yaxis="y4"))
    push!(traces, scatter(x=sol[t], y=sol[ahl], name="ahl", yaxis="y5"))
    push!(traces, scatter(x=sol[t], y=sol[lmp], name="lmp", yaxis="y6"))
    push!(traces, scatter(x=sol[t], y=sol[lfdr], name="lfdr", yaxis="y7"))
    plot(traces,
        Layout(xaxis_domain=[0.1, 0.7],
            yaxis=attr(title="ppgr", range=[0, 2e8]),
            yaxis2=attr(title="ppapr", overlaying="y", side="right", position=0.70, range=[0, 2e8]),
            yaxis3=attr(title="ppasr", overlaying="y", side="right", position=0.74, range=[0, 2e8]),
            yaxis4=attr(title="ppolx", overlaying="y", side="right", position=0.78, range=[0, 1]),
            yaxis5=attr(title="ahl", overlaying="y", side="right", position=0.82, range=[0, 2]),
            yaxis6=attr(title="lmp", overlaying="y", side="right", position=0.86, range=[0, 1]),
            yaxis7=attr(title="lfdr", overlaying="y", side="right", position=0.90, range=[0, 0.5]),
        )
    )
end
