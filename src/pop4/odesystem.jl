include("tablespop.jl")
include("parameters.jl")
include("initialisations.jl")

# Parameter declarations
# Function declarations
@variables p1(t) p2(t) p3(t) p4(t)
@variables d1(t) mat1(t) m1(t)
@variables d2(t) mat2(t) m2(t)
@variables d3(t) mat3(t) m3(t)
@variables d4(t) m4(t)
# Registered functions used in equations
# Equations
global eqs = [
    # POPULATION LEVEL EQUATIONS
    pop ~ p1 + p2 + p3 + p4,
    D(p1) ~ br - d1 - mat1,
    d1 ~ p1 * m1,
    m1 ~ interpolate(le, m1t, m1ts),
    mat1 ~ p1 * (1 - m1) / 15,
    D(p2) ~ mat1 - d2 - mat2,
    d2 ~ p2 * m2,
    m2 ~ interpolate(le, m2t, m2ts),
    mat2 ~ p2 * (1 - m2) / 30,
    D(p3) ~ mat2 - d3 - mat3,
    d3 ~ p3 * m3,
    m3 ~ interpolate(le, m3t, m3ts),
    mat3 ~ p3 * (1 - m3) / 20,
    D(p4) ~ mat3 - d4,
    d4 ~ p4 * m4,
    m4 ~ interpolate(le, m4t, m4ts),
    # DEATH RATE EQUATIONS
    dr ~ d1 + d2 + d3 + d4
]
eqs = vcat(eqs, common_eqs)
# Initialisations
global u0 = [p1 => p10,
    p2 => p20, #
    p3 => p30, #
    p4 => p40
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
function plot_sol(sol)
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