include("tablespop.jl")
include("parameters.jl")
include("initialisations.jl")

# Parameter declarations
# Function declarations
@variables p1(t) p2(t) p3(t) p4(t) p5(t) p6(t) p7(t) p8(t)
@variables p9(t) p10(t) p11(t) p12(t) p13(t) p14(t) p15(t)
@variables d1(t) mat1(t) m1(t) d1a(t)
@variables d2(t) mat2(t) m2(t) d2a(t)
@variables d3(t) mat3(t) m3(t) d3a(t)
@variables d4(t) mat4(t) m4(t) d4a(t)
@variables d5(t) mat5(t) m5(t) d5a(t)
@variables d6(t) mat6(t) m6(t) d6a(t)
@variables d7(t) mat7(t) m7(t) d7a(t)
@variables d8(t) mat8(t) m8(t) d8a(t)
@variables d9(t) mat9(t) m9(t) d9a(t)
@variables d10(t) mat10(t) m10(t) d10a(t)
@variables d11(t) mat11(t) m11(t) d11a(t)
@variables d12(t) mat12(t) m12(t) d12a(t)
@variables d13(t) mat13(t) m13(t) d13a(t)
@variables d14(t) mat14(t) m14(t) d14a(t)
@variables d15(t) m15(t)
@variables pc(t) pf(t) pw(t) pe(t)
@variables extra(t)
# Registered functions used in equations
# Equations
global eqs = [
    # POPULATION LEVEL EQUATIONS
    D(p1) ~ br - d1 - mat1,
    d1a ~ p1 * m1,
    m1 ~ interpolate(le, m1t, m1ts),
    d1 ~ d1a,
    mat1 ~ p1 - d1a,
    #
    D(p2) ~ mat1 - d2 - mat2,
    d2a ~ p2 * m2,
    m2 ~ interpolate(le, m2t, m2ts),
    d2 ~ d2a,
    mat2 ~ (p2 - d2a) / 4,
    #
    D(p3) ~ mat2 - d3 - mat3,
    d3a ~ p3 * m3,
    m3 ~ interpolate(le, m3t, m3ts),
    d3 ~ d3a,
    mat3 ~ (p3 - d3a) / 5,
    #
    D(p4) ~ mat3 - d4 - mat4,
    d4a ~ p4 * m4,
    m4 ~ interpolate(le, m4t, m4ts),
    d4 ~ d4a,
    mat4 ~ (p4 - d4a) / 5,
    #
    D(p5) ~ mat4 - d5 - mat5,
    d5a ~ p5 * m5,
    m5 ~ interpolate(le, m5t, m5ts),
    d5 ~ d5a,
    mat5 ~ (p5 - d5a) / 5,
    #
    D(p6) ~ mat5 - d6 - mat6,
    d6a ~ p6 * m6,
    m6 ~ interpolate(le, m6t, m6ts),
    d6 ~ d6a,
    mat6 ~ (p6 - d6a) / 5,
    #
    D(p7) ~ mat6 - d7 - mat7,
    d7a ~ p7 * m7,
    m7 ~ interpolate(le, m7t, m7ts),
    d7 ~ d7a,
    mat7 ~ (p7 - d7a) / 5,
    #
    D(p8) ~ mat7 - d8 - mat8,
    d8a ~ p8 * m8,
    m8 ~ interpolate(le, m8t, m8ts),
    d8 ~ d8a,
    mat8 ~ (p8 - d8a) / 5,
    #
    D(p9) ~ mat8 - d9 - mat9,
    d9a ~ p9 * m9,
    m9 ~ interpolate(le, m9t, m9ts),
    d9 ~ d9a,
    mat9 ~ (p9 - d9a) / 5,
    #
    D(p10) ~ mat9 - d10 - mat10,
    d10a ~ p10 * m10,
    m10 ~ interpolate(le, m10t, m10ts),
    d10 ~ d10a,
    mat10 ~ (p10 - d10a) / 5,
    #
    D(p11) ~ mat10 - d11 - mat11,
    d11a ~ p11 * m11,
    m11 ~ interpolate(le, m11t, m11ts),
    d11 ~ d11a,
    mat11 ~ (p11 / 5) - d11a,
    #
    D(p12) ~ mat11 - d12 - mat12,
    d12a ~ p12 * m12,
    m12 ~ interpolate(le, m12t, m12ts),
    d12 ~ d12a,
    mat12 ~ (p12 - d12a) / 5,
    #
    D(p13) ~ mat12 - d13 - mat13,
    d13a ~ p13 * m13,
    m13 ~ interpolate(le, m13t, m13ts),
    d13 ~ d13a,
    mat13 ~ (p13 - d13a) / 5,
    #
    D(p14) ~ mat13 - d14 - mat14,
    d14a ~ p14 * m14,
    m14 ~ interpolate(le, m14t, m14ts),
    d14 ~ d14a,
    mat14 ~ (p14 - d14a) / 5,
    #
    D(p15) ~ mat14 - d15,
    d15 ~ p15 * m15,
    m15 ~ interpolate(le, m15t, m15ts),
    # AUXILIARY EQUATIONS
    dr ~ d1 + d2 + d3 + d4 + d5 + d6 + d7 + d8 + d9 + d10 + d11 + d12 + d13 + d14 + d15,
    pop ~ p1 + p2 + p3 + p4 + p5 + p6 + p7 + p8 + p9 + p10 + p11 + p12 + p13 + p14 + p15,
    pc ~ (p1 + p2 + p3 + p4) / pop,
    pf ~ (p5 + p6 + p7 + p8 + p9 + p10) / pop,
    pw ~ (p11 + p12 + p13 + p14) / pop,
    pe ~ p15 / pop,
    # DEATH RATE EQUATIONS
    # BIRTH RATE EQUATIONS
    extra ~ p5 * 0.06 + p6 * 0.25 + p7 * 0.28 + p8 * 0.21 + p9 * 0.13 + p10 * 0.07,
    br ~ clip(dr, (tf / 10) * extra, t, pet)
]
eqs = vcat(eqs, common_eqs)
# Initialisations
global u0 = [p1 => p10,
    p2 => p20, #
    p3 => p30, #
    p4 => p40, #
    p5 => p50, #
    p6 => p60, #
    p7 => p70, #
    p8 => p80, #
    p9 => p90, #
    p10 => p100, #
    p11 => p110, #
    p12 => p120, #
    p13 => p130, #
    p14 => p140, #
    p15 => p150, #
]
u0 = vcat(u0, common_u0)
# Parameters
global p = [
    len => lenv, sfpc => sfpcv, hsid => hsidv, iphst => iphstv, # line 7,10,14,16 page 167
    ffw => ffwv, rlt => rltv, pet => petv, mtfn => mtfnv, lpd => lpdv, # line 29,30,31,35,42 page 168
    zpgt => zpgtv, dcfsn => dcfsnv, sad => sadv, ieat => ieatv, fcest => fcestv, # line 44,45,49,55,58 page 168
    lt => ltv, lt2 => lt2v, cio => ciov, ps => psv, pt => ptv, cso => csov, cfood => cfoodv, # line 65,67,70,74,75,80,90 page 168
]
p = vcat(p, common_p)
# ODE solution plot
function plot_sol_2_84(sol)
    traces = GenericTrace[]
    push!(traces, scatter(x=sol[t], y=sol[pop], name="pop", yaxis="y1"))
    push!(traces, scatter(x=sol[t], y=sol[cbr], name="cbr", yaxis="y2"))
    push!(traces, scatter(x=sol[t], y=sol[cdr], name="cdr", yaxis="y3"))
    push!(traces, scatter(x=sol[t], y=sol[sopc], name="sopc", yaxis="y4"))
    push!(traces, scatter(x=sol[t], y=sol[fpu], name="fpu", yaxis="y5"))
    push!(traces, scatter(x=sol[t], y=sol[fpc], name="fpc", yaxis="y6"))
    push!(traces, scatter(x=sol[t], y=sol[le], name="le", yaxis="y7"))
    push!(traces, scatter(x=sol[t], y=sol[fce], name="fce", yaxis="y8"))
    push!(traces, scatter(x=sol[t], y=sol[iopc], name="iopc", yaxis="y9"))
    plot(traces,
        Layout(xaxis_domain=[0.3, 0.7],
            yaxis=attr(title="pop", range=[0, 1.6e10]),
            yaxis2=attr(title="cbr", overlaying="y", side="right", position=0.70, range=[0, 50]),
            yaxis3=attr(title="cdr", overlaying="y", side="right", position=0.74, range=[0, 50]),
            yaxis4=attr(title="sopc", overlaying="y", side="right", position=0.78, range=[0, 1000]),
            yaxis5=attr(title="fpu", overlaying="y", side="right", position=0.82, range=[0, 1]),
            yaxis6=attr(title="fpc", overlaying="y", side="right", position=0.86, range=[0, 1000]),
            yaxis7=attr(title="le", overlaying="y", side="right", position=0.9, range=[0, 80]),
            yaxis8=attr(title="fce", overlaying="y", side="right", position=0.94, range=[0.5, 1]),
            yaxis9=attr(title="iopc", overlaying="y", side="right", position=0.98, range=[0, 1000])
        )
    )
end

function plot_sol_2_85(sol)
    traces = GenericTrace[]
    push!(traces, scatter(x=sol[t], y=sol[pc], name="pc", yaxis="y1"))
    push!(traces, scatter(x=sol[t], y=sol[pf], name="pf", yaxis="y2"))
    push!(traces, scatter(x=sol[t], y=sol[pw], name="pw", yaxis="y3"))
    push!(traces, scatter(x=sol[t], y=sol[pe], name="pe", yaxis="y4"))
    plot(traces,
        Layout(xaxis_domain=[0.3, 0.5],
            yaxis=attr(title="pc", range=[0, 1]),
            yaxis2=attr(title="pf", overlaying="y", side="right", position=0.70, range=[0, 1]),
            yaxis3=attr(title="pw", overlaying="y", side="right", position=0.74, range=[0, 1]),
            yaxis4=attr(title="pe", overlaying="y", side="right", position=0.78, range=[0, 1])
        )
    )
end