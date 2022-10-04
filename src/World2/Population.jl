module Population


using ModelingToolkit
using WorldDynamics

include("population/tables.jl")
include("population/parameters.jl")
include("population/initialisations.jl")


getinitialisations() = copy(inits)
getparameters() = copy(params)
gettables() = copy(tables)
getranges() = copy(ranges)

@variables t
D = Differential(t)


function population(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @parameters la = params[:la]
    @parameters pdn = params[:pdn]

    @variables p(t) = inits[:p]
    @variables cr(t)

    @variables br(t)
    @variables dr(t)

    eqs = [
        D(p) ~ br - dr
        cr ~ p / (la * pdn)
    ]

    ODESystem(eqs; name)
end

function birth_rate(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @parameters brn = params[:brn]
    @parameters brn1 = params[:brn1]
    @parameters swt1 = params[:swt1]

    @variables br(t)
    @variables brfm(t)
    @variables brmm(t)
    @variables brcm(t)
    @variables brpm(t)

    @variables p(t)
    @variables msl(t)
    @variables cr(t)
    @variables fr(t)
    @variables polr(t)

    eqs = [
        br ~ p * clip(brn, brn1, swt1, t) * brfm * brmm * brcm * brpm
        brmm ~ interpolate(msl, tables[:brmm], ranges[:brmm])
        brcm ~ interpolate(cr, tables[:brcm], ranges[:brcm])
        brfm ~ interpolate(fr, tables[:brfm], ranges[:brfm])
        brpm ~ interpolate(polr, tables[:brpm], ranges[:brpm])
    ]

    ODESystem(eqs; name)
end

function death_rate(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @parameters drn = params[:drn]
    @parameters drn1 = params[:drn1]
    @parameters swt3 = params[:swt3]

    @variables dr(t)
    @variables drfm(t)
    @variables drmm(t)
    @variables drcm(t)
    @variables drpm(t)

    @variables p(t)
    @variables msl(t)
    @variables cr(t)
    @variables fr(t)
    @variables polr(t)

    eqs = [
        dr ~ p * clip(drn, drn1, swt3, t) * drfm * drmm * drcm * drpm
        drmm ~ interpolate(msl, tables[:drmm], ranges[:drmm])
        drcm ~ interpolate(cr, tables[:drcm], ranges[:drcm])
        drfm ~ interpolate(fr, tables[:drfm], ranges[:drfm])
        drpm ~ interpolate(polr, tables[:drpm], ranges[:drpm])
    ]

    ODESystem(eqs; name)
end


end
