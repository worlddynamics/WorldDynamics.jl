using ModelingToolkit
using DifferentialEquations


function finance_run_solution()
    isdefined(@__MODULE__, :_solution_finance_run) && return _solution_finance_run
    global _solution_finance_run = WorldDynamics.solve(finance_run(), (1980, 2100), dt=0.015625, dtmax=0.015625)
    return _solution_finance_run
end
function _variables_fin()
    @named fin = finance()
    variables = [
        (fin.UR, 0, 0.1, "Unemployment rate"),
        (fin.CBC, 0, 0.1, "Corporate borrowing cost"),
        (fin.CBSR, 0, 0.1, "Central bank signal rate"),
        (fin.GBC, 0, 0.1, "Government borrowing cost"),
        (fin.WBC, 0, 0.1, "Worker borrowing cost"),
        (fin.IR, -0.05, 0.05, "Inflation rate"),
    ]
    return variables
end

fig_fin(; kwargs...) = plotvariables(finance_run_solution(), (t, 2010, 2030), _variables_fin(); title="Finance sector plots", showaxis=true, showlegend=true, kwargs...)
