module CommonPop

export death_rate, birth_rate


using Interpolations, ModelingToolkit

include("../functions.jl")
include("tables.jl")
include("parameters.jl")
include("initialisations.jl")


@register interpolate(x, y::NTuple, xs::Tuple)
@register clip(f1, f2, va, th)
@register min(v1, v2)
@register step(t, hght, sttm)

@variables t
D = Differential(t)


function death_rate(; name)
    @parameters len = lenv sfpc = sfpcv hsid = hsidv iphst = iphstv

    @variables dr(t) pop(t)
    @variables fpc(t) sopc(t) iopc(t) ppolx(t)
    @variables ehspc(t) = ehspc0
    @variables cdr(t) le(t) lmf(t) hsapc(t) lmhs(t) lmhs1(t) lmhs2(t) fpu(t) cmi(t) lmc(t) lmp(t)

    eqs = [
        cdr ~ 1000.0 * dr / pop
        le ~ len * lmf * lmhs * lmp * lmc
        lmf ~ interpolate(fpc / sfpc, lmft, lmfts)
        hsapc ~ interpolate(sopc, hsapct, hsapcts)
        D(ehspc) ~ (hsapc - ehspc) / hsid
        lmhs ~ clip(lmhs2, lmhs1, t, iphst)
        lmhs1 ~ interpolate(ehspc, lmhs1t, lmhs1ts)
        lmhs2 ~ interpolate(ehspc, lmhs2t, lmhs2ts)
        fpu ~ interpolate(pop, fput, fputs)
        cmi ~ interpolate(iopc, cmit, cmits)
        lmc ~ 1 - (cmi * fpu)
        lmp ~ interpolate(ppolx, lmpt, lmpts)
    ]

    ODESystem(eqs; name)
end

function birth_rate(; name)
    @parameters mtfn = mtfnv lpd = lpdv dcfsn = dcfsnv zpgt = zpgtv sad = sadv ieat = ieatv fcest = fcestv hsid = hsidv

    @variables br(t) pop(t)
    @variables le(t) iopc(t) sopc(t)
    @variables ple(t) = le0 ple1(t) = le0 ple2(t) = le0 diopc(t) = iopc0 diopc1(t) = iopc0 diopc2(t) = iopc0 aiopc(t) = iopc0 fcfpc(t) = fcapc0 fcfpc2(t) = fcapc0 fcfpc1(t) = fcapc0 
    @variables cbr(t) tf(t) mtf(t) fm(t) dtf(t) cmple(t) dcfs(t) sfsn(t) frsn(t) fie(t) nfc(t) fce(t) fcapc(t) fsafc(t) 

    eqs = [
        cbr ~ 1000.0 * br / pop
        tf ~ min(mtf, mtf * (1 - fce) + dtf * fce)
        mtf ~ mtfn * fm
        fm ~ interpolate(le, fmt, fmts)
        dtf ~ dcfs * cmple
        cmple ~ interpolate(ple, cmplet, cmplets)
        D(ple) ~ 3 * (ple2 - ple) / lpd
        D(ple2) ~ 3 * (ple1 - ple2) / lpd
        D(ple1) ~ 3 * (le - ple1) / lpd
        dcfs ~ clip(2, dcfsn * frsn * sfsn, t, zpgt)
        sfsn ~ interpolate(diopc, sfsnt, sfsnts)
        D(diopc) ~ 3 * (diopc2 - diopc) / sad
        D(diopc2) ~ 3 * (diopc1 - diopc2) / sad
        D(diopc1) ~ 3 * (iopc - diopc1) / sad
        frsn ~ clip(interpolate(fie, frsnt, frsnts), 0.82, t, t0 + 1)
        fie ~ (iopc - aiopc) / aiopc
        D(aiopc) ~ (iopc - aiopc) / ieat
        nfc ~ (mtf / dtf) - 1
        fce ~ clip(1.0, interpolate(fcfpc, fcet, fcets), t, fcest)
        D(fcfpc) ~ 3 * (fcfpc2 - fcfpc) / hsid
        D(fcfpc2) ~ 3 * (fcfpc1 - fcfpc2) / hsid
        D(fcfpc1) ~ 3 * (fcapc - fcfpc1) / hsid
        fcapc ~ fsafc * sopc
        fsafc ~ interpolate(nfc, fsafct, fsafcts)
    ]

    ODESystem(eqs; name)
end

function industrial_output(; name)
    @parameters lt = ltv lt2 = lt2v cio = ciov

    @variables pop(t)
    @variables io(t) io1(t) io11(t) io12(t) io2(t) iopc(t)

    eqs = [
        io ~ clip(io2, io1, t, lt)
        io1 ~ clip(io12, io11, t, lt2)
        io11 ~ 0.7e11 * exp((t - 1900) * 0.037)
        io12 ~ pop * cio
        io2 ~ 0.7e11 * exp((lt - 1900) * 0.037)
        iopc ~ io / pop
    ]

    ODESystem(eqs; name)
end

function service_output(; name)
    @parameters lt = ltv lt2 = lt2v cso = csov

    @variables pop(t)
    @variables so(t) so1(t) so11(t) so12(t) so2(t) sopc(t)

    eqs = [
        so ~ clip(so2, so1, t, lt)
        so1 ~ clip(so12, so11, t, lt2)
        so11 ~ 1.5e11 * exp((t - 1900) * 0.030)
        so12 ~ pop * cso
        so2 ~ 1.5e11 * exp((lt - 1900) * 0.030)
        sopc ~ so / pop
    ]

    ODESystem(eqs; name)
end

function persistent_pollution(; name)
    @parameters ps = psv pt = ptv

    @variables ppolx(t) = ppolx0

    eqs = [
        D(ppolx) ~ step(t, ps, pt)
    ]

    ODESystem(eqs; name)
end

function food(; name)
    @parameters lt = ltv lt2 = lt2v cfood = cfoodv

    @variables pop(t) 
    @variables f(t) f1(t) f11(t) f12(t) f2(t) fpc(t)

    eqs = [
        f ~ clip(f2, f1, t, lt)
        f1 ~ clip(f12, f11, t, lt2)
        f11 ~ 4e11 * exp((t - 1900) * 0.020)
        f12 ~ pop * cfood
        f2 ~ 4e11 * exp((lt - 1900) * 0.020)
        fpc ~ f / pop
    ]

    ODESystem(eqs; name)
end


end # module
