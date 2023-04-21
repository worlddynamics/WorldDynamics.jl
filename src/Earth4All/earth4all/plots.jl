using ModelingToolkit
using DifferentialEquations

function e4a_run_solution()
    isdefined(@__MODULE__, :_solution_e4a_run) && return _solution_e4a_run
    global _solution_e4a_run = WorldDynamics.solve(e4a_run(), (1980, 2100), dt=0.015625, dtmax=0.015625)
    return _solution_e4a_run
end

@variables t

fig_fin(; kwargs...) = plotvariables(e4a_run_solution(), (t, 2010, 2030), Finance._variables_fin(); title="Finance sector plots", showaxis=true, showlegend=true, kwargs...)

fig_pop(; kwargs...) = plotvariables(e4a_run_solution(), (t, 1980, 2100), Population._variables_pop(); title="Population sector plots", showaxis=false, showlegend=true, kwargs...)

fig_pub(; kwargs...) = plotvariables(e4a_run_solution(), (t, 1980, 2100), Public._variables_pub(); title="Public sector plots", showaxis=false, showlegend=true, kwargs...)

fig_wb(; kwargs...) = plotvariables(e4a_run_solution(), (t, 1980, 2100), Wellbeing._variables_wb(); title="Wellbeing sector plots", showaxis=false, showlegend=true, kwargs...)
