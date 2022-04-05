using Interpolations, ModelingToolkit, DifferentialEquations
using PlotlyJS

include("functions.jl")
include("capital/parameters.jl")
include("capital/tablespop.jl")
include("capital/initialisations.jl")
include("capital/odesystem.jl")

# ODE system creation and simplification
@named sys = ODESystem(eqs)
sys = structural_simplify(sys)
# Time interval
tspan = (1900.0, 1980.0)
# Define ODE problem
prob = ODEProblem(sys, u0, tspan, p, jac=true)
println("odesystemcapital created")
# Solve ODE problem
sol = solve(prob)
println("odesystemcapital solved")
plot_sol_3_36(sol)

