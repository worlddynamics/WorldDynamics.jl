using Interpolations, ModelingToolkit, DifferentialEquations
using PlotlyJS

global t0 = 1900
global t1 = 1975
#global t1 = 1970 # agriculture
#global t1 = 2000 # capital
#global t1 = 2100 # nonrenewable, pollution, world

include("functions.jl")
# Registered functions used in equations
@register interpolate(x, y::NTuple, xs::Tuple)
@register clip(f1, f2, va, th)
@register min(v1, v2)
@register max(v1, v2)
@register step(t, hght, sttm)
@register switch(v1, v2, z)

include("pop4/parameters.jl")
include("pop4/tables.jl")
include("pop4/initialisations.jl")
include("pop4/odesystem.jl")

# ODE system creation and simplification
@named sys = ODESystem(eqs)
sys = structural_simplify(sys)
# Time interval
tspan = (t0, t1)
# Define ODE problem
# prob = ODEProblem(sys, u0, tspan, p, jac=true)
prob = ODEProblem(sys, u0, tspan, p)
println("odesystem created")
# Solve ODE problem
# sol = solve(prob)
sol = solve(prob, Tsit5())
println("odesystem solved")
plot_sol_2_84(sol)
