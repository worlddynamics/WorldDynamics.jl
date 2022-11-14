function standardrunsolution()
    isdefined(@__MODULE__, :_solution_standardrun) && return _solution_standardrun
    global _solution_standardrun = solve(standard_run(), (1900, 2100))
    return _solution_standardrun
end

function _variables_std()
    @named w1 = World1.world1()

    variables = [
        (w1.pop,  1e9,   3e9,   "Population"),
        (w1.polr, 0,     0.8,   "Pollution"),
        (w1.ci,   0,     2e9,   "Capital investment"),
        (w1.fr,   0.9,   1.1,   "Food ratio"),
        (w1.cr,   0.1,   0.9,   "Crowding ratio"),
        (w1.msl,  0.1,   0.5,   "Material standard of living"),
        (w1.qlm,  0.2,   0.6,   "Quality of life from materials"),
        (w1.ql,   0.65,  0.85,  "Quality of life"),
        (w1.ciaf, 0.23,  0.31,  "Capital in agriculture"),
        (w1.nr,   500e9, 900e9, "Natural resources"),
    ]

    return variables
end


@variables t

fig_std(; kwargs...) = plotvariables(standardrunsolution(), (t, 1900, 2100), _variables_std(); title="WRLD1B-STD", showaxis=false, showlegend=false,kwargs...)
