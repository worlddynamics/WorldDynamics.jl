using ModelingToolkit
using DifferentialEquations

function pub_run_solution()
    isdefined(@__MODULE__, :_solution_pub_run) && return _solution_pub_run
    global _solution_pub_run = WorldDynamics.solve(public_run(), (1980, 2100), dt=0.015625, dtmax=0.015625)
    return _solution_pub_run
end
#test plot
function _variables_pub()
    @named pub = public()
    variables = [
        (pub.DRTA, 0, 0.014, ""),
    ]
    return variables
end

fig_pub(; kwargs...) = plotvariables(pub_run_solution(), (t, 1980, 2100), _variables_pub(); title="Public sector plots", showaxis=false, showlegend=true, kwargs...)
