using Interpolations, ModelingToolkit, OrdinaryDiffEq
using Plots

include("functions.jl")
include("tablespop.jl")
include("parameters.jl")
include("initialisations.jl")

# Parameter declarations
@parameters hsid
# Function declarations
@variables hsapc(t) ehspc(t)
D = Differential(t)
# Registered functions used in equations
@register interpolate(x, xs::AbstractVector, y::AbstractVector)
@register clip(f1, f2, va, th)
@register min(v1, v2)

function hsapcf(t)
    if (t <= 10)
        return 100
    end
    if (t <= 100)
        return 600
    end
    return 100
end
@register hsapcf(t)

# Equations
eqs = [
    hsapc ~ hsapcf(t),
    D(ehspc) ~ (hsapc - ehspc) / hsid
]
# ODE system creation and simplification
@named sys = ODESystem(eqs)
sys = structural_simplify(sys)
# Initialisations
u0 = [
    ehspc => 100.0,
    hsapc => 100.0
]
# Parameters
p = [hsid => hsidv]
# Time interval
tspan = (0.0, 200.0)
# ODE solution
prob = ODEProblem(sys, u0, tspan, p, jac = true)
# println("iopc(0)=", iopc0)
sol = solve(prob, Tsit5())
# plot(sol, vars = [(0, ehspc), (0, hsapc)])
function f(t)
    return interpolate(t, lmft, lmfts)
end
plot(f, 0, 5.00, legend = :bottomright)