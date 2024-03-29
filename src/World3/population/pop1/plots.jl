function historicalrunsolution()
    isdefined(@__MODULE__, :_solution_historicalrun) && return _solution_historicalrun
    global _solution_historicalrun = solve(historicalrun(), (1900, 2100))
    return _solution_historicalrun
end


function _variables_a()
    @named pop = population()
    @named br = birth_rate()
    @named dr = death_rate()
    @named so = service_output()
    @named io = industrial_output()
    @named f = food()

    variables = [
        (pop.pop, 0,   1.6e10, "pop"),
        (br.cbr,  0,   50,     "cbr"),
        (dr.cdr,  0,   50,     "cdr"),
        (br.fce,  0.5, 1,      "fce"),
        (dr.fpu,  0,   1,      "fpu"),
        (dr.le,   0,   80,     "le"),
        (so.sopc, 0,   1000,   "sopc"),
        (io.iopc, 0,   1000,   "iopc"),
        (f.fpc,   0,   1000,   "fpc"),
    ]

    return variables
end

function _variables_b()
    @named dr = death_rate()

    variables = [
        (dr.lmf,   0, 2,   "lmf"),
        (dr.lmhs,  0, 2,   "lmhs"),
        (dr.lmp,   0, 2,   "lmp"),
        (dr.lmc,   0, 2,   "lmc"),
        (dr.hsapc, 0, 250, "hsapc"),
        (dr.ehspc, 0, 250, "ehspc"),
    ]

    return variables
end

function _variables_c()
    @named br = birth_rate()

    variables = [
        (br.tf,    0,    15,   "tf"),
        (br.mtf,   0,    15,   "mtf"),
        (br.dtf,   0,    15,   "dtf"),
        (br.dcfs,  0,    15,   "dcfs"),
        (br.frsn,  0.6,  1.4,  "frsn"),
        (br.sfsn,  0.75, 1.25, "sfsn"),
        (br.cmple, 1,    4,    "cmple"),
    ]

    return variables
end



"""
    fig_84(; kwargs...)

Reproduce Fig 2.84. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-1: historical behavior, 1900-1975.
"""
fig_84(; kwargs...) = plotvariables(historicalrunsolution(), (t, 1900, 1970), _variables_a(); title="Fig. 2.84a", kwargs...)

"""
    fig_85(; kwargs...)

Reproduce Fig 2.85. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2—2: historical behavior, 1900—1975, mortality variables.
"""
fig_85(; kwargs...) = plotvariables(historicalrunsolution(), (t, 1900, 1970), _variables_b(); title="Fig. 2.85a", kwargs...)

"""
    fig_86(; kwargs...)

Reproduce Fig 2.86. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-3: historical behavior, 1900-1975, fertility variables.
"""
fig_86(; kwargs...) = plotvariables(historicalrunsolution(), (t, 1900, 1970), _variables_c(); title="Fig. 2.86a", kwargs...)

"""
    fig_87(; kwargs...)

Reproduce Fig 2.87. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-4: constant low income.
"""
function fig_87(; kwargs...)
    parameters_2_87 = getparameters()
    parameters_2_87[:iphst] = 4000
    parameters_2_87[:lt2] = 1900

    system = historicalrun(params=parameters_2_87)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_a(); title="Fig. 2.87a", kwargs...)
end

"""
    fig_88(; kwargs...)

Reproduce Fig 2.88. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-5: constant high income.
"""
function fig_88(; kwargs...)
    parameters_2_88 = getparameters()
    parameters_2_88[:iphst] = 4000
    parameters_2_88[:lt2] = 1900
    parameters_2_88[:cio] = 1000
    parameters_2_88[:cso] = 1500
    parameters_2_88[:cfood] = 2500

    system = historicalrun(params=parameters_2_88)
    solution = solve(system, (1900, 2100))

    plotvariables(solution, (t, 1900, 2100), _variables_a(); title="Fig. 2.88a", kwargs...)
end

"""
    fig_89(; kwargs...)

Reproduce Fig 2.89. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-6: constant low income, improved health care.
"""
function fig_89(; kwargs...)
    parameters_2_89 = getparameters()
    parameters_2_89[:lt2] = 1900

    system = historicalrun(params=parameters_2_89)
    solution = solve(system, (1900, 2100))

    plotvariables(solution, (t, 1900, 2100), _variables_a(); title="Fig. 2.89a", kwargs...)
