## PARAMETER DECLARATIONS
@parameters len, sfpc, hsid, iphst, ffw, rlt, pet, mtfn, lpd, zpgt, dcfsn, sad, ieat
@parameters fcest, pyear, icor1, icor2, alic1, alic2
@parameters iet, iopcd, fioac1, fioac2, alsc1, alsc2, scor1, scor2, lfpf, lufdt, palt
@parameters lfh, pl, alai1, alai2, lyf1, lyf2, io70, sd, alln, uildt, ilf, sfpc, fspd
@parameters eyear, popi, ioi, ppolxi, pyear, exppop, nri, nruf1, nruf2, popi, gc, pop2
@parameters zpgt, fioaa, fioas, fioac, alic, icor, pyear, ppgf1, ppgf21, frpm, imef, imti
@parameters fipm, amti, pptd1, pptd2, ppol70, ahl70, swat, tdd, pcti, pd, pyear
## FUNCTION DECLARATIONS
@variables t
D = Differential(t)
@variables pop(t) p1(t) d1(t) m1(t) mat1(t) p2(t) d2(t) m2(t) mat2(t) p3(t) d3(t) m3(t)
@variables mat3(t) p4(t) d4(t) m4(t) dr(t) cdr(t) le(t) lmf(t) hsapc(t) ehspc(t) lmhs(t)
@variables lmhs1(t) lmhs2(t) fpu(t) cmi(t) lmc(t) lmp(t) br(t) cbr(t) tf(t) mtf(t) fm(t)
@variables dtf(t) cmple(t) ple(t) ple2(t) ple1(t) dcfs(t) sfsn(t) diopc(t) diopc2(t)
@variables diopc1(t) frsn(t) fie(t) aiopc(t) nfc(t) fce(t) fcfpc(t) fcfpc2(t) fcfpc1(t)
@variables fcapc(t) fsafc(t) iopc(t) io(t) fcaor(t) icor(t) ic(t) icdr(t) alic(t) icir(t)
@variables fioai(t) fioaa(t) fioas(t) fioas1(t) fioas2(t) isopc(t) isopc1(t) isopc2(t)
@variables fioac(t) fioacv(t) fioacc(t) scir(t) sc(t) scdr(t) alsc(t) sopc(t) so(t) cuf(t)
@variables scor(t) j(t) pjis(t) jpicu(t) pjas(t) jph(t) pjss(t) jpscu(t) lf(t) luf(t)
@variables lufd(t) lfc(t) al(t) pal(t) f(t) fpc(t) ifpc(t) ifpc1(t) ifpc2(t) tai(t)
@variables fioaa(t) fioaa1(t) fioaa2(t) ldr(t) dcph(t) cai(t) ai(t) alai(t) aiph(t)
@variables lymc(t) ly(t) lyf(t) lymap(t) lymap1(t) lymap2(t) fiald(t) mpld(t) mpai(t)
@variables mlymc(t) all(t) llmy(t) llmy1(t) llmy2(t) ler(t) uilpc(t) uilr(t) lrui(t)
@variables uil(t) lfert(t) lfdr(t) lfd(t) lfr(t) lfrt(t) falm(t) fr(t) pfr(t) nr(t)
@variables nrur(t) nruf(t) pcrum(t) nrfr(t) fcaor(t) fcaor1(t) fcaor2(t) ppgr(t) ppgf(t)
@variables ppgf2(t) ppgio(t) ppgao(t) ppapr(t) ppapr3(t) ppapr2(t) ppapr1(t) pptd(t)
@variables ppol(t) ppolx(t) ppasr(t) ahlm(t) ahl(t) foa(t) foi(t) fos(t)
# ODEs
global eqs = [
    # POPULATION SECTOR
    pop ~ p1 + p2 + p3 + p4,
    D(p1) ~ br - d1 - mat1,
    d1 ~ p1 * m1,
    m1 ~ interpolate(le, m1t, m1ts),
    mat1 ~ p1 * (1 - m1) / 15,
    D(p2) ~ mat1 - d2 - mat2,
    d2 ~ p2 * m2,
    m2 ~ interpolate(le, m2t, m2ts),
    mat2 ~ p2 * (1 - m2) / 30,
    D(p3) ~ mat2 - d3 - mat3,
    d3 ~ p3 * m3,
    m3 ~ interpolate(le, m3t, m3ts),
    mat3 ~ p3 * (1 - m3) / 20,
    D(p4) ~ mat3 - d4,
    d4 ~ p4 * m4,
    m4 ~ interpolate(le, m4t, m4ts),
    # DEATH RATE EQUATIONS
    dr ~ d1 + d2 + d3 + d4,
    cdr ~ 1000.0 * dr / pop, # line 5 page 167
    le ~ len * lmf * lmhs * lmp * lmc, # line 6 page 167
    lmf ~ interpolate(fpc / sfpc, lmft, lmfts), # line 8 page 167
    hsapc ~ interpolate(sopc, hsapct, hsapcts), # line 11 page 167
    D(ehspc) ~ (hsapc - ehspc) / hsid, # line 13 page 167
    lmhs ~ clip(lmhs2, lmhs1, t, iphst), # line 15 page 167
    lmhs1 ~ interpolate(ehspc, lmhs1t, lmhs1ts), # line 17 page 167
    lmhs2 ~ interpolate(ehspc, lmhs2t, lmhs2ts), # line 19 page 167
    fpu ~ interpolate(pop, fput, fputs), # line 21 page 167
    cmi ~ interpolate(iopc, cmit, cmits), # line 23 page 167
    lmc ~ 1 - (cmi * fpu),  # line 25 page 167
    lmp ~ interpolate(ppolx, lmpt, lmpts), # line 26 page 167
    # BIRTH RATE EQUATIONS
    br ~ clip(dr, tf * p2 * 0.5 / rlt, t, pet)
    cbr ~ 1000.0 * br / pop, # line 32 page 168
    tf ~ min(mtf, mtf * (1 - fce) + dtf * fce), # line 33 page 168
    mtf ~ mtfn * fm, # line 34 page 168
    fm ~ interpolate(le, fmt, fmts), # line 36 page 168
    dtf ~ dcfs * cmple, # line 38 page 168
    cmple ~ interpolate(ple, cmplet, cmplets), # line 39 page 168
    D(ple) ~ 3 * (ple2 - ple) / lpd, # line 41 page 168
    D(ple2) ~ 3 * (ple1 - ple2) / lpd, # line 41 page 168
    D(ple1) ~ 3 * (le - ple1) / lpd, # line 41 page 168
    dcfs ~ clip(2, dcfsn * frsn * sfsn, t, zpgt), # line 43 page 168
    sfsn ~ interpolate(diopc, sfsnt, sfsnts), # line 46 page 168
    D(diopc) ~ 3 * (diopc2 - diopc) / sad, # line 48 page 168
    D(diopc2) ~ 3 * (diopc1 - diopc2) / sad, # line 48 page 168
    D(diopc1) ~ 3 * (iopc - diopc1) / sad, # line 48 page 168
    frsn ~ clip(interpolate(fie, frsnt, frsnts), 0.82, t, 1905), # line 50 page 168
    # frsn ~ clip(interpolate(fie, frsnt, frsnts), 0.82, t, 5), # line 50 page 168
    fie ~ (iopc - aiopc) / aiopc, # line 53 page 168
    D(aiopc) ~ (iopc - aiopc) / ieat, # line 54 page 168
    nfc ~ (mtf / dtf) - 1, # line 56 page 168
    fce ~ clip(1.0, interpolate(fcfpc, fcet, fcets), t, fcest), # line 57 page 168
    D(fcfpc) ~ 3 * (fcfpc2 - fcfpc) / hsid, # line 60 page 168
    D(fcfpc2) ~ 3 * (fcfpc1 - fcfpc2) / hsid, # line 60 page 168
    D(fcfpc1) ~ 3 * (fcapc - fcfpc1) / hsid, # line 60 page 168
    fcapc ~ fsafc * sopc, # line 61 page 168
    fsafc ~ interpolate(nfc, fsafct, fsafcts), # line 62 page 168
    # CAPITAL SECTOR
    # INDUSTRIAL SUBSECTOR
    iopc ~ io / pop,
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
    sopc ~ so / pop,
    so ~ sc * cuf / scor,
    cuf ~ interpolate(lufd, cuft, cufts),
    scor ~ clip(scor2, scor1, t, pyear),
    # JOB SUBSECTOR
    j ~ pjis + pjas + pjss,
    pjis ~ ic * jpicu,
    jpicu ~ interpolate(iopc, jpicut, jpicuts) * (1e-3),
    pjas ~ jph * al,
    jph ~ interpolate(aiph, jpht, jphts),
    pjss ~ sc * jpscu,
    jpscu ~ interpolate(sopc, jpscut, jpscuts) * (1e-3),
    lf ~ (p2 + p3) * lfpf,
    luf ~ j / lf,
    D(lufd) ~ (luf - lufd) / lufdt,
    # AGRICULTURE SECTOR
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
    # NONRENEWABLE SECTOR
    D(nr) ~ -nrur,
    nrur ~ pop * pcrum * nruf,
    nruf ~ clip(nruf2, nruf1, t, pyear),
    pcrum ~ interpolate(iopc, pcrumt, pcrumts),
    nrfr ~ nr / nri,
    fcaor ~ clip(fcaor2, fcaor1, t, pyear),
    fcaor1 ~ interpolate(nrfr, fcaor1t, fcaor1ts),
    fcaor2 ~ interpolate(nrfr, fcaor2t, fcaor2ts),
    # POLLUTION SECTOR
    ppgr ~ (ppgio + ppgao) * ppgf,
    ppgf ~ clip(ppgf2, ppgf1, t, pyear),
    ppgf2 ~ switch(ppgf21, ppgf22, swat),
    ppgio ~ pcrum * pop * frpm * imef * imti,
    ppgao ~ aiph * al * fipm * amti,
    ppapr ~ 3 * ppapr3 / pptd,
    D(ppapr3) ~ (3 * ppapr2 / pptd) - ppapr,
    D(ppapr2) ~ 3 * (ppapr1 - ppapr2) / pptd,
    D(ppapr1) ~ ppgr - (3 * ppapr1 / pptd),
    pptd ~ clip(pptd2, pptd1, t, pyear),
    D(ppol) ~ ppapr - ppasr,
    ppolx ~ ppol / ppol70,
    ppasr ~ ppol / (1.4 * ahl),
    ahlm ~ interpolate(ppolx, ahlmt, ahlmts),
    ahl ~ ahl70 * ahlm,
    foa ~ (0.22) * f / (0.22 * f + so + io),
    foi ~ io / (0.22 * f + so + io),
    fos ~ so / (0.22 * f + so + io),
]
# Parameters
global p = [
    len => lenv,
    sfpc => sfpcv,
    hsid => hsidv,
    iphst => iphstv,
    ffw => ffwv,
    rlt => rltv,
    pet => petv,
    mtfn => mtfnv,
    lpd => lpdv,
    zpgt => zpgtv,
    dcfsn => dcfsnv,
    sad => sadv,
    ieat => ieatv,
    fcest => fcestv,
    pyear => pyearv,
    icor1 => icor1v,
    icor2 => icor2v,
    alic1 => alic1v,
    alic2 => alic2v,
    iet => ietv,
    iopcd => iopcdv,
    fioac1 => fioac1v,
    fioac2 => fioac2v,
    alsc1 => alsc1v,
    alsc2 => alsc2v,
    scor1 => scor1v,
    scor2 => scor2v,
    lfpf => lfpfv,
    lufdt => lufdtv,
    palt => paltv,
    lfh => lfhv,
    pl => plv,
    alai1 => alai1v,
    alai2 => alai2v,
    lyf1 => lyf1v,
    lyf2 => lyf2v,
    io70 => io70v,
    sd => sdv,
    alln => allnv,
    uildt => uildtv,
    ilf => ilfv,
    sfpc => sfpcv,
    fspd => fspdv,
    eyear => eyearv,
    popi => popiv,
    ioi => ioiv,
    ppolxi => ppolxiv,
    pyear => pyearv,
    exppop => exppopv,
    nri => nriv,
    nruf1 => nruf1v,
    nruf2 => nruf2v,
    popi => popiv,
    gc => gcv,
    pop2 => pop2v,
    zpgt => zpgtv,
    fioaa => fioaav,
    fioas => fioasv,
    fioac => fioacv,
    alic => alicv,
    icor => icorv,
    pyear => pyearv,
    ppgf1 => ppgf1v,
    ppgf21 => ppgf21v,
    frpm => frpmv,
    imef => imefv,
    imti => imtiv,
    fipm => fipmv,
    amti => amtiv,
    pptd1 => pptd1v,
    pptd2 => pptd2v,
    ppol70 => ppol70v,
    ahl70 => ahl70v,
    swat => swatv,
    tdd => tddv,
    pcti => pctiv,
    pd => pdv,
    pyear => pyearv
]
# Initialisations
global u0 = [
    sopc => sopc0,
    hsapc => hsapc0,
    ehspc => ehspc0,
    fpc => fpc0,
    lmf => lmf0,
    lmhs => lmhs0,
    ppolx => ppolx0,
    lmp => lmp0,
    iopc => iopc0,
    cmi => cmi0,
    fpu => fpu0,
    lmc => lmc0,
    le => le0,
    fm => fm0,
    mtf => mtf0,
    frsn => frsn0,
    sfsn => sfsn0,
    dcfs => dcfs0,
    ple => ple0,
    cmple => cmple0,
    dtf => dtf0,
    nfc => nfc0,
    fsafc => fsafc0,
    fcapc => fcapc0,
    fcfpc => fcfpc0,
    fce => fce0,
    tf => tf0,
    br => br0,
    cbr => cbr0,
    p1 => p10,
    p2 => p20,
    p3 => p30,
    p4 => p40,
    ic => ic0,
    sc => sc0,
    cuf => cuf0,
    lufd => lufd0,
    al => al0,
    pal => pal0,
    ai => ai0,
    uil => uil0,
    lfert => lfert0,
    pfr => pfr0,
    nr => nr0,
    ic => ic0,
    pcrum => pcrum0,
    pop => pop0,
    ppgio => ppgio0,
    aiph => aiph0,
    al => al0,
    ppgao => ppgao0,
    ppgr => ppgr0,
    pptd => pptd0,
    ppapr3 => ppapr30,
    ppol => ppol0,
    pcti => pcti0,
    ppgf22 => ppgf220,
    ppolx => ppolx0,
    lmp1 => lmp10,
    lmp2 => lmp20,
    lmp => lmp0,
    plmp => plmp0
]

