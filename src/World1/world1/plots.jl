function standardrunsolution()
    isdefined(@__MODULE__, :_solution_standardrun) && return _solution_standardrun
    global _solution_standardrun = solve(standard_run(), (1900, 2100))
    return _solution_standardrun
end

function _variables_std()
    @named w1 = world1()

    variables = [
        (w1.pop,  0,     8e9,   "Population"),
        (w1.polr, 0,     40,    "Pollution"),
        (w1.ci,   0,     8e9,   "Capital investment"),
        (w1.fr,   0,     8,     "Food ratio"),
        (w1.cr,   0,     0.2,   "Crowding ratio"),
        (w1.msl,  0,     80,    "Material standard of living"),
        (w1.qlm,  0,     8,     "Quality of life from materials"),
        (w1.ql,   0,     120,   "Quality of life"),
        (w1.ciaf, 0.2,   0.6,   "Capital in agriculture"),
        (w1.nr,   500e9, 900e9, "Natural resources"),
    ]

    return variables
end

function _variables_1()
    @named w1 = world1()

    variables = [
        (w1.pop,  0,     8e9,   "Population"),
        (w1.polr, 0,     1.2,   "Pollution"),
        (w1.ci,   0,     4e9,   "Capital investment"),
        (w1.fr,   1.15,  1.35,  "Food ratio"),
        (w1.cr,   0,     0.2,   "Crowding ratio"),
        (w1.msl,  0,     0.4,   "Material standard of living"),
        (w1.qlm,  0.25,  0.45,  "Quality of life from materials"),
        (w1.ql,   0.9,   1.7,   "Quality of life"),
        (w1.ciaf, 0.15,  0.55,  "Capital in agriculture"),
        (w1.nr,   500e9, 900e9, "Natural resources"),
    ]

    return variables
end

function _variables_2()
    @named w1 = world1()

    variables = [
        (w1.pop,  0,     8e9,   "Population"),
        (w1.polr, 0,     1.2,   "Pollution"),
        (w1.ci,   0,     4e9,   "Capital investment"),
        (w1.fr,   1.16,  1.28,  "Food ratio"),
        (w1.cr,   0,     0.2,   "Crowding ratio"),
        (w1.msl,  0.18,  0.26,  "Material standard of living"),
        (w1.qlm,  0.33,  0.41,  "Quality of life from materials"),
        (w1.ql,   1,     1.8,   "Quality of life"),
        (w1.ciaf, 0.2,   0.4,   "Capital in agriculture"),
        (w1.nr,   500e9, 900e9, "Natural resources"),
    ]

    return variables
end

function _variables_3()
    @named w1 = world1()

    variables = [
        (w1.pop,  0,     8e9,   "Population"),
        (w1.polr, 0,     20,    "Pollution"),
        (w1.ci,   0,     4e9,   "Capital investment"),
        (w1.fr,   0,     4,     "Food ratio"),
        (w1.cr,   0,     0.2,   "Crowding ratio"),
        (w1.msl,  0,     20,    "Material standard of living"),
        (w1.qlm,  0,     8,     "Quality of life from materials"),
        (w1.ql,   0,     20,    "Quality of life"),
        (w1.ciaf, 0,     0.8,   "Capital in agriculture"),
        (w1.nr,   100e9, 900e9, "Natural resources"),
    ]

    return variables
end

function _variables_4()
    @named w1 = world1()

    variables = [
        (w1.pop,  0,     4e9,   "Population"),
        (w1.polr, 0,     20,    "Pollution"),
        (w1.ci,   0,     8e9,   "Capital investment"),
        (w1.fr,   0,     8,     "Food ratio"),
        (w1.cr,   0,     0.12,  "Crowding ratio"),
        (w1.msl,  0,     80,    "Material standard of living"),
        (w1.qlm,  0,     8,     "Quality of life from materials"),
        (w1.ql,   0,     120,   "Quality of life"),
        (w1.ciaf, 0,     0.8,   "Capital in agriculture"),
        (w1.nr,   500e9, 900e9, "Natural resources"),
    ]

    return variables
end

function _variables_5()
    @named w1 = world1()

    variables = [
        (w1.pop,  0,     8e9,   "Population"),
        (w1.polr, 0,     40,    "Pollution"),
        (w1.ci,   0,     8e9,   "Capital investment"),
        (w1.fr,   0,     8,     "Food ratio"),
        (w1.cr,   0,     0.2,   "Crowding ratio"),
        (w1.msl,  0,     80,    "Material standard of living"),
        (w1.qlm,  0,     8,     "Quality of life from materials"),
        (w1.ql,   0,     120,   "Quality of life"),
        (w1.ciaf, 0,     0.8,   "Capital in agriculture"),
        (w1.nr,   500e9, 900e9, "Natural resources"),
    ]

    return variables
end

function _variables_6()
    @named w1 = world1()

    variables = [
        (w1.pop,  0,     8e9,   "Population"),
        (w1.polr, 0,     20,    "Pollution"),
        (w1.ci,   0,     8e9,   "Capital investment"),
        (w1.fr,   0,     2,     "Food ratio"),
        (w1.cr,   0,     0.2,   "Crowding ratio"),
        (w1.msl,  0,     4,     "Material standard of living"),
        (w1.qlm,  0,     8,     "Quality of life from materials"),
        (w1.ql,   0,     4,     "Quality of life"),
        (w1.ciaf, 0.25,  0.45,  "Capital in agriculture"),
        (w1.nr,   700e9, 900e9, "Natural resources"),
    ]

    return variables
end

function _variables_7()
    @named w1 = world1()

    variables = [
        (w1.pop,  0,   20e9,   "Population"),
        (w1.polr, 0,   20,     "Pollution"),
        (w1.ci,   0,   20e9,   "Capital investment"),
        (w1.fr,   0,   8,      "Food ratio"),
        (w1.cr,   0,   0.4,    "Crowding ratio"),
        (w1.msl,  0,   20,     "Material standard of living"),
        (w1.qlm,  0,   8,      "Quality of life from materials"),
        (w1.ql,   0,   80,     "Quality of life"),
        (w1.ciaf, 0.2, 0.6,    "Capital in agriculture"),
        (w1.nr,   0,   1200e9, "Natural resources"),
    ]

    return variables
end

function _variables_8()
    @named w1 = world1()

    variables = [
        (w1.pop,  0,     4e9,   "Population"),
        (w1.polr, 0,     20,    "Pollution"),
        (w1.ci,   0,     8e9,   "Capital investment"),
        (w1.fr,   0,     8,     "Food ratio"),
        (w1.cr,   0,     0.8,   "Crowding ratio"),
        (w1.msl,  0,     40,    "Material standard of living"),
        (w1.qlm,  0,     8,     "Quality of life from materials"),
        (w1.ql,   0,     120,   "Quality of life"),
        (w1.ciaf, 0.25,  0.65,  "Capital in agriculture"),
        (w1.nr,   500e9, 900e9, "Natural resources"),
    ]

    return variables
end

function _variables_9()
    @named w1 = world1()

    variables = [
        (w1.pop,  0,     4e9,   "Population"),
        (w1.polr, 0,     20,    "Pollution"),
        (w1.ci,   0,     4e9,   "Capital investment"),
        (w1.fr,   0,     4,     "Food ratio"),
        (w1.cr,   0,     0.8,   "Crowding ratio"),
        (w1.msl,  0,     20,    "Material standard of living"),
        (w1.qlm,  0,     8,     "Quality of life from materials"),
        (w1.ql,   0,     40,    "Quality of life"),
        (w1.ciaf, 0.25,  0.65,  "Capital in agriculture"),
        (w1.nr,   700e9, 900e9, "Natural resources"),
    ]

    return variables
end

function _variables_10()
    @named w1 = world1()

    variables = [
        (w1.pop,  0,     4e9,   "Population"),
        (w1.polr, 0,     12,    "Pollution"),
        (w1.ci,   0,     4e9,   "Capital investment"),
        (w1.fr,   0,     2,     "Food ratio"),
        (w1.cr,   0,     0.8,   "Crowding ratio"),
        (w1.msl,  0,     8,     "Material standard of living"),
        (w1.qlm,  0,     8,     "Quality of life from materials"),
        (w1.ql,   0,     20,    "Quality of life"),
        (w1.ciaf, 0.25,  0.65,  "Capital in agriculture"),
        (w1.nr,   500e9, 900e9, "Natural resources"),
    ]

    return variables
end


fig_std(; kwargs...) = plotvariables(standardrunsolution(), (t, 1900, 2100), _variables_std(); title="WORLD1-STD", showaxis=false, showlegend=true, kwargs...)

"""
    Reproduce Fig. W1-7/5-1. The original figure is presented in the MIT memorandum D-1348 of [World1](https://dome.mit.edu/handle/1721.3/189645).
"""
function fig_1(; kwargs...)
    new_params = copy(_params)
    new_params[:cigc] = 0.5

    sol = solve(standard_run(params=new_params), (1900, 2100))

    plotvariables(sol, (t, 1900, 2100), _variables_1(); title="W1-7/5-1", showaxis=false, showlegend=true, kwargs...)
end

"""
    Reproduce Fig. W1-7/5-2. The original figure is presented in the MIT memorandum D-1348 of [World1](https://dome.mit.edu/handle/1721.3/189645).
"""
function fig_2(; kwargs...)
    new_params = copy(_params)
    new_params[:cigc] = 0.5

    new_inits = copy(_inits)
    new_inits[:ciaf] = 0.25

    sol = solve(standard_run(inits=new_inits, params=new_params), (1900, 2100))

    plotvariables(sol, (t, 1900, 2100), _variables_2(); title="W1-7/5-2", showaxis=false, showlegend=true, kwargs...)
end

"""
    Reproduce Fig. W1-7/5-3. The original figure is presented in the MIT memorandum D-1348 of [World1](https://dome.mit.edu/handle/1721.3/189645).
"""
function fig_3(; kwargs...)
    new_params = copy(_params)
    new_params[:cigc] = 0.5

    new_inits = copy(_inits)
    new_inits[:ciaf] = 0.25

    sol = solve(standard_run(inits=new_inits, params=new_params), (1900, 2400))

    plotvariables(sol, (t, 1900, 2400), _variables_3(); title="W1-7/5-3", showaxis=false, showlegend=true, kwargs...)
end

"""
    Reproduce Fig. W1-7/5-4. The original figure is presented in the MIT memorandum D-1348 of [World1](https://dome.mit.edu/handle/1721.3/189645).
"""
function fig_4(; kwargs...)
    new_params = copy(_params)
    new_params[:brn] = 0.025

    sol = solve(standard_run(params=new_params), (1900, 2100))

    plotvariables(sol, (t, 1900, 2100), _variables_4(); title="W1-7/5-4", showaxis=false, showlegend=true, kwargs...)
end

"""
    Reproduce Fig. W1-7/5-5. The original figure is presented in the MIT memorandum D-1348 of [World1](https://dome.mit.edu/handle/1721.3/189645).
"""
function fig_5(; kwargs...)
    new_params = copy(_params)
    new_params[:brn] = 0.035

    new_inits = copy(_inits)
    new_inits[:ciaf] = 0.3

    sol = solve(standard_run(inits=new_inits, params=new_params), (1900, 2100))

    plotvariables(sol, (t, 1900, 2100), _variables_5(); title="W1-7/5-5", showaxis=false, showlegend=true, kwargs...)
end

"""
    Reproduce Fig. W1-7/5-6. The original figure is presented in the MIT memorandum D-1348 of [World1](https://dome.mit.edu/handle/1721.3/189645).
"""
function fig_6(; kwargs...)
    new_params = copy(_params)
    new_params[:brn] = 0.032

    new_inits = copy(_inits)
    new_inits[:ciaf] = 0.3

    sol = solve(standard_run(inits=new_inits, params=new_params), (1900, 2100))

    plotvariables(sol, (t, 1900, 2000), _variables_6(); title="W1-7/5-6", showaxis=false, showlegend=true, kwargs...)
end

