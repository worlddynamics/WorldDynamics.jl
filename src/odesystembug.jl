using ModelingToolkit, DifferentialEquations

function f(x, y)
    y[1]
end

ht = [0.0, 1.0]

@register f(k, ht::AbstractVector)

@variables t h(t) k(t)
D = Differential(t)

# Equations
eqs = [
    D(h) ~ f(k, ht)
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