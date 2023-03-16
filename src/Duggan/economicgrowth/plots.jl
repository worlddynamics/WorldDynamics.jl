function eg_run_solution()
    isdefined(@__MODULE__, :_solution_eg_run) && return _solution_eg_run
    global _solution_eg_run = solve(eg_run(), (0, 100))
    return _solution_eg_run
end

function _variables_eg()
    @named eg = economic_growth()

    variables = [
        (eg.machines, 0, 40000, "Machines"),
    ]

    return variables
end

"""
    Reproduce Fig. 3.6. The original figure is presented in the chapter *Modeling Limits to Growth* of the book [System Dynamics Modeling with R](https://link.springer.com/book/10.1007/978-3-319-34043-2).
"""
fig_3_6(; kwargs...) = plotvariables(eg_run_solution(), (t, 0, 100), _variables_eg(); title="Model output showing limit to growth for machines", showaxis=false, showlegend=true, kwargs...)

