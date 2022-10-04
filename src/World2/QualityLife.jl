module QualityLife


using ModelingToolkit
using WorldDynamics

include("qualitylife/tables.jl")
include("qualitylife/parameters.jl")
include("qualitylife/initialisations.jl")


getinitialisations() = copy(inits)
getparameters() = copy(params)
gettables() = copy(tables)
getranges() = copy(ranges)


@register WorldDynamics.interpolate(x, y::Tuple{Vararg{Float64}}, xs::Tuple{Float64, Float64})
@register WorldDynamics.clip(f1, f2, va, th)

@variables t
D = Differential(t)


function quality_life(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @parameters qls = params[:qls]

    @variables ql(t)
    @variables qlm(t)
    @variables qlc(t)
    @variables qlf(t)
    @variables qlp(t)

    @variables msl(t)
    @variables cr(t)
    @variables fr(t)
    @variables polr(t)

    eqs = [
        ql ~ qls * qlm * qlc * qlf * qlp
        qlm ~ interpolate(msl, tables[:qlm], ranges[:qlm])
        qlc ~ interpolate(cr, tables[:qlc], ranges[:qlc])
        qlf ~ interpolate(fr, tables[:qlf], ranges[:qlf])
        qlp ~ interpolate(polr, tables[:qlp], ranges[:qlp])
    ]

    ODESystem(eqs; name)
end


end
