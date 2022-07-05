module Agriculture


using ModelingToolkit

include("../functions.jl")
include("agriculture/tables.jl")
include("agriculture/parameters.jl")
include("agriculture/initialisations.jl")


@register interpolate(x, y::NTuple, xs::Tuple)
@register clip(f1, f2, va, th)
@register max(v1, v2)

@variables t
D = Differential(t)


function population(; name, params=params, inits=inits)
    @parameters popi = params[:popi]
    @parameters exppop = params[:exppop]
    @parameters eyear = params[:eyear]

    @variables pop(t) pop1(t) pop2(t)

    eqs = [
        pop ~ clip(pop2, pop1, t, eyear)
        # TODO: if we put the correct value of 0.012, the code breaks
        #  I have to investigate more
        pop1 ~ popi * exp(exppop * (t - 1900))
        pop2 ~ popi * exp(exppop * (eyear - 1900.0))
    ]

    ODESystem(eqs; name)
end

function industrial_output(; name, params=params, inits=inits)
    @parameters eyear = params[:eyear]
    @parameters ioi = params[:ioi]

    @variables pop(t)
    @variables io(t) io1(t) io2(t) iopc(t)

    eqs = [
        io ~ clip(io2, io1, t, eyear)
        io1 ~ ioi * exp(0.036 * (t - 1900.0))
        io2 ~ ioi * exp(0.036 * (eyear - 1900.0))
        iopc ~ io / pop
    ]

    ODESystem(eqs; name)
end

function persistent_pollution(; name, params=params, inits=inits)
    @parameters eyear = params[:eyear]
    @parameters ppolxi = params[:ppolxi]

    @variables ppolx(t) ppolx1(t) ppolx2(t)

    eqs = [
        ppolx ~ clip(ppolx2, ppolx1, t, eyear)
        ppolx1 ~ ppolxi * exp(0.03 * (t - 1900.0))
        ppolx2 ~ ppolxi * exp(0.03 * (eyear - 1900.0))
    ]

    ODESystem(eqs; name)
end

function land_development(; name, params=params, inits=inits)
    @parameters palt = params[:palt]
    @parameters lfh = params[:lfh]
    @parameters pl = params[:pl]
    @parameters pyear = params[:pyear]

    @variables ler(t) lrui(t) ly(t) pop(t) iopc(t) io(t) fiald(t)

    @variables al(t) = inits[:al0]
    @variables pal(t) = inits[:pal0]

    @variables lfc(t) f(t) fpc(t) ifpc(t) ifpc1(t) ifpc2(t) tai(t) fioaa(t) fioaa1(t) fioaa2(t) ldr(t) dcph(t)

    eqs = [
        lfc ~ al / palt
        D(al) ~ ldr - ler - lrui
        D(pal) ~ -ldr
        f ~ ly * al * lfh * (1 - pl)
        fpc ~ f / pop
        ifpc ~ clip(ifpc2, ifpc1, t, pyear)
        ifpc1 ~ interpolate(iopc, ifpc1t, ifpc1ts)
        ifpc2 ~ interpolate(iopc, ifpc2t, ifpc2ts)
        tai ~ io * fioaa
        fioaa ~ clip(fioaa2, fioaa1, t, pyear)
        fioaa1 ~ interpolate(fpc / ifpc, fioaa1t, fioaa1ts)
        fioaa2 ~ interpolate(fpc / ifpc, fioaa2t, fioaa2ts)
        ldr ~ tai * fiald / dcph
        dcph ~ interpolate(pal / palt, dcpht, dcphts)
    ]

    ODESystem(eqs; name)
end