end


"""
    fig_90(; kwargs...)

Reproduce Fig 2.90. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-7: exponential economic growth.
"""
fig_90(; kwargs...) = plotvariables(historicalrunsolution(), (t, 1900, 2100), _variables_a(); title="Fig. 2.90a", kwargs...)

"""
    fig_91(; kwargs...)

Reproduce Fig 2.91. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-8: exponential economic growth, mortality variables.
"""
fig_91(; kwargs...) = plotvariables(historicalrunsolution(), (t, 1900, 2100), _variables_b(); title="Fig. 2.91a", kwargs...)

"""
    fig_93(; kwargs...)

Reproduce Fig 2.93. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-9: exponential economic growth, fertility variables.
"""
fig_93(; kwargs...) = plotvariables(historicalrunsolution(), (t, 1900, 2100), _variables_c(); title="Fig. 2.93a", kwargs...)

"""
    fig_96(; kwargs...)

Reproduce Fig 2.96. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-11: exponential economic growth, perfect fertility control.
"""
function fig_96(; kwargs...)
    parameters_2_96 = getparameters()
    parameters_2_96[:fcest] = 1975

    system = historicalrun(params=parameters_2_96)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_a(); title="Fig. 2.96a", kwargs...)
end

"""
    fig_97(; kwargs...)

Reproduce Fig 2.97. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-12: exponential economic growth, perfect fertility control, reduced desired family size.
"""
function fig_97(; kwargs...)
    parameters_2_97 = getparameters()
    parameters_2_97[:fcest] = 1975
    parameters_2_97[:zpgt] = 1975

    system = historicalrun(params=parameters_2_97)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_a(); title="Fig. 2.97a", kwargs...)
end

"""
    fig_98(; kwargs...)

Reproduce Fig 2.98. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-13: constant total output.
"""
function fig_98(; kwargs...)
    parameters_2_98 = getparameters()
    parameters_2_98[:lt] = 2000

    system = historicalrun(params=parameters_2_98)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_a(); title="Fig. 2.98a", kwargs...)
end

"""
    fig_99(; kwargs...)

Reproduce Fig 2.99. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-14: constant total output, perfect fertility control.
"""
function fig_99(; kwargs...)
    parameters_2_99 = getparameters()
    parameters_2_99[:lt] = 2000
    parameters_2_99[:fcest] = 1975

    system = historicalrun(params=parameters_2_99)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_a(); title="Fig. 2.99a", kwargs...)
end

"""
    fig_100(; kwargs...)

Reproduce Fig 2.100. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2- 15: constant total output, perfect fertility control, reduced desired family size.
"""
function fig_100(; kwargs...)
    parameters_2_100 = getparameters()
    parameters_2_100[:lt] = 2000
    parameters_2_100[:fcest] = 1975
    parameters_2_100[:zpgt] = 1975

    system = historicalrun(params=parameters_2_100)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_a(); title="Fig. 2.100a", kwargs...)
end

function fig103solution()
    isdefined(@__MODULE__, :_solution_103) && return _solution_103

    parameters_2_103 = getparameters()
    parameters_2_103[:lt] = 2000

    tables_2_103 = gettables()
    tables_2_103[:lmhs2] = (1.0, 1.5, 1.8, 2.0, 2.2, 2.35)

    system = historicalrun(params=parameters_2_103, tables=tables_2_103)
    global _solution_103 = solve(system, (1900, 2100))

    return _solution_103
end


"""
    fig_103a(; kwargs...)

Reproduce Fig 2.103a. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-18: maximum life expectancy of 100 years.
"""
fig_103a(; kwargs...) = plotvariables(fig103solution(), (t, 1900, 2100), _variables_a(); title="Fig. 2.103a", kwargs...)

"""
    fig_103b(; kwargs...)

Reproduce Fig 2.103b. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-18: maximum life expectancy of 100 years.
"""
fig_103b(; kwargs...) = plotvariables(fig103solution(), (t, 1900, 2100), _variables_b(); title="Fig. 2.103b", kwargs...)

"""
    fig_103c(; kwargs...)

Reproduce Fig 2.103c. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-18: maximum life expectancy of 100 years.
"""
fig_103c(; kwargs...) = plotvariables(fig103solution(), (t, 1900, 2100), _variables_c(); title="Fig. 2.103c", kwargs...)
