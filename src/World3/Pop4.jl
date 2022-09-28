module Pop4


using ModelingToolkit

include("../functions.jl")

include("population/common_pop/tables.jl")
include("population/common_pop/parameters.jl")
include("population/common_pop/initialisations.jl")
include("population/CommonPop.jl")

include("population/pop4/tables.jl")
include("population/pop4/initialisations.jl")


@register interpolate(x, y::Tuple{Vararg{Float64}}, xs::Tuple{Float64, Float64})
@register clip(f1, f2, va, th)

@variables t
D = Differential(t)


birth_rate = CommonPop.birth_rate
death_rate = CommonPop.death_rate
service_output = CommonPop.service_output
industrial_output = CommonPop.industrial_output
persistent_pollution = CommonPop.persistent_pollution
food = CommonPop.food

params = CommonPop.params
inits = merge(inits, CommonPop.inits)
tables = merge(tables, CommonPop.tables)
ranges = merge(ranges, CommonPop.ranges)

getinitialisations() = copy(inits)
getparameters() = copy(params)
gettables() = copy(tables)
getranges() = copy(ranges)


function population(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @parameters rlt = params[:rlt]
    @parameters pet = params[:pet]

    @variables le(t) tf(t)

    @variables p1(t) = inits[:p1]
    @variables p2(t) = inits[:p2]
    @variables p3(t) = inits[:p3]
    @variables p4(t) = inits[:p4]

    @variables pop(t) d1(t) m1(t) mat1(t) d2(t) m2(t) mat2(t) d3(t) m3(t) mat3(t) d4(t) m4(t) dr(t) br(t)

    eqs = [
        pop ~ p1 + p2 + p3 + p4
        D(p1) ~ br - d1 - mat1
        d1 ~ p1 * m1
        m1 ~ interpolate(le, tables[:m1], ranges[:m1])
        mat1 ~ p1 * (1 - m1) / 15
        D(p2) ~ mat1 - d2 - mat2
        d2 ~ p2 * m2
        m2 ~ interpolate(le, tables[:m2], ranges[:m2])
        mat2 ~ p2 * (1 - m2) / 30
        D(p3) ~ mat2 - d3 - mat3
        d3 ~ p3 * m3
        m3 ~ interpolate(le, tables[:m3], ranges[:m3])
        mat3 ~ p3 * (1 - m3) / 20
        D(p4) ~ mat3 - d4
        d4 ~ p4 * m4
        m4 ~ interpolate(le, tables[:m4], ranges[:m4])
        dr ~ d1 + d2 + d3 + d4
        br ~ clip(dr, tf * p2 * 0.5 / rlt, t, pet)
    ]

    ODESystem(eqs; name)
end


include("../solvesystems.jl")
include("population/pop4/scenarios.jl")
include("population/pop4/plots.jl")


end # module
