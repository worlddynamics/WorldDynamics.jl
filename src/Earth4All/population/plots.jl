function stella_run_solution()
    isdefined(@__MODULE__, :_stella_run_solution) && return _stella_run_solution
    global _stella_run_solution = solve(stella_run(), (1980, 2100))
    return _stella_run_solution
end
