module Pollution


using ModelingToolkit

include("../functions.jl")
include("pollution/tables.jl")
include("pollution/parameters.jl")
include("pollution/initialisations.jl")


getinitialisations() = copy(inits)
getparameters() = copy(params)
gettables() = copy(tables)
getranges() = copy(ranges)


@register interpolate(x, y::NTuple, xs::Tuple)
@register clip(f1, f2, va, th)
@register switch(v1, v2, z)

@variables t
D = Differential(t)


function population(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @variables pop(t) = inits[:pop0]

    eqs = [
        pop ~ interpolate(t, tables[:pop], ranges[:pop]) * 1e8
    ]

    ODESystem(eqs; name)
end

function non_renewable(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @variables pcrum(t) = inits[:pcrum0]

    eqs = [
        pcrum ~ interpolate(t, tables[:pcrum], ranges[:pcrum]) * 1e-2
    ]

    ODESystem(eqs; name)
end

function agriculture(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @variables aiph(t) = inits[:aiph0]
    @variables al(t) = inits[:al0]

    eqs = [
        aiph ~ interpolate(t, tables[:aiph], ranges[:aiph])
        al ~ interpolate(t, tables[:al], ranges[:al]) * 1e8
    ]

    ODESystem(eqs; name)
end

function pollution_damage(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @parameters pyear = params[:pyear]

    @variables ppolx(t)
    @variables lmp(t) = inits[:lmp0]
    @variables lmp1(t) = inits[:lmp10]
    @variables lmp2(t) = inits[:lmp20]
    @variables lfdr(t) lfdr1(t) lfdr2(t)

    eqs = [
        lmp ~ clip(lmp2, lmp1, t, pyear)
        lmp1 ~ interpolate(ppolx, tables[:lmp1], ranges[:lmp1])
        lmp2 ~ interpolate(ppolx, tables[:lmp2], ranges[:lmp2])
        lfdr ~ clip(lfdr2, lfdr1, t, pyear)
        lfdr1 ~ interpolate(ppolx, tables[:lfdr1], ranges[:lfdr1])
        lfdr2 ~ interpolate(ppolx, tables[:lfdr2], ranges[:lfdr2])
    ]

    ODESystem(eqs; name)
end

function adaptive_technological_control_cards(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @parameters pyear = params[:pyear]
    @parameters tdd = params[:tdd]
    @parameters pd = params[:pd]

    @variables lmp(t)

    @variables ppgf22(t) = inits[:ppgf220]
    @variables ppgf222(t) = inits[:ppgf220]
    @variables ppgf221(t) = inits[:ppgf220]
    @variables pcti(t) = inits[:pcti0]
    @variables plmp(t) = inits[:plmp0]
    @variables plmp2(t) = inits[:plmp0]
    @variables plmp1(t) = inits[:plmp0]

    @variables pctir(t) pctcm(t)

    eqs = [
        D(ppgf22) ~ 3 * (ppgf222 - ppgf22) / tdd
        D(ppgf222) ~ 3 * (ppgf221 - ppgf222) / tdd
        D(ppgf221) ~ 3 * (pcti - ppgf221) / tdd
        D(pcti) ~ pctir
        pctir ~ clip(pcti * pctcm, 0, t, pyear)
        pctcm ~ interpolate(1 - plmp, tables[:pctcm], ranges[:pctcm])
        D(plmp) ~ 3 * (plmp2 - plmp) / pd
        D(plmp2) ~ 3 * (plmp1 - plmp2) / pd
        D(plmp1) ~ 3 * (lmp - plmp1) / pd
    ]

    ODESystem(eqs; name)
end

function persistent_pollution(; name, params=params, inits=inits, tables=tables, ranges=ranges)
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

    @variables ppapr3(t) = inits[:ppapr30]
    @variables ppapr2(t) = inits[:ppapr30]
    @variables ppapr1(t) = inits[:ppapr30]
    @variables ppol(t) = inits[:ppol0]
    @variables ppgr(t) = inits[:ppgr0]
    @variables ppgio(t) = inits[:ppgio0]
    @variables ppgao(t) = inits[:ppgao0]
    @variables pptd(t) = inits[:pptd0]
    @variables ppolx(t) = inits[:ppolx0]

    @variables ppgf(t) ppgf2(t) ppapr(t) ppasr(t) ahlm(t) ahl(t)

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
        ahlm ~ interpolate(ppolx, tables[:ahlm], ranges[:ahlm])
        ahl ~ ahl70 * ahlm
    ]

    ODESystem(eqs; name)
end


end # module
