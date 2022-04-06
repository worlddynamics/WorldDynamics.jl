# Parameter declarations
@parameters palt, lfh, pl, alai1, alai2, lyf1, lyf2, io70
@parameters sd, alln, uildt, ilf, sfpc
@parameters fspd, eyear, popi, ioi, ppolxi, pyear
@variables t
@variables lfc(t) al(t) pal(t) f(t) fpc(t) ifpc(t) ifpc1(t) ifpc2(t)
@variables tai(t) fioaa(t) fioaa1(t) fioaa2(t) ldr(t) dcph(t)
@variables cai(t) ai(t) alai(t) aiph(t) lymc(t) ly(t) lyf(t) lymap(t) lymap1(t) lymap2(t)
@variables fiald(t) mpld(t) mpai(t) mlymc(t)
@variables all(t) llmy(t) llmy1(t) llmy2(t) ler(t) uilpc(t) uilr(t) lrui(t) uil(t)
@variables lfert(t) lfdr(t) lfd(t) lfr(t) lfrt(t)
@variables falm(t) fr(t) pfr(t) pop(t) pop1(t) pop2(t)
@variables io(t) io1(t) io2(t) iopc(t) ppolx(t) ppolx1(t) ppolx2(t)
D = Differential(t)
# Registered functions used in equations
@register interpolate(x, y::NTuple, xs::Tuple)
@register clip(f1, f2, va, th)
@register min(v1, v2)
@register max(v1, v2)
@register step(t, hght, sttm)

