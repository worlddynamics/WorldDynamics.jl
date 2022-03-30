using Interpolations, ModelingToolkit, OrdinaryDiffEq

function interpolate(x, y, xs)
    if (x < xs[1])
        return y[1]
    end
    if (x > xs[length(xs)])
        return y[length(xs)]
    end
    li = LinearInterpolation(xs, y)
    return li(x)
end

ht = [0.0, 1.0, 1.2, 1.3, 1.35, 1.4]
hts = LinRange(0.0, 5.0, 6)

av = 230

f0 = 1.61e9
h0 = interpolate(1 / av, ht, hts)

# Parameter declarations
@parameters a
# Function declarations
@variables t f(t) g(t) h(t)
D = Differential(t)
# Registered functions used in equations
@register interpolate(x, xs::AbstractVector, y::AbstractVector)
# Equations
eqs = [
    D(f) ~ 1 - g,
    g ~ f / h,
    h ~ interpolate(1 / a, ht, hts)
]
# ODE system creation and simplification
@named sys = ODESystem(eqs)
sys = structural_simplify(sys)
# Initialisations
u0 = [f => f0]
# Parameters
p = [a => av]
# Time interval
tspan = (0.0, 75.0)
# ODE solution
prob = ODEProblem(sys, u0, tspan, p, jac=true)
println("odesystempop problem created")
sol = solve(prob, Tsit5())
println("odesystempop solved")