using Interpolations, ModelingToolkit, DifferentialEquations
using PlotlyJS

global t0 = 1900

include("functions.jl")
include("agriculture/parameters.jl")
include("agriculture/tablespop.jl")
include("agriculture/initialisations.jl")
include("agriculture/odesystem.jl")

# ODE system creation and simplification
@named sys = ODESystem(eqs)
sys = structural_simplify(sys)
# Time interval
tspan = (t0, 1970.0)
# Define ODE problem
prob = ODEProblem(sys, u0, tspan, p, jac=true)
println("odesystem created")
# Solve ODE problem
sol = solve(prob)
println("odesystem solved")
# plot_sol_3_36(sol)

