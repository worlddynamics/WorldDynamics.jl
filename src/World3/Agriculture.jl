module Agriculture


using ModelingToolkit
using WorldDynamics

include("agriculture/tables.jl")
include("agriculture/parameters.jl")
include("agriculture/initialisations.jl")


getinitialisations() = copy(inits)
getparameters() = copy(params)
gettables() = copy(tables)
getranges() = copy(ranges)

@variables t
D = Differential(t)


function population(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @parameters popi = params[:popi]
    @parameters exppop = params[:exppop]
    @parameters eyear = params[:eyear]

    @variables pop(t) pop1(t) pop2(t)

    eqs = [
        pop ~ clip(pop2, pop1, t, eyear)
        pop1 ~ popi * exp(exppop * (t - 1900))
        pop2 ~ popi * exp(exppop * (eyear - 1900.0))
    ]

    ODESystem(eqs; name)
end

function industrial_output(; name, params=params, inits=inits, tables=tables, ranges=ranges)
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

function persistent_pollution(; name, params=params, inits=inits, tables=tables, ranges=ranges)
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

function land_development(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @parameters palt = params[:palt]
    @parameters lfh = params[:lfh]
    @parameters pl = params[:pl]
    @parameters pyear = params[:pyear]

    @variables ler(t) lrui(t) ly(t) pop(t) iopc(t) io(t) fiald(t)

    @variables al(t) = inits[:al] # Line 85.1 Appendix A
    @variables pal(t) = inits[:pal] # Line 86.1 Appendix A

    @variables lfc(t) f(t) fpc(t) ifpc(t) ifpc1(t) ifpc2(t) tai(t) fioaa(t) fioaa1(t) fioaa2(t) ldr(t) dcph(t)

    eqs = [
        lfc ~ al / palt # Line 84 Appendix A
        D(al) ~ ldr - ler - lrui # Line 85 Appendix A
        D(pal) ~ -ldr # Line 86 Appendix A
        f ~ ly * al * lfh * (1 - pl) # Line 87 Appendix A
        fpc ~ f / pop # Line 88 Appendix A
        ifpc ~ clip(ifpc2, ifpc1, t, pyear) # Line 89 Appendix A
        ifpc1 ~ interpolate(iopc, tables[:ifpc1], ranges[:ifpc1]) # Line 90 Appendix A
        ifpc2 ~ interpolate(iopc, tables[:ifpc2], ranges[:ifpc2]) # Line 91 Appendix A
        tai ~ io * fioaa # Line 92 Appendix A
        fioaa ~ clip(fioaa2, fioaa1, t, pyear) # Line 93 Appendix A
        fioaa1 ~ interpolate(fpc / ifpc, tables[:fioaa1], ranges[:fioaa1]) # Line 94 Appendix A
        fioaa2 ~ interpolate(fpc / ifpc, tables[:fioaa2], ranges[:fioaa2]) # Line 95 Appendix A
        ldr ~ tai * fiald / dcph # Line 96 Appendix A
        dcph ~ interpolate(pal / palt, tables[:dcph], ranges[:dcph]) # Line 97 Appendix A
    ]

    ODESystem(eqs; name)
end

function agricultural_inputs(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @parameters pyear = params[:pyear]
    @parameters alai1 = params[:alai1]
    @parameters alai2 = params[:alai2]
    @parameters lyf1 = params[:lyf1]
    @parameters lyf2 = params[:lyf2]
    @parameters io70 = params[:io70]

    @variables tai(t) fiald(t) falm(t) al(t) lfert(t) io(t)
    @variables ai(t) = inits[:ai]
    @variables cai(t) alai(t) aiph(t) lymc(t) ly(t) lyf(t) lymap(t) lymap1(t) lymap2(t)

    eqs = [
        cai ~ tai * (1 - fiald) # Line 98 Appendix A
        D(ai) ~ (cai - ai) / alai # Line 99 Appendix A
        alai ~ clip(alai2, alai1, t, pyear) # Line 100 Appendix A
        aiph ~ ai * (1 - falm) / al # Line 101 Appendix A
        lymc ~ interpolate(aiph, tables[:lymc], ranges[:lymc]) # Line 102 Appendix A
        ly ~ lyf * lfert * lymc * lymap # Line 103 Appendix A
        lyf ~ clip(lyf2, lyf1, t, pyear) # Line 104 Appendix A
        lymap ~ clip(lymap2, lymap1, t, pyear) # Line 105 Appendix A
        lymap1 ~ interpolate(io / io70, tables[:lymap1], ranges[:lymap1]) # Line 106 Appendix A
        lymap2 ~ interpolate(io / io70, tables[:lymap2], ranges[:lymap2]) # Line 106 Appendix A
    ]

    ODESystem(eqs; name)
end

function investment_allocation_decision(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @parameters sd = params[:sd]

    @variables ly(t) dcph(t) alai(t) lymc(t) aiph(t)
    @variables fiald(t) mpld(t) mpai(t) mlymc(t)

    eqs = [
        fiald ~ interpolate(mpld / mpai, tables[:fiald], ranges[:fiald]) # Line 108 Appendix A
        mpld ~ ly / (dcph * sd) # Line 109 Appendix A
        mpai ~ alai * ly * mlymc / lymc  # Line 110 Appendix A
        mlymc ~ interpolate(aiph, tables[:mlymc], ranges[:mlymc]) # Line 111 Appendix A
    ]

    ODESystem(eqs; name)
end

function land_erosion_urban_industrial_use(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @parameters alln = params[:alln]
    @parameters pyear = params[:pyear]
    @parameters ilf = params[:ilf]
    @parameters uildt = params[:uildt]

    @variables ly(t) al(t) iopc(t) pop(t)
    @variables uil(t) = inits[:uil] # Line 120.1 Appendix A
    @variables all(t) llmy(t) llmy1(t) llmy2(t) ler(t) uilpc(t) uilr(t) lrui(t)

    eqs = [
        all ~ alln * llmy # Line 112 Appendix A
        llmy ~ clip(llmy2, llmy1, t, pyear) # Line 113 Appendix A
        llmy1 ~ interpolate(ly / ilf, tables[:llmy1], ranges[:llmy1]) # Line 114 Appendix A
        llmy2 ~ interpolate(ly / ilf, tables[:llmy2], ranges[:llmy2]) # Line 115 Appendix A
        ler ~ al / all # Line 116 Appendix A
        uilpc ~ interpolate(iopc, tables[:uilpc], ranges[:uilpc]) # Line 117 Appendix A
        uilr ~ uilpc * pop # Line 118 Appendix A
        lrui ~ max(0.0, (uilr - uil) / uildt) # Line 119 Appendix A
        D(uil) ~ lrui # Line 120 Appendix A
    ]

    ODESystem(eqs; name)
end

function land_fertility_degradation(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @variables lfr(t) ppolx(t)
    @variables lfert(t) = inits[:lfert] # Line 121.1 Appendix A
    @variables lfdr(t) lfd(t)

    eqs = [
        D(lfert) ~ lfr - lfd # Line 121 Appendix A
        lfdr ~ interpolate(ppolx, tables[:lfdr], ranges[:lfdr]) # Line 122 Appendix A
        lfd ~ lfert * lfdr # Line 123 Appendix A
    ]

    ODESystem(eqs; name)
end

function land_fertility_regeneration(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @parameters ilf = params[:ilf]

    @variables lfert(t) falm(t)
    @variables lfr(t) lfrt(t)

    eqs = [
        lfr ~ (ilf - lfert) / lfrt # Line 124 Appendix A
        lfrt ~ interpolate(falm, tables[:lfrt], ranges[:lfrt]) # Line 125 Appendix A
    ]

    ODESystem(eqs; name)
end

function discontinuing_land_maintenance(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @parameters sfpc = params[:sfpc]
    @parameters fspd = params[:fspd]

    @variables fpc(t)
    @variables pfr(t) = inits[:pfr] # Line 128.1 Appendix A
    @variables falm(t) fr(t)

    eqs = [
        falm ~ interpolate(pfr, tables[:falm], ranges[:falm]) # Line 126 Appendix A
        fr ~ fpc / sfpc # Line 127 Appendix A
        D(pfr) ~ (fr - pfr) / fspd # Line 128 Appendix A
    ]

    ODESystem(eqs; name)
end


include("agriculture/scenarios.jl")
include("agriculture/plots.jl")


end # module