"""
    Reproduce Fig. W1-7/5-7. The original figure is presented in the MIT memorandum D-1348 of [World1](https://dome.mit.edu/handle/1721.3/189645).
"""
function fig_7(; kwargs...)
    new_params = copy(_params)
    new_params[:pols] = 10e9

    sol = solve(standard_run(params=new_params), (1900, 2100))

    plotvariables(sol, (t, 1900, 2100), _variables_7(); title="W1-7/5-7", showaxis=false, showlegend=true, kwargs...)
end

"""
    Reproduce Fig. W1-7/5-8. The original figure is presented in the MIT memorandum D-1348 of [World1](https://dome.mit.edu/handle/1721.3/189645).
"""
function fig_8(; kwargs...)
    new_params = copy(_params)
    new_params[:pdn] = 26.5

    sol = solve(standard_run(params=new_params), (1900, 2100))

    plotvariables(sol, (t, 1900, 2100), _variables_8(); title="W1-7/5-8", showaxis=false, showlegend=true, kwargs...)
end

"""
    Reproduce Fig. W1-7/5-9. The original figure is presented in the MIT memorandum D-1348 of [World1](https://dome.mit.edu/handle/1721.3/189645).
"""
function fig_9(; kwargs...)
    new_params = copy(_params)
    new_params[:pdn] = 26.5

    new_tables = copy(_tables)
    new_tables[:cipc] = (0.02, 0.05, 0.1, 0.14, 0.16, 0.18)

    sol = solve(standard_run(params=new_params, tables=new_tables), (1900, 2100))

    plotvariables(sol, (t, 1900, 2100), _variables_9(); title="W1-7/5-9", showaxis=false, showlegend=true, kwargs...)
end

"""
    Reproduce Fig. W1-7/5-10. The original figure is presented in the MIT memorandum D-1348 of [World1](https://dome.mit.edu/handle/1721.3/189645).
"""
function fig_10(; kwargs...)
    new_params = copy(_params)
    new_params[:pdn] = 26.5

    new_tables = copy(_tables)
    new_tables[:cipc] = (0.02, 0.05, 0.1, 0.14, 0.16, 0.18)
    new_tables[:polat] = (0.5, 1.0, 1.6, 2.4, 3.2, 4.0, 4.8)

    sol = solve(standard_run(params=new_params, tables=new_tables), (1900, 2100))

    plotvariables(sol, (t, 1900, 2100), _variables_10(); title="W1-7/5-10", showaxis=false, showlegend=true, kwargs...)
end

"""
    Reproduce Fig. W1-7/5-11. The original figure is presented in the MIT memorandum D-1348 of [World1](https://dome.mit.edu/handle/1721.3/189645).
"""
function fig_11(; kwargs...)
    new_params = copy(_params)
    new_params[:pdn] = 26.5

    new_tables = copy(_tables)
    new_tables[:cipc] = (0.02, 0.05, 0.1, 0.14, 0.16, 0.18)
    new_tables[:polat] = (0.5, 1.0, 1.6, 2.4, 3.2, 4.0, 4.8)

    new_inits = copy(_inits)
    new_inits[:ciaf] = 0.3

    sol = solve(standard_run(params=new_params, inits=new_inits, tables=new_tables), (1900, 2100))

    plotvariables(sol, (t, 1900, 2100), _variables_10(); title="W1-7/5-11", showaxis=false, showlegend=true, kwargs...)
end

"""
    Reproduce Fig. W1-7/5-12. The original figure is presented in the MIT memorandum D-1348 of [World1](https://dome.mit.edu/handle/1721.3/189645).
"""
function fig_12(; kwargs...)
    new_params = copy(_params)
    new_params[:pdn] = 26.5
    new_params[:brn] = 0.06

    new_tables = copy(_tables)
    new_tables[:cipc] = (0.02, 0.05, 0.1, 0.14, 0.16, 0.18)
    new_tables[:polat] = (0.5, 1.0, 1.6, 2.4, 3.2, 4.0, 4.8)

    new_inits = copy(_inits)
    new_inits[:ciaf] = 0.3

    sol = solve(standard_run(params=new_params, inits=new_inits, tables=new_tables), (1900, 2100))

    plotvariables(sol, (t, 1900, 2100), _variables_10(); title="W1-7/5-12", showaxis=false, showlegend=true, kwargs...)
end
