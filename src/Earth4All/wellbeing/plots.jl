using ModelingToolkit
using DifferentialEquations

function wb_run_solution()
    isdefined(@__MODULE__, :_solution_wb_run) && return _solution_wb_run
    global _solution_wb_run = WorldDynamics.solve(wb_run(), (1980, 2100), dt=0.015625, dtmax=0.015625)
    return _solution_wb_run
end

function _variables_wb()
    @named wb = wellbeing()
    variables = [
        (wb.AWBI, 0, 4, "Average WellBeing Index"),
    ]
    return variables
end

fig_wb(; kwargs...) = plotvariables(wb_run_solution(), (t, 1980, 2100), _variables_wb(); title="Wellbeing sector plots", showaxis=false, showlegend=true, kwargs...)
