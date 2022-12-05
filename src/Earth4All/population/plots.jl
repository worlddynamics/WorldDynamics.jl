function vensim_run_solution()
    isdefined(@__MODULE__, :_solution_vensim_run) && return _solution_vensim_run
    global _solution_vensim_run = solve(vensim_run(), (1980, 2100))
    return _solution_vensim_run
end