function agricultural_inputs(; name, params=params, inits=inits)
    @parameters pyear = params[:pyear]
    @parameters alai1 = params[:alai1]
    @parameters alai2 = params[:alai2]
    @parameters lyf1 = params[:lyf1]
    @parameters lyf2 = params[:lyf2]
    @parameters io70 = params[:io70]

    @variables tai(t) fiald(t) falm(t) al(t) lfert(t) io(t)
    @variables ai(t) = inits[:ai0]
    @variables cai(t) alai(t) aiph(t) lymc(t) ly(t) lyf(t) lymap(t) lymap1(t) lymap2(t)

    eqs = [
        cai ~ tai * (1 - fiald)
        D(ai) ~ (cai - ai) / alai
        alai ~ clip(alai2, alai1, t, pyear)
        aiph ~ ai * (1 - falm) / al
        lymc ~ interpolate(aiph, lymct, lymcts)
        ly ~ lyf * lfert * lymc * lymap
        lyf ~ clip(lyf2, lyf1, t, pyear)
        lymap ~ clip(lymap2, lymap1, t, pyear)
        lymap1 ~ interpolate(io / io70, lymap1t, lymap1ts)
        lymap2 ~ interpolate(io / io70, lymap2t, lymap2ts)
    ]

    ODESystem(eqs; name)
end

function investment_allocation_decision(; name, params=params, inits=inits)
    @parameters sd = params[:sd]

    @variables ly(t) dcph(t) alai(t) lymc(t) aiph(t)
    @variables fiald(t) mpld(t) mpai(t) mlymc(t)

    eqs = [
        fiald ~ interpolate(mpld / mpai, fialdt, fialdts)
        mpld ~ ly / (dcph * sd)
        mpai ~ alai * ly * mlymc / lymc
        mlymc ~ interpolate(aiph, mlymct, mlymcts)
    ]

    ODESystem(eqs; name)
end

function land_erosion_urban_industrial_use(; name, params=params, inits=inits)
    @parameters alln = params[:alln]
    @parameters pyear = params[:pyear]
    @parameters ilf = params[:ilf]
    @parameters uildt = params[:uildt]

    @variables ly(t) al(t) iopc(t) pop(t)
    @variables uil(t) = inits[:uil0]
    @variables all(t) llmy(t) llmy1(t) llmy2(t) ler(t) uilpc(t) uilr(t) lrui(t)

    eqs = [
        all ~ alln * llmy
        llmy ~ clip(llmy2, llmy1, t, pyear)
        llmy1 ~ interpolate(ly / ilf, llmy1t, llmy1ts)
        llmy2 ~ interpolate(ly / ilf, llmy2t, llmy2ts)
        ler ~ al / all
        uilpc ~ interpolate(iopc, uilpct, uilpcts)
        uilr ~ uilpc * pop
        lrui ~ max(0, (uilr - uil) / uildt)
        D(uil) ~ lrui
    ]

    ODESystem(eqs; name)
end

function discontinung_land_maintenance(; name, params=params, inits=inits)
    @parameters sfpc = params[:sfpc]
    @parameters fspd = params[:fspd]

    @variables fpc(t)
    @variables pfr(t) = inits[:pfr0]
    @variables falm(t) fr(t)

    eqs = [
        falm ~ interpolate(pfr, falmt, falmts)
        fr ~ fpc / sfpc
        D(pfr) ~ (fr - pfr) / fspd
    ]

    ODESystem(eqs; name)
end

function land_fertility_regeneration(; name, params=params, inits=inits)
    @parameters ilf = params[:ilf]

    @variables lfert(t) falm(t)
    @variables lfr(t) lfrt(t)

    eqs = [
        lfr ~ (ilf - lfert) / lfrt
        lfrt ~ interpolate(falm, lfrtt, lfrtts)
    ]

    ODESystem(eqs; name)
end

function land_fertility_degradation(; name, params=params, inits=inits)
    @variables lfr(t) ppolx(t)
    @variables lfert(t) = inits[:lfert0]
    @variables lfdr(t) lfd(t)

    eqs = [
        D(lfert) ~ lfr - lfd
        lfdr ~ interpolate(ppolx, lfdrt, lfdrts)
        lfd ~ lfert * lfdr
    ]

    ODESystem(eqs; name)
end


end # module
