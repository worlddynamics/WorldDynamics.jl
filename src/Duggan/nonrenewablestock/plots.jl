function nrs_run_solution()
    isdefined(@__MODULE__, :_solution_nrs_run) && return _solution_nrs_run
    global _solution_nrs_run = solve(nrs_run(), (0, 200))
    return _solution_nrs_run
end

function _variables_nrs()
    @named nrs = non_renewable_stock()

    variables = [
        (nrs.capital, 0, 30, "Capital"),
        (nrs.extraction, 0, 15, "Extraction"),
        (nrs.investment, 0, 2, "Investment"),
        (nrs.depreciation, 0, 2, "Investment"),
        (nrs.resource, 0, 1000, "Resource"),
    ]

    return variables
end

"""
    Reproduce Fig. 3.9. The original figure is presented in the chapter *Modeling Limits to Growth* of the book [System Dynamics Modeling with R](https://link.springer.com/book/10.1007/978-3-319-34043-2).
"""
fig_3_9(; kwargs...) = plotvariables(nrs_run_solution(), (t, 0, 200), _variables_nrs(); title="Simulation output showing stocks and flows", showaxis=false, showlegend=true, kwargs...)

