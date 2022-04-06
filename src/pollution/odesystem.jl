# Parameter declarations
@parameters ppgf1, ppgf21, frpm, imef, imti, fipm, amti, 
@parameters pptd1, pptd2, ppol70, ahl70, swat, tdd, pcti, pd, pyear
@variables t
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
    ppgr ~ (ppgio + ppgao) * ppgf1
    ppgf ~ clip(ppgf2, ppgf1, t, pyear)
    ppgf2 ~ switch(ppgf21, ppgf22, swat)
    ppgio ~ pcrum * pop * frpm * imef * imti
    ppgao ~ aiph * al * fipm * amti
    ### ppapr ~ delay3()
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
    ppapr => ppapr0, ppol => ppol0, ppgf22 => ppgf220, pcti => pcti0, plmp => plmp0
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
