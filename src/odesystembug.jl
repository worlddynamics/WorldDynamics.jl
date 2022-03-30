using Interpolations, ModelingToolkit, DifferentialEquations

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
f(x) = interpolate(x, ht, hts)
# Registered functions used in equations
@register interpolate(x, xs::AbstractVector, y::AbstractVector)

ht = [0.0, 1.0, 1.2, 1.3, 1.35, 1.4]
hts = LinRange(0.0, 5.0, 6)
# Function declarations
@variables t h(t) k(t)
D = Differential(t)
# Equations
eqs = [
    D(h) ~ f(k)
    D(k) ~ 1
]
# ODE system creation and simplification
@named sys = ODESystem(eqs)
sys = structural_simplify(sys)
# Initialisations
u0 = [h => 1, k => 1]
# Time interval
tspan = (0.0, 10.0)
# ODE solution
prob = ODEProblem(sys, u0, tspan, jac=true)
# prob = ODEProblem(sys, u0, tspan)
println("odesystembug problem created")
sol = solve(prob)
println("odesystembug solved")