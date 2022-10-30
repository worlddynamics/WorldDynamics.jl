function standardrunsolution()
    isdefined(@__MODULE__, :_solution_standardrun) && return _solution_standardrun
    global _solution_standardrun = solve(standard_run(), (1900, 2100))
    return _solution_standardrun
end

function _variables_std()
    @named w1a = world1a()

    variables = [
        (w1a.pop,  1.3e9, 2.1e9, "Population"),
        (w1a.polr, 0,     0.2,   "Pollution"),
        (w1a.ci,   370e6, 490e6, "Capital investment"),
        (w1a.fr,   0.87,  0.95,  "Food ratio"),
        (w1a.cr,   0.4,   0.6,   "Crowding ratio"),
        (w1a.msl,  0.05,  0.25,  "Material standard of living"),
        (w1a.qlm,  0.28,  0.4,   "Quality of life from materials"),
        (w1a.ql,   0.35,  0.75,  "Quality of life"),
        (w1a.ciaf, 0.2,   0.6,   "Capital in agriculture"),
        (w1a.nr,   820e9, 900e9, "Natural resources"),
    ]

    return variables
end

fig_std(; kwargs...) = plotvariables(standardrunsolution(), (t, 1900, 2100), _variables_std(); title="WRLD1A-STD", showaxis=false, showlegend=true, kwargs...)
