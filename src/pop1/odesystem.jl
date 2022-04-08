include("../common_pop/parameters.jl")
include("../common_pop/tables.jl")
include("../common_pop/initialisations.jl")
include("../common_pop/odesystem.jl")

# Equations
global eqs = [
    # POPULATION LEVEL EQUATIONS
    D(pop) ~ br - dr, # line 1 page 167
    # DEATH RATE EQUATIONS
    dr ~ pop / le, # line 4 page 167
    # BIRTH RATE EQUATIONS
    br ~ clip(dr, tf * pop * ffw / rlt, t, pet) # line 28 page 168
]
eqs = vcat(eqs, common_eqs)
# Initialisations
global u0 = [
    pop => pop0, # lines 2-3 page 167
]
u0 = vcat(u0, common_u0)
# Parameters
global p = common_p
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