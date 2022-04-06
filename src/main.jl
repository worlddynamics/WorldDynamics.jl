using Interpolations, ModelingToolkit, DifferentialEquations
using PlotlyJS

include("functions.jl")
include("nonrenewable/parameters.jl")
include("nonrenewable/tablespop.jl")
include("nonrenewable/initialisations.jl")
include("nonrenewable/odesystem.jl")

# ODE system creation and simplification
@named sys = ODESystem(eqs)
sys = structural_simplify(sys)
# Time interval
tspan = (1900.0, 2100.0)
# Define ODE problem
prob = ODEProblem(sys, u0, tspan, p, jac=true)
println("odesystemcapital created")
# Solve ODE problem
sol = solve(prob)
println("odesystemcapital solved")
plot_sol_5_25(sol)