global eqs = [
    # LOOP 1: FOOD FROM INVESTMENT IN LAND DEVELOPMENT
    lfc ~ al / palt,
    D(al) ~ ldr - ler - lrui,
    D(pal) ~ -ldr,
    f ~ ly * al * lfh * (1 - pl),
    fpc ~ f / pop,
    ifpc ~ clip(ifpc2, ifpc1, t, pyear),
    ifpc1 ~ interpolate(iopc, ifpc1t, ifpc1ts),
    ifpc2 ~ interpolate(iopc, ifpc2t, ifpc2ts),
    tai ~ io * fioaa,
    fioaa ~ clip(fioaa2, fioaa1, t, pyear),
    fioaa1 ~ interpolate(fpc / ifpc, fioaa1t, fioaa1ts),
    fioaa2 ~ interpolate(fpc / ifpc, fioaa2t, fioaa2ts),
    ldr ~ tai * fiald / dcph,
    dcph ~ interpolate(pal / palt, dcpht, dcphts),
    # LOOP 2: FOOD FROM INVESTMENT IN AGRICULTURAL INPUTS
    cai ~ tai * (1 - fiald),
    D(ai) ~ (cai - ai) / alai,
    alai ~ clip(alai2, alai1, t, pyear),
    aiph ~ ai * (1 - falm) / al,
    lymc ~ interpolate(aiph, lymct, lymcts),
    ly ~ lyf * lfert * lymc * lymap,
    lyf ~ clip(lyf2, lyf1, t, pyear),
    lymap ~ clip(lymap2, lymap1, t, pyear),
    lymap1 ~ interpolate(io / io70, lymap1t, lymap1ts),
    lymap2 ~ interpolate(io / io70, lymap2t, lymap2ts),
    # LOOPS 1 & 2: THE INVESTMENT ALLOCATION DECISION
    fiald ~ interpolate(mpld / mpai, fialdt, fialdts),
    mpld ~ ly / (dcph * sd),
    mpai ~ alai * ly * mlymc / lymc,
    mlymc ~ interpolate(aiph, mlymct, mlymcts),
    # LOOP 3: LAND EROSION AND URBAN-INDUSTRIAL USE
    all ~ alln * llmy,
    llmy ~ clip(llmy2, llmy1, t, pyear),
    llmy1 ~ interpolate(ly / ilf, llmy1t, llmy1ts),
    llmy2 ~ interpolate(ly / ilf, llmy2t, llmy2ts),
    ler ~ al / all,
    uilpc ~ interpolate(iopc, uilpct, uilpcts),
    uilr ~ uilpc * pop,
    lrui ~ max(0, (uilr - uil) / uildt),
    D(uil) ~ lrui,
    # LOOP 4: LAND FERTILITY DEGRADATION
    D(lfert) ~ lfr - lfd,
    lfdr ~ interpolate(ppolx, lfdrt, lfdrts),
    lfd ~ lfert * lfdr,
    # LOOP 5: LAND FERTILITY REGENERATION
    lfr ~ (ilf - lfert) / lfrt,
    lfrt ~ interpolate(falm, lfrtt, lfrtts),
    # LOOP 6: DISCONTINUING LAND MAINTENANCE
    falm ~ interpolate(pfr, falmt, falmts),
    fr ~ fpc / sfpc,
    D(pfr) ~ (fr - pfr) / fspd,
    # POPULATION GROWS EXPONENTIALLY AT 1.2% PER YEAR
    pop ~ clip(pop2, pop1, t, eyear),
    # TODO: if we put the correct value of 0.012, the code breaks
    #  I have to investigate more
    pop1 ~ popi * exp(0.013 * (t - 1900.0)),
    pop2 ~ popi * exp(0.012 * (eyear - 1900.0)),
    # INDUSTRIAL OUTPUT GROWS EXPONENTIALLY AT 3.6% PER YEAR
    io ~ clip(io2, io1, t, eyear),
    io1 ~ ioi * exp(0.036 * (t - 1900.0)),
    io2 ~ ioi * exp(0.036 * (eyear - 1900.0)),
    iopc ~ io / pop,
    # PERSISTENT POLLUTION GROWS EXPONENTIALLYAT 3% PER YEAR
    ppolx ~ clip(ppolx2, ppolx1, t, eyear),
    ppolx1 ~ ppolxi * exp(0.03 * (t - 1900.0)),
    ppolx2 ~ ppolxi * exp(0.03 * (eyear - 1900.0))
]
# Parameter values
global p = [
    palt => paltv, lfh => lfhv, pl => plv,
    alai1 => alai1v, alai2 => alai2v, lyf1 => lyf1v, lyf2 => lyf2v, io70 => io70v,
    sd => sdv, alln => allnv, uildt => uildtv, ilf => ilfv, sfpc => sfpcv,
    fspd => fspdv, eyear => eyearv, popi => popiv, ioi => ioiv,
    ppolxi => ppolxiv, pyear => pyearv
]
# Initializations
global u0 = [
    al => al0,
    pal => pal0,
    ai => ai0,
    uil => uil0,
    lfert => lfert0,
    pfr => pfr0
]
# ODE solution plot
function plot_sol_4_69(sol)
    traces = GenericTrace[]
    push!(traces, scatter(x=sol[t], y=sol[al], name="al", yaxis="y1"))
    push!(traces, scatter(x=sol[t], y=sol[pal], name="pal", yaxis="y2"))
    push!(traces, scatter(x=sol[t], y=sol[ler], name="ler", yaxis="y3"))
    push!(traces, scatter(x=sol[t], y=sol[ldr], name="ldr", yaxis="y4"))
    push!(traces, scatter(x=sol[t], y=sol[lrui], name="lrui", yaxis="y5"))
    push!(traces, scatter(x=sol[t], y=sol[dcph], name="dcph", yaxis="y6"))
    plot(traces,
        Layout(xaxis_domain=[0.3, 0.7],
            yaxis=attr(title="al", range=[0, 4e9]),
            yaxis2=attr(title="pal", overlaying="y", side="right", position=0.70, range=[0, 4e9]),
            yaxis3=attr(title="ler", overlaying="y", side="right", position=0.74, range=[0, 40e6]),
            yaxis4=attr(title="ldr", overlaying="y", side="right", position=0.78, range=[0, 40e6]),
            yaxis5=attr(title="lrui", overlaying="y", side="right", position=0.82, range=[0, 40e6]),
            yaxis6=attr(title="dcph", overlaying="y", side="right", position=0.86, range=[0, 10000])
        )
    )
end
