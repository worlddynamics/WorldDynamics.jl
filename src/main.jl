using Interpolations, ModelingToolkit, DifferentialEquations
using PlotlyJS

include("functions.jl")
include("pollution/parameters.jl")
include("pollution/tablespop.jl")
include("pollution/initialisations.jl")
include("pollution/odesystem.jl")

# ODE system creation and simplification
@named sys = ODESystem(eqs)
sys = structural_simplify(sys)
# Time interval
tspan = (t0, 1970.0)
# Define ODE problem
prob = ODEProblem(sys, u0, tspan, p, jac=true)
println("odesystemcapital created")
# Solve ODE problem
sol = solve(prob)
println("odesystemcapital solved")
#plot_sol_6_28(sol)
plot_sol_6_29(sol)

