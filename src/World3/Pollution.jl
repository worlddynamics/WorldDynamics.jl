module Pollution


using ModelingToolkit

include("../functions.jl")
include("pollution/tables.jl")
include("pollution/parameters.jl")
include("pollution/initialisations.jl")


@register interpolate(x, y::NTuple, xs::Tuple)
@register clip(f1, f2, va, th)
@register switch(v1, v2, z)

@variables t
D = Differential(t)


function population(; name, params=params)
    @variables pop(t) = pop0

    eqs = [
        pop ~ interpolate(t, popt, popts) * 1e8
    ]

    ODESystem(eqs; name)
end

function non_renewable(; name, params=params)
    @variables pcrum(t) = pcrum0

    eqs = [
        pcrum ~ interpolate(t, pcrumt, pcrumts) * 1e-2
    ]

    ODESystem(eqs; name)
end

function agriculture(; name, params=params)
    @variables aiph(t) = aiph0 al(t) = al0

    eqs = [
        aiph ~ interpolate(t, aipht, aiphts)
        al ~ interpolate(t, alt, alts) * 1e8
    ]

    ODESystem(eqs; name)
end

function pollution_damage(; name, params=params)
    @parameters pyear = params[:pyear]

    @variables ppolx(t)
    @variables lmp(t) = lmp0 lmp1(t) = lmp10 lmp2(t) = lmp20 lfdr(t) lfdr1(t) lfdr2(t)

    eqs = [
        lmp ~ clip(lmp2, lmp1, t, pyear)
        lmp1 ~ interpolate(ppolx, lmp1t, lmp1ts)
        lmp2 ~ interpolate(ppolx, lmp2t, lmp2ts)
        lfdr ~ clip(lfdr2, lfdr1, t, pyear)
        lfdr1 ~ interpolate(ppolx, lfdr1t, lfdr1ts)
        lfdr2 ~ interpolate(ppolx, lfdr2t, lfdr2ts)
    ]

    ODESystem(eqs; name)
end

function adaptive_technological_control_cards(; name, params=params)
    @parameters pyear = params[:pyear]
    @parameters tdd = params[:tdd]
    @parameters pd = params[:pd]

    @variables lmp(t)
    @variables ppgf22(t) = ppgf220 ppgf222(t) = ppgf220 ppgf221(t) = ppgf220 pcti(t) = pcti0 plmp(t) = plmp0 plmp2(t) = plmp0 plmp1(t) = plmp0
    @variables pctir(t) pctcm(t)

    eqs = [
        D(ppgf22) ~ 3 * (ppgf222 - ppgf22) / tdd
        D(ppgf222) ~ 3 * (ppgf221 - ppgf222) / tdd
        D(ppgf221) ~ 3 * (pcti - ppgf221) / tdd
        D(pcti) ~ pctir
        pctir ~ clip(pcti * pctcm, 0, t, pyear)
        pctcm ~ interpolate(1 - plmp, pctcmt, pctcmts)
        D(plmp) ~ 3 * (plmp2 - plmp) / pd
        D(plmp2) ~ 3 * (plmp1 - plmp2) / pd
        D(plmp1) ~ 3 * (lmp - plmp1) / pd
    ]

    ODESystem(eqs; name)
end

function persistent_pollution(; name, params=params)
    @parameters pyear = params[:pyear]
    @parameters ppgf1 = params[:ppgf1]
    @parameters ppgf21 = params[:ppgf21]
    @parameters swat = params[:swat]
    @parameters frpm = params[:frpm]
    @parameters imef = params[:imef]
    @parameters imti = params[:imti]
    @parameters fipm = params[:fipm]
    @parameters amti = params[:amti]
    @parameters pptd1 = params[:pptd1]
    @parameters pptd2 = params[:pptd2]
    @parameters ppol70 = params[:ppol70]
    @parameters ahl70 = params[:ahl70]

    @variables ppgf22(t) pcrum(t) pop(t) aiph(t) al(t)
    @variables ppapr3(t) = ppapr30 ppapr2(t) = ppapr30 ppapr1(t) = ppapr30 ppol(t) = ppol0
    @variables ppgr(t) = ppgr0 ppgf(t) ppgf2(t) ppgio(t) = ppgio0 ppgao(t) = ppgao0 ppapr(t) pptd(t) = pptd0 ppolx(t) = ppolx0 ppasr(t) ahlm(t) ahl(t)

    eqs = [
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
    ]

    ODESystem(eqs; name)
end


end # module
