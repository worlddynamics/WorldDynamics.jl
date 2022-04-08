using Interpolations, ModelingToolkit, DifferentialEquations
using PlotlyJS

global t0 = 1900

include("functions.jl")
# Registered functions used in equations
@register interpolate(x, y::NTuple, xs::Tuple)
@register clip(f1, f2, va, th)
@register min(v1, v2)
@register max(v1, v2)
@register step(t, hght, sttm)
@register switch(v1, v2, z)

include("parameters.jl")
include("tables.jl")
include("initialisations.jl")
include("odesystem.jl")

# ODE system creation and simplification
@named sys = ODESystem(eqs)
sys = structural_simplify(sys)
# Time interval
tspan = (t0, 2100.0)
# Define ODE problem
prob = ODEProblem(sys, u0, tspan, p, jac=true)
println("odesystem created")
# Solve ODE problem
sol = solve(prob)
println("odesystem solved")
plot_sol_7_7(sol)

