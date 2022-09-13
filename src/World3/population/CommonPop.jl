module CommonPop

export death_rate, birth_rate


using ModelingToolkit

include("../../functions.jl")
include("common_pop/tables.jl")
include("common_pop/parameters.jl")
include("common_pop/initialisations.jl")


@register interpolate(x, y::NTuple, xs::Tuple)
@register clip(f1, f2, va, th)
@register min(v1, v2)
@register step(t, hght, sttm)

@variables t
D = Differential(t)


function death_rate(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @parameters len = params[:len]
    @parameters sfpc = params[:sfpc]
    @parameters hsid = params[:hsid]
    @parameters iphst = params[:iphst]

    @variables dr(t) pop(t)
    @variables fpc(t) sopc(t) iopc(t) ppolx(t)
    @variables ehspc(t) = inits[:ehspc]
    @variables cdr(t) le(t) lmf(t) hsapc(t) lmhs(t) lmhs1(t) lmhs2(t) fpu(t) cmi(t) lmc(t) lmp(t)

    eqs = [
        cdr ~ 1000.0 * dr / pop
        le ~ len * lmf * lmhs * lmp * lmc
        lmf ~ interpolate(fpc / sfpc, tables[:lmf], ranges[:lmf])
        hsapc ~ interpolate(sopc, tables[:hsapc], ranges[:hsapc])
        D(ehspc) ~ (hsapc - ehspc) / hsid
        lmhs ~ clip(lmhs2, lmhs1, t, iphst)
        lmhs1 ~ interpolate(ehspc, tables[:lmhs1], ranges[:lmhs1])
        lmhs2 ~ interpolate(ehspc, tables[:lmhs2], ranges[:lmhs2])
        fpu ~ interpolate(pop, tables[:fpu], ranges[:fpu])
        cmi ~ interpolate(iopc, tables[:cmi], ranges[:cmi])
        lmc ~ 1 - (cmi * fpu)
        lmp ~ interpolate(ppolx, tables[:lmp], ranges[:lmp])
    ]

    ODESystem(eqs; name)
end

function birth_rate(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @parameters mtfn = params[:mtfn]
    @parameters lpd = params[:lpd]
    @parameters dcfsn = params[:dcfsn]
    @parameters zpgt = params[:zpgt]
    @parameters sad = params[:sad]
    @parameters ieat = params[:ieat]
    @parameters fcest = params[:fcest]
    @parameters hsid = params[:hsid]

    @variables br(t) pop(t)
    @variables le(t) iopc(t) sopc(t)

    @variables ple(t) = inits[:le]
    @variables ple1(t) = inits[:le]
    @variables ple2(t) = inits[:le]
    @variables diopc(t) = inits[:iopc]
    @variables diopc1(t) = inits[:iopc]
    @variables diopc2(t) = inits[:iopc]
    @variables aiopc(t) = inits[:iopc]
    @variables fcfpc(t) = inits[:fcapc]
    @variables fcfpc2(t) = inits[:fcapc]
    @variables fcfpc1(t) = inits[:fcapc]

    @variables cbr(t) tf(t) mtf(t) fm(t) dtf(t) cmple(t) dcfs(t) sfsn(t) frsn(t) fie(t) nfc(t) fce(t) fcapc(t) fsafc(t)

    eqs = [
        cbr ~ 1000.0 * br / pop
        tf ~ min(mtf, mtf * (1.0 - fce) + dtf * fce)
        mtf ~ mtfn * fm
        fm ~ interpolate(le, tables[:fm], ranges[:fm])
        dtf ~ dcfs * cmple
        cmple ~ interpolate(ple, tables[:cmple], ranges[:cmple])
        D(ple) ~ 3 * (ple2 - ple) / lpd
        D(ple2) ~ 3 * (ple1 - ple2) / lpd
        D(ple1) ~ 3 * (le - ple1) / lpd
        dcfs ~ clip(2.0, dcfsn * frsn * sfsn, t, zpgt)
        sfsn ~ interpolate(diopc, tables[:sfsn], ranges[:sfsn])
        D(diopc) ~ 3 * (diopc2 - diopc) / sad
        D(diopc2) ~ 3 * (diopc1 - diopc2) / sad
        D(diopc1) ~ 3 * (iopc - diopc1) / sad
        frsn ~ clip(interpolate(fie, tables[:frsn], ranges[:frsn]), 0.82, t, inits[:t0] + 1.0)
        fie ~ (iopc - aiopc) / aiopc
        D(aiopc) ~ (iopc - aiopc) / ieat
        nfc ~ (mtf / dtf) - 1
        fce ~ clip(1.0, interpolate(fcfpc, tables[:fce], ranges[:fce]), t, fcest)
        D(fcfpc) ~ 3 * (fcfpc2 - fcfpc) / hsid
        D(fcfpc2) ~ 3 * (fcfpc1 - fcfpc2) / hsid
        D(fcfpc1) ~ 3 * (fcapc - fcfpc1) / hsid
        fcapc ~ fsafc * sopc
        fsafc ~ interpolate(nfc, tables[:fsafc], ranges[:fsafc])
    ]

    ODESystem(eqs; name)
end

function industrial_output(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @parameters lt = params[:lt]
    @parameters lt2 = params[:lt2]
    @parameters cio = params[:cio]

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

function service_output(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @parameters lt = params[:lt]
    @parameters lt2 = params[:lt2]
    @parameters cso = params[:cso]

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

function persistent_pollution(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @parameters ps = params[:ps]
    @parameters pt = params[:pt]

    @variables ppolx(t) = inits[:ppolx]

    eqs = [
        D(ppolx) ~ step(t, ps, pt)
    ]

    ODESystem(eqs; name)
end

function food(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @parameters lt = params[:lt]
    @parameters lt2 = params[:lt2]
    @parameters cfood = params[:cfood]

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
