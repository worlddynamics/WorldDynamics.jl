module Pop15


using Interpolations, ModelingToolkit

include("../functions.jl")

include("population/common_pop/tables.jl")
include("population/common_pop/parameters.jl")
include("population/common_pop/initialisations.jl")
include("population/CommonPop.jl")
include("population/pop15/tables.jl")
include("population/pop15/initialisations.jl")


@register interpolate(x, y::NTuple, xs::Tuple)
@register clip(f1, f2, va, th)

@variables t
D = Differential(t)


birth_rate = CommonPop.birth_rate
death_rate = CommonPop.death_rate
service_output = CommonPop.service_output
industrial_output = CommonPop.industrial_output
persistent_pollution = CommonPop.persistent_pollution
food = CommonPop.food


function population(; name)
    @parameters pet = petv
    
    @variables le(t) tf(t) 
    @variables p1(t) = p1_0 p2(t) = p2_0 p3(t) = p3_0 p4(t) = p4_0 p5(t) = p5_0 p6(t) = p6_0 p7(t) = p7_0 p8(t) = p8_0 p9(t) = p9_0 p10(t) = p10_0 p11(t) = p11_0 p12(t) = p12_0 p13(t) = p13_0 p14(t) = p14_0 p15(t) = p15_0 
    @variables d1a(t) m1(t) d1(t) mat1(t) d2a(t) m2(t) d2(t) mat2(t) d3a(t) m3(t) d3(t) mat3(t) d4a(t) m4(t) d4(t) mat4(t) 
    @variables d5a(t) m5(t) d5(t) mat5(t) d6a(t) m6(t) d6(t) mat6(t) d7a(t) m7(t) d7(t) mat7(t) d8a(t) m8(t) d8(t) mat8(t) 
    @variables d9a(t) m9(t) d9(t) mat9(t) d10a(t) m10(t) d10(t) mat10(t) d11a(t) m11(t) d11(t) mat11(t) d12a(t) m12(t) d12(t) mat12(t) 
    @variables d13a(t) m13(t) d13(t) mat13(t) d14a(t) m14(t) d14(t) mat14(t) d15(t) m15(t) dr(t) pop(t) pc(t) pf(t) pw(t) pe(t) extra(t) br(t) 

    eqs = [
        D(p1) ~ br - d1 - mat1
        d1a ~ p1 * m1
        m1 ~ interpolate(le, m1t, m1ts)
        d1 ~ d1a
        mat1 ~ p1 - d1a
        
        D(p2) ~ mat1 - d2 - mat2
        d2a ~ p2 * m2
        m2 ~ interpolate(le, m2t, m2ts)
        d2 ~ d2a
        mat2 ~ (p2 - d2a) / 4
        
        D(p3) ~ mat2 - d3 - mat3
        d3a ~ p3 * m3
        m3 ~ interpolate(le, m3t, m3ts)
        d3 ~ d3a
        mat3 ~ (p3 - d3a) / 5
        
        D(p4) ~ mat3 - d4 - mat4
        d4a ~ p4 * m4
        m4 ~ interpolate(le, m4t, m4ts)
        d4 ~ d4a
        mat4 ~ (p4 - d4a) / 5
        
        D(p5) ~ mat4 - d5 - mat5
        d5a ~ p5 * m5
        m5 ~ interpolate(le, m5t, m5ts)
        d5 ~ d5a
        mat5 ~ (p5 - d5a) / 5
        
        D(p6) ~ mat5 - d6 - mat6
        d6a ~ p6 * m6
        m6 ~ interpolate(le, m6t, m6ts)
        d6 ~ d6a
        mat6 ~ (p6 - d6a) / 5
        
        D(p7) ~ mat6 - d7 - mat7
        d7a ~ p7 * m7
        m7 ~ interpolate(le, m7t, m7ts)
        d7 ~ d7a
        mat7 ~ (p7 - d7a) / 5
        
        D(p8) ~ mat7 - d8 - mat8
        d8a ~ p8 * m8
        m8 ~ interpolate(le, m8t, m8ts)
        d8 ~ d8a
        mat8 ~ (p8 - d8a) / 5
        
        D(p9) ~ mat8 - d9 - mat9
        d9a ~ p9 * m9
        m9 ~ interpolate(le, m9t, m9ts)
        d9 ~ d9a
        mat9 ~ (p9 - d9a) / 5
        
        D(p10) ~ mat9 - d10 - mat10
        d10a ~ p10 * m10
        m10 ~ interpolate(le, m10t, m10ts)
        d10 ~ d10a
        mat10 ~ (p10 - d10a) / 5
        
        D(p11) ~ mat10 - d11 - mat11
        d11a ~ p11 * m11
        m11 ~ interpolate(le, m11t, m11ts)
        d11 ~ d11a
        mat11 ~ (p11 / 5) - d11a
        
        D(p12) ~ mat11 - d12 - mat12
        d12a ~ p12 * m12
        m12 ~ interpolate(le, m12t, m12ts)
        d12 ~ d12a
        mat12 ~ (p12 - d12a) / 5
        
        D(p13) ~ mat12 - d13 - mat13
        d13a ~ p13 * m13
        m13 ~ interpolate(le, m13t, m13ts)
        d13 ~ d13a
        mat13 ~ (p13 - d13a) / 5
        
        D(p14) ~ mat13 - d14 - mat14
        d14a ~ p14 * m14
        m14 ~ interpolate(le, m14t, m14ts)
        d14 ~ d14a
        mat14 ~ (p14 - d14a) / 5
        
        D(p15) ~ mat14 - d15
        d15 ~ p15 * m15
        m15 ~ interpolate(le, m15t, m15ts)
        
        dr ~ d1 + d2 + d3 + d4 + d5 + d6 + d7 + d8 + d9 + d10 + d11 + d12 + d13 + d14 + d15
        pop ~ p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8 + p9 + p10 + p11 + p12 + p13 + p14 + p15
        pc ~ (p1 + p2 + p3 + p4) / pop
        pf ~ (p5 + p6 + p7 + p8 + p9 + p10) / pop
        pw ~ (p11 + p12 + p13 + p14) / pop
        pe ~ p15 / pop
        extra ~ p5 * 0.06 + p6 * 0.25 + p7 * 0.28 + p8 * 0.21 + p9 * 0.13 + p10 * 0.07
        br ~ clip(dr, (tf / 10) * extra, t, pet)
    ]

    ODESystem(eqs; name)
end


end # module
