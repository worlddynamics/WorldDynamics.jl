module CommonPop

export death_rate, birth_rate


using ModelingToolkit

include("../../functions.jl")
include("common_pop/tables.jl")
include("common_pop/parameters.jl")
include("common_pop/initialisations.jl")


@register interpolate(x, y::Tuple{Vararg{Float64}}, xs::Tuple{Float64, Float64})
@register clip(f1, f2, va, th)
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
    @variables ehspc(t) = inits[:hsapc] # Line 22 Appendix A
    @variables cdr(t) le(t) lmf(t) hsapc(t) lmhs(t) lmhs1(t) lmhs2(t) fpu(t) cmi(t) lmc(t) lmp(t)

    eqs = [
        cdr ~ 1000.0 * dr / pop # Line 18 Appendix A
        le ~ len * lmf * lmhs * lmp * lmc # Line 19 Appendix A
        lmf ~ interpolate(fpc / sfpc, tables[:lmf], ranges[:lmf]) # Line 20 Appendix A
        hsapc ~ interpolate(sopc, tables[:hsapc], ranges[:hsapc]) # Line 21 Appendix A
        D(ehspc) ~ (hsapc - ehspc) / hsid # Line 22 Appendix A
        lmhs ~ clip(lmhs2, lmhs1, t, iphst) # Line 23 Appendix A
        lmhs1 ~ interpolate(ehspc, tables[:lmhs1], ranges[:lmhs1]) # Line 24 Appendix A
        lmhs2 ~ interpolate(ehspc, tables[:lmhs2], ranges[:lmhs2]) # Line 25 Appendix A
        fpu ~ interpolate(pop, tables[:fpu], ranges[:fpu]) # Line 26 Appendix A
        cmi ~ interpolate(iopc, tables[:cmi], ranges[:cmi]) # Line 27 Appendix A
        lmc ~ 1 - (cmi * fpu) # Line 28 Appendix A
        lmp ~ interpolate(ppolx, tables[:lmp], ranges[:lmp]) # Line 29 Appendix A
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

    @variables ple(t) = inits[:le] # Line 37 Appendix A
    @variables ple1(t) = inits[:le] # Line 37 Appendix A
    @variables ple2(t) = inits[:le] # Line 37 Appendix A
    @variables diopc(t) = inits[:iopc] # Line 40 Appendix A
    @variables diopc1(t) = inits[:iopc] # Line 40 Appendix A
    @variables diopc2(t) = inits[:iopc] # Line 40 Appendix A
    @variables frsn(t) = inits[:frsn] # Line 41.2 Appendix A
    @variables aiopc(t) = inits[:iopc]  # Line 43 Appendix A
    @variables fcfpc(t) = inits[:fcapc] # Line 46 Appendix A
    @variables fcfpc2(t) = inits[:fcapc] # Line 46 Appendix A
    @variables fcfpc1(t) = inits[:fcapc] # Line 46 Appendix A

    @variables cbr(t) tf(t) mtf(t) fm(t) dtf(t) cmple(t) dcfs(t) sfsn(t) fie(t) nfc(t) fce(t) fcapc(t) fsafc(t)

    eqs = [
        cbr ~ 1000.0 * br / pop # Line 31 Appendix A
        tf ~ min(mtf, mtf * (1.0 - fce) + dtf * fce) # Line 32 Appendix A
        mtf ~ mtfn * fm # Line 33 Appendix A
        fm ~ interpolate(le, tables[:fm], ranges[:fm]) # Line 34 Appendix A
        dtf ~ dcfs * cmple # Line 35 Appendix A
        cmple ~ interpolate(ple, tables[:cmple], ranges[:cmple]) # Line 36 Appendix A
        D(ple) ~ 3 * (ple2 - ple) / lpd # Line 37 Appendix A
        D(ple2) ~ 3 * (ple1 - ple2) / lpd # Line 37 Appendix A
        D(ple1) ~ 3 * (le - ple1) / lpd # Line 37 Appendix A
        dcfs ~ clip(2.0, dcfsn * frsn * sfsn, t, zpgt) # Line 38 Appendix A
        sfsn ~ interpolate(diopc, tables[:sfsn], ranges[:sfsn]) # Line 39 Appendix A
        D(diopc) ~ 3 * (diopc2 - diopc) / sad # Line 40 Appendix A
        D(diopc2) ~ 3 * (diopc1 - diopc2) / sad # Line 40 Appendix A
        D(diopc1) ~ 3 * (iopc - diopc1) / sad # Line 40 Appendix A
        frsn ~ interpolate(fie, tables[:frsn], ranges[:frsn]) # Line 41 Appendix A
        fie ~ (iopc - aiopc) / aiopc # Line 42 Appendix A
        D(aiopc) ~ (iopc - aiopc) / ieat # Line 43 Appendix A
        nfc ~ (mtf / dtf) - 1 # Line 44 Appendix A
        fce ~ clip(1.0, interpolate(fcfpc, tables[:fce], ranges[:fce]), t, fcest) # Line 45 Appendix A
        D(fcfpc) ~ 3 * (fcfpc2 - fcfpc) / hsid # Line 46 Appendix A
        D(fcfpc2) ~ 3 * (fcfpc1 - fcfpc2) / hsid # Line 46 Appendix A
        D(fcfpc1) ~ 3 * (fcapc - fcfpc1) / hsid # Line 46 Appendix A
        fcapc ~ fsafc * sopc # Line 47 Appendix A
        fsafc ~ interpolate(nfc, tables[:fsafc], ranges[:fsafc]) # Line 48 Appendix A
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
