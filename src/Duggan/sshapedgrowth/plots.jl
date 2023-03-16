function ssg_run_solution()
    isdefined(@__MODULE__, :_solution_ssg_run) && return _solution_ssg_run
    global _solution_ssg_run = solve(ssg_run(), (0, 100))
    return _solution_ssg_run
end

function _variables_ssg()
    @named ssg = s_shaped_growth()

    variables = [
        (ssg.stock, 0, 10000, "Stock"),
        (ssg.availability, 0.0, 1.0, "Availability"),
        (ssg.net_flow, 0, 250, "Net flow"),
        (ssg.growth_rate, 0.0, 0.1, "Growth rate"),
    ]

    return variables
end

"""
    Reproduce Fig. 3.4. The original figure is presented in the chapter *Modeling Limits to Growth* of the book [System Dynamics Modeling with R](https://link.springer.com/book/10.1007/978-3-319-34043-2).
"""
fig_3_4(; kwargs...) = plotvariables(ssg_run_solution(), (t, 0, 100), _variables_ssg(); title="A one-stock model of limits to growth", showaxis=false, showlegend=true, kwargs...)

