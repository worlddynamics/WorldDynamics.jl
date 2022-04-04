using Interpolations, ModelingToolkit, DifferentialEquations
using PlotlyJS

include("functions.jl")
include("common/parameters.jl")
include("common/tablespop.jl")
include("common/initialisations.jl")
include("common/odesystem.jl")
include("pop15/odesystem.jl")

# ODE system creation and simplification
@named sys = ODESystem(eqs)
sys = structural_simplify(sys)
# Time interval
tspan = (0.0, 75.0)
# Define ODE problem
prob = ODEProblem(sys, u0, tspan, p, jac=true)
println("odesystempop created")
# Solve ODE problem
sol = solve(prob)
println("odesystempop solved")
plot_sol_2_85(sol)

