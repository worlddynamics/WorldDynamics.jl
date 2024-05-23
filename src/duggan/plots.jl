using ModelingToolkit
using DifferentialEquations

@variables t

function _variables()
    @named cap = Capital.capital_system()
    @named res = Resource.resource_system()
    variables = [
        (cap.CAPI, 0, 30, "Capital"),
        (res.EXTR, 0, 15, "Extraction"),
        (cap.INVE, 0, 2, "Investment"),
        (cap.DEPR, 0, 2, "Investment"),
        (res.RESO, 0, 1000, "Resource"),
    ]
    return variables
end

fig_3_9(; kwargs...) = plotvariables(duggan_solution(), (t, 0, 200), _variables(); title="Simulation output showing stocks and flows", showaxis=false, showlegend=true, kwargs...)
