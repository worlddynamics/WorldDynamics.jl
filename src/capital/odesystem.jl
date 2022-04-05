# Parameter declarations
@parameters len sfpc hsid iphst ffw rlt pet mtfn lpd zpgt dcfsn sad ieat fcest lt lt2 cio ps pt cso cfood
@parameters pyear, icor1, icor2, alic1, alic2, iet, iopcd, fioac1, fioac2
@parameters alsc1, alsc2, scor1, scor2, lfpf, lufdt
# Function declarations
@variables t
# @variables pop(t) br(t) dr(t)
# @variables cdr(t) le(t) lmf(t) hsapc(t) ehspc(t) lmhs(t) lmhs1(t) lmhs2(t) fpu(t) cmi(t)
# @variables lmc(t) lmp(t)
# @variables cbr(t) tf(t) mtf(t) fm(t) dtf(t) cmple(t) ple(t) ple2(t) ple1(t) dcfs(t)
# @variables sfsn(t) diopc(t) diopc2(t) diopc1(t) frsn(t) fie(t)
# @variables aiopc(t) nfc(t) fce(t) fcfpc(t) fcfpc2(t) fcfpc1(t) fcapc(t) fsafc(t)
@variables io(t)
# @variables io1(t) io2(t) io11(t) io12(t) iopc(t)
# @variables ppolx(t)
# @variables so(t) so1(t) so2(t) so11(t) so12(t) sopc(t)
# @variables f(t) f1(t) f2(t) f11(t) f12(t) fpc(t)
# pop4
# @variables p1(t) p2(t) p3(t) p4(t)
# @variables d1(t) mat1(t) m1(t)
# @variables d2(t) mat2(t) m2(t)
# @variables d3(t) mat3(t) m3(t)
# @variables d4(t) m4(t)
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
    # # DEATH RATE EQUATIONS
    # cdr ~ 1000.0 * dr / pop, # line 5 page 167
    # le ~ len * lmf * lmhs * lmp * lmc, # line 6 page 167
    # lmf ~ interpolate(fpc / sfpc, lmft, lmfts), # line 8 page 167
    # hsapc ~ interpolate(sopc, hsapct, hsapcts), # line 11 page 167
    # D(ehspc) ~ (hsapc - ehspc) / hsid, # line 13 page 167
    # lmhs ~ clip(lmhs2, lmhs1, t, iphst), # line 15 page 167
    # lmhs1 ~ interpolate(ehspc, lmhs1t, lmhs1ts), # line 17 page 167
    # lmhs2 ~ interpolate(ehspc, lmhs2t, lmhs2ts), # line 19 page 167
    # fpu ~ interpolate(pop, fput, fputs), # line 21 page 167
    # cmi ~ interpolate(iopc, cmit, cmits), # line 23 page 167
    # lmc ~ 1 - (cmi * fpu),  # line 25 page 167
    # lmp ~ interpolate(ppolx, lmpt, lmpts), # line 26 page 167
    # # BIRTH RATE EQUATIONS
    # # br ~ clip(dr, tf * pop * ffw / rlt, t, pet), # line 28 page 168
    # cbr ~ 1000.0 * br / pop, # line 32 page 168
    # tf ~ min(mtf, mtf * (1 - fce) + dtf * fce), # line 33 page 168
    # mtf ~ mtfn * fm, # line 34 page 168
    # fm ~ interpolate(le, fmt, fmts), # line 36 page 168
    # dtf ~ dcfs * cmple, # line 38 page 168
    # cmple ~ interpolate(ple, cmplet, cmplets), # line 39 page 168
    # D(ple) ~ 3 * (ple2 - ple) / lpd, # line 41 page 168
    # D(ple2) ~ 3 * (ple1 - ple2) / lpd, # line 41 page 168
    # D(ple1) ~ 3 * (le - ple1) / lpd, # line 41 page 168
    # dcfs ~ clip(2, dcfsn * frsn * sfsn, t, zpgt), # line 43 page 168
    # sfsn ~ interpolate(diopc, sfsnt, sfsnts), # line 46 page 168
    # D(diopc) ~ 3 * (diopc2 - diopc) / sad, # line 48 page 168
    # D(diopc2) ~ 3 * (diopc1 - diopc2) / sad, # line 48 page 168
    # D(diopc1) ~ 3 * (iopc - diopc1) / sad, # line 48 page 168
    # # frsn ~ clip(interpolate(fie, frsnt, frsnts), 0.82, t, 1905), # line 50 page 168
    # frsn ~ clip(interpolate(fie, frsnt, frsnts), 0.82, t, 5), # line 50 page 168
    # fie ~ (iopc - aiopc) / aiopc, # line 53 page 168
    # D(aiopc) ~ (iopc - aiopc) / ieat, # line 54 page 168
    # nfc ~ (mtf / dtf) - 1, # line 56 page 168
    # fce ~ clip(1.0, interpolate(fcfpc, fcet, fcets), t, fcest), # line 57 page 168
    # D(fcfpc) ~ 3 * (fcfpc2 - fcfpc) / hsid, # line 60 page 168
    # D(fcfpc2) ~ 3 * (fcfpc1 - fcfpc2) / hsid, # line 60 page 168
    # D(fcfpc1) ~ 3 * (fcapc - fcfpc1) / hsid, # line 60 page 168
    # fcapc ~ fsafc * sopc, # line 61 page 168
    # fsafc ~ interpolate(nfc, fsafct, fsafcts), # line 62 page 168
    # # EXOGENOUS INPUTS TO THE POPULATION SECTOR
    # # INDUSTRIAL OUTPUT
    # # io ~ clip(io2, io1, t, lt), # line 64 page 168
    # # io1 ~ clip(io12, io11, t, lt2), # line 66 page 168
    # # io11 ~ 0.7e11 * exp(t * 0.037), # line 68 page 168
    # # io12 ~ pop * cio, # line 69 page 168
    # # io2 ~ 0.7e11 * exp(lt * 0.037), # line 71 page 168
    iopc ~ io / pop,
    # # iopc ~ 0.7e11 * exp(t * 0.037) / pop,
    # # INDEX OF PERSISTENT POLLUTION
    # D(ppolx) ~ step(t, ps, pt),
    # # ppolx ~ 1.0, # line 73,74,75 page 168
    # # SERVICE OUTPUT
    # # so ~ clip(so2, so1, t, lt), # line 76 page 168
    # # so1 ~ clip(so12, so11, t, lt2), # line 77 page 168
    # # so11 ~ 1.5e11 * exp(t * 0.030), # line 78 page 168
    # # so12 ~ pop * cso, # line 79 page 168
    # # so2 ~ 1.5e11 * exp(lt * 0.030), # line 81 page 168
    sopc ~ so / pop,
    # # sopc ~ (1.5e11 * exp(t * 0.0>30)) / pop, # line 82 page 168
    # # FOOD
    # f ~ clip(f2, f1, t, lt), # line 86 page 168
    # f1 ~ clip(f12, f11, t, lt2), # line 87 page 168
    # f11 ~ 4e11 * exp(t * 0.020), # line 88 page 168
    # f12 ~ pop * cfood, # line 89 page 168
    # f2 ~ 4e11 * exp(lt * 0.020), # line 91 page 168
    # fpc ~ f / pop,
    # # fpc ~ (4e11 * exp(t * 0.020)) / pop # line 92 page 168
    # # pop4
    # # POPULATION LEVEL EQUATIONS
    # pop ~ p1 + p2 + p3 + p4,
    # D(p1) ~ br - d1 - mat1,
    # d1 ~ p1 * m1,
    # m1 ~ interpolate(le, m1t, m1ts),
    # mat1 ~ p1 * (1 - m1) / 15,
    # D(p2) ~ mat1 - d2 - mat2,
    # d2 ~ p2 * m2,
    # m2 ~ interpolate(le, m2t, m2ts),
    # mat2 ~ p2 * (1 - m2) / 30,
    # D(p3) ~ mat2 - d3 - mat3,
    # d3 ~ p3 * m3,
    # m3 ~ interpolate(le, m3t, m3ts),
    # mat3 ~ p3 * (1 - m3) / 20,
    # D(p4) ~ mat3 - d4,
    # d4 ~ p4 * m4,
    # m4 ~ interpolate(le, m4t, m4ts),
    # # DEATH RATE EQUATIONS
    # dr ~ d1 + d2 + d3 + d4,
    # # BIRTH RATE EQUATIONS
    # br ~ clip(dr, tf * p2 * 0.5 / rlt, t, pet)
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
    # len => lenv, sfpc => sfpcv, hsid => hsidv, iphst => iphstv, # line 7,10,14,16 page 167
    # ffw => ffwv, rlt => rltv, pet => petv, mtfn => mtfnv, lpd => lpdv, # line 29,30,31,35,42 page 168
    # zpgt => zpgtv, dcfsn => dcfsnv, sad => sadv, ieat => ieatv, fcest => fcestv, # line 44,45,49,55,58 page 168
    # lt => ltv, lt2 => lt2v, cio => ciov, ps => psv, pt => ptv, cso => csov, cfood => cfoodv, # line 65,67,70,74,75,80,90 page 168
    # CAPITAL SECTOR
    pyear => pyearv, icor1 => icor1v, icor2 => icor2v, alic1 => alic1v, alic2 => alic2v,
    iet => ietv, iopcd => iopcdv, fioac1 => fioac1v, fioac2 => fioac2v,
    alsc1 => alsc1v, alsc2 => alsc2v, scor1 => scor1v, scor2 => scor2v,
    lfpf => lfpfv, lufdt => lufdtv
]
# Initializations
global u0 = [
    pop => pop0, # lines 2-3 page 167
    # ehspc => ehspc0, # smooth at lines 13-14 page 167
    # ple => le0, # dlinf3 at line 41 page 168
    # ple1 => le0, # dlinf3 at line 41 page 168
    # ple2 => le0, # dlinf3 at line 41 page 168
    # diopc => iopc0, # dlinf3 at line 48 page 168
    # diopc1 => iopc0, # dlinf3 at line 48 page 168
    # diopc2 => iopc0, # dlinf3 at line 48 page 168
    # # frsn => 0.82, # line 52 page 168
    # aiopc => iopc0, # smooth at line 54 page 168
    # fcfpc => fcapc0, # dlinf3 at line 60 page 168
    # fcfpc1 => fcapc0, # dlinf3 at line 60 page 168
    # fcfpc2 => fcapc0, # dlinf3 at line 60 page 168
    # ppolx => ppolx0,
    # # fpc => fpc0,
    # # br => br0
    # # pop4
    # p1 => p10,
    # p2 => p20, #
    # p3 => p30, #
    # p4 => p40,
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