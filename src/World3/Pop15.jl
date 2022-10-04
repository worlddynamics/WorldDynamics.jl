module Pop15


using ModelingToolkit
using WorldDynamics

include("population/common_pop/tables.jl")
include("population/common_pop/parameters.jl")
include("population/common_pop/initialisations.jl")
include("population/CommonPop.jl")
include("population/pop15/tables.jl")
include("population/pop15/initialisations.jl")


@register WorldDynamics.interpolate(x, y::Tuple{Vararg{Float64}}, xs::Tuple{Float64, Float64})
@register WorldDynamics.clip(f1, f2, va, th)

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
    @parameters pet = params[:pet]

    @variables le(t) tf(t)

    @variables p1(t) = inits[:p1]
    @variables p2(t) = inits[:p2]
    @variables p3(t) = inits[:p3]
    @variables p4(t) = inits[:p4]
    @variables p5(t) = inits[:p5]
    @variables p6(t) = inits[:p6]
    @variables p7(t) = inits[:p7]
    @variables p8(t) = inits[:p8]
    @variables p9(t) = inits[:p9]
    @variables p10(t) = inits[:p10]
    @variables p11(t) = inits[:p11]
    @variables p12(t) = inits[:p12]
    @variables p13(t) = inits[:p13]
    @variables p14(t) = inits[:p14]
    @variables p15(t) = inits[:p15]

    @variables d1a(t) m1(t) d1(t) mat1(t) d2a(t) m2(t) d2(t) mat2(t) d3a(t) m3(t) d3(t) mat3(t) d4a(t) m4(t) d4(t) mat4(t)
    @variables d5a(t) m5(t) d5(t) mat5(t) d6a(t) m6(t) d6(t) mat6(t) d7a(t) m7(t) d7(t) mat7(t) d8a(t) m8(t) d8(t) mat8(t)
    @variables d9a(t) m9(t) d9(t) mat9(t) d10a(t) m10(t) d10(t) mat10(t) d11a(t) m11(t) d11(t) mat11(t) d12a(t) m12(t) d12(t) mat12(t)
    @variables d13a(t) m13(t) d13(t) mat13(t) d14a(t) m14(t) d14(t) mat14(t) d15(t) m15(t) dr(t) pop(t) pc(t) pf(t) pw(t) pe(t) extra(t) br(t)

    eqs = [
        D(p1) ~ br - d1 - mat1
        d1a ~ p1 * m1
        m1 ~ interpolate(le, tables[:m1], ranges[:m1])
        d1 ~ d1a
        mat1 ~ p1 - d1a

        D(p2) ~ mat1 - d2 - mat2
        d2a ~ p2 * m2
        m2 ~ interpolate(le, tables[:m2], ranges[:m2])
        d2 ~ d2a
        mat2 ~ (p2 - d2a) / 4

        D(p3) ~ mat2 - d3 - mat3
        d3a ~ p3 * m3
        m3 ~ interpolate(le, tables[:m3], ranges[:m3])
        d3 ~ d3a
        mat3 ~ (p3 - d3a) / 5

        D(p4) ~ mat3 - d4 - mat4
        d4a ~ p4 * m4
        m4 ~ interpolate(le, tables[:m4], ranges[:m4])
        d4 ~ d4a
        mat4 ~ (p4 - d4a) / 5

        D(p5) ~ mat4 - d5 - mat5
        d5a ~ p5 * m5
        m5 ~ interpolate(le, tables[:m5], ranges[:m5])
        d5 ~ d5a
        mat5 ~ (p5 - d5a) / 5

        D(p6) ~ mat5 - d6 - mat6
        d6a ~ p6 * m6
        m6 ~ interpolate(le, tables[:m6], ranges[:m6])
        d6 ~ d6a
        mat6 ~ (p6 - d6a) / 5

        D(p7) ~ mat6 - d7 - mat7
        d7a ~ p7 * m7
        m7 ~ interpolate(le, tables[:m7], ranges[:m7])
        d7 ~ d7a
        mat7 ~ (p7 - d7a) / 5

        D(p8) ~ mat7 - d8 - mat8
        d8a ~ p8 * m8
        m8 ~ interpolate(le, tables[:m8], ranges[:m8])
        d8 ~ d8a
        mat8 ~ (p8 - d8a) / 5

        D(p9) ~ mat8 - d9 - mat9
        d9a ~ p9 * m9
        m9 ~ interpolate(le, tables[:m9], ranges[:m9])
        d9 ~ d9a
        mat9 ~ (p9 - d9a) / 5

        D(p10) ~ mat9 - d10 - mat10
        d10a ~ p10 * m10
        m10 ~ interpolate(le, tables[:m10], ranges[:m10])
        d10 ~ d10a
        mat10 ~ (p10 - d10a) / 5

        D(p11) ~ mat10 - d11 - mat11
        d11a ~ p11 * m11
        m11 ~ interpolate(le, tables[:m11], ranges[:m11])
        d11 ~ d11a
        mat11 ~ (p11 / 5) - d11a

        D(p12) ~ mat11 - d12 - mat12
        d12a ~ p12 * m12
        m12 ~ interpolate(le, tables[:m12], ranges[:m12])
        d12 ~ d12a
        mat12 ~ (p12 - d12a) / 5

        D(p13) ~ mat12 - d13 - mat13
        d13a ~ p13 * m13
        m13 ~ interpolate(le, tables[:m13], ranges[:m13])
        d13 ~ d13a
        mat13 ~ (p13 - d13a) / 5

        D(p14) ~ mat13 - d14 - mat14
        d14a ~ p14 * m14
        m14 ~ interpolate(le, tables[:m14], ranges[:m14])
        d14 ~ d14a
        mat14 ~ (p14 - d14a) / 5

        D(p15) ~ mat14 - d15
        d15 ~ p15 * m15
        m15 ~ interpolate(le, tables[:m15], ranges[:m15])

        dr ~ d1 + d2 + d3 + d4 + d5 + d6 + d7 + d8 + d9 + d10 + d11 + d12 + d13 + d14 + d15
        pop ~ p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8 + p9 + p10 + p11 + p12 + p13 + p14 + p15
        pc ~ (p1 + p2 + p3 + p4) / pop
        pf ~ (p5 + p6 + p7 + p8 + p9 + p10) / pop
        pw ~ (p11 + p12 + p13 + p14) / pop
        pe ~ p15 / pop
        extra ~ p5 * 0.06 + p6 * 0.25 + p7 * 0.28 + p8 * 0.21 + p9 * 0.13 + p10 * 0.07
        br ~ clip(dr, (tf / 10.0) * extra, t, pet)
    ]

    ODESystem(eqs; name)
end


include("population/pop15/scenarios.jl")
include("population/pop15/plots.jl")


end # module
