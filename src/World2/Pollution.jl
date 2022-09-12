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

@variables t
D = Differential(t)


function pollution(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @parameters pols = params[:pols]

    @variables polr(t)
    @variables pol(t) = inits[:pol]

    @variables polg(t)
    @variables pola(t)

    eqs = [
        polr ~ pol / pols
        D(pol) ~ polg - pola
    ]

    ODESystem(eqs; name)
end

function pollution_absorption(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @variables pola(t)
    @variables polat(t)

    @variables pol(t)
    @variables polr(t)

    eqs = [
        pola ~ pol / polat
        polat ~ interpolate(polr, tables[:polat], ranges[:polat])
    ]

    ODESystem(eqs; name)
end

function pollution_generation(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @parameters poln = params[:poln]
    @parameters poln1 = params[:poln1]
    @parameters swt6 = params[:swt6]

    @variables polg(t)
    @variables polcm(t)

    @variables p(t)
    @variables cir(t)

    eqs = [
        polg ~ p * clip(poln, poln1, swt6, t) * polcm
        polcm ~ interpolate(cir, tables[:polcm], ranges[:polcm])
    ]

    ODESystem(eqs; name)
end


end
