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
    @named pop = population()
    @named dr = death_rate()

    variables = [
        (pop.p1 ./ (pop.p1 + pop.p2 + pop.p3 + pop.p4), 0, 1,   "p1"),
        (pop.p2 ./ (pop.p1 + pop.p2 + pop.p3 + pop.p4), 0, 1,   "p2"),
        (pop.p3 ./ (pop.p1 + pop.p2 + pop.p3 + pop.p4), 0, 1,   "p3"),
        (pop.p4 ./ (pop.p1 + pop.p2 + pop.p3 + pop.p4), 0, 1,   "p4"),
        (dr.lmf,                                        0, 2,   "lmf"),
        (dr.lmhs,                                       0, 2,   "lmhs"),
        (dr.lmp,                                        0, 2,   "lmp"),
        (dr.lmc,                                        0, 2,   "lmc"),
        (dr.hsapc,                                      0, 250, "hsapc"),
        (dr.ehspc,                                      0, 250, "ehspc"),
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
fig_84(; kwargs...) = plotvariables(historicalrunsolution(), (t, 1900, 1970), _variables_a(); title="Fig. 2.84b", kwargs...)

"""
    fig_85(; kwargs...)

Reproduce Fig 2.85. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2—2: historical behavior, 1900—1975, mortality variables.
"""
fig_85(; kwargs...) = plotvariables(historicalrunsolution(), (t, 1900, 1970), _variables_b(); title="Fig. 2.85b", kwargs...)

"""
    fig_86(; kwargs...)

Reproduce Fig 2.86. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-3: historical behavior, 1900-1975, fertility variables.
"""
fig_86(; kwargs...) = plotvariables(historicalrunsolution(), (t, 1900, 1970), _variables_c(); title="Fig. 2.86b", kwargs...)

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

    return plotvariables(solution, (t, 1900, 2100), _variables_a(); title="Fig. 2.87b", kwargs...)
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

    return plotvariables(solution, (t, 1900, 2100), _variables_a(); title="Fig. 2.88b", kwargs...)
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

    return plotvariables(solution, (t, 1900, 2100), _variables_a(); title="Fig. 2.89b", kwargs...)
end


"""
    fig_90(; kwargs...)

Reproduce Fig 2.90. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-7: exponential economic growth.
"""
fig_90(; kwargs...) = plotvariables(historicalrunsolution(), (t, 1900, 2100), _variables_a(); title="Fig. 2.90b", kwargs...)

"""
    fig_91(; kwargs...)

Reproduce Fig 2.91. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-8: exponential economic growth, mortality variables.
"""
fig_91(; kwargs...) = plotvariables(historicalrunsolution(), (t, 1900, 2100), _variables_b(); title="Fig. 2.91b", kwargs...)

"""
    fig_93(; kwargs...)

Reproduce Fig 2.93. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-9: exponential economic growth, fertility variables.
"""
fig_93(; kwargs...) = plotvariables(historicalrunsolution(), (t, 1900, 2100), _variables_c(); title="Fig. 2.93b", kwargs...)

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

    return plotvariables(solution, (t, 1900, 2100), _variables_a(); title="Fig. 2.96b", kwargs...)
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

    return plotvariables(solution, (t, 1900, 2100), _variables_a(); title="Fig. 2.97b", kwargs...)
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

    return plotvariables(solution, (t, 1900, 2100), _variables_a(); title="Fig. 2.98b", kwargs...)
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

    return plotvariables(solution, (t, 1900, 2100), _variables_a(); title="Fig. 2.99b", kwargs...)
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

    return plotvariables(solution, (t, 1900, 2100), _variables_a(); title="Fig. 2.100b", kwargs...)
end


function fig101solution()
    isdefined(@__MODULE__, :_solution_101) && return _solution_101

    parameters_2_101 = getparameters()
    parameters_2_101[:lt] = 2000

    system = historicalrun(params=parameters_2_101)
    global _solution_101 = solve(system, (1900, 2100))

    return _solution_101
end


"""
    fig_101a(; kwargs...)

Reproduce Fig 2.101a. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-16: constant total output, reference for sensitivity tests.
"""
fig_101a(; kwargs...) = plotvariables(fig101solution(), (t, 1900, 2100), _variables_a(); title="Fig. 2.101a", kwargs...)

"""
    fig_101b(; kwargs...)

Reproduce Fig 2.101b. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-16: constant total output, reference for sensitivity tests.
"""
fig_101b(; kwargs...) = plotvariables(fig101solution(), (t, 1900, 2100), _variables_b(); title="Fig. 2.101b", kwargs...)

"""
    fig_101c(; kwargs...)

Reproduce Fig 2.101c. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-16: constant total output, reference for sensitivity tests.
"""
fig_101c(; kwargs...) = plotvariables(fig101solution(), (t, 1900, 2100), _variables_c(); title="Fig. 2.101c", kwargs...)


function fig102solution()
    isdefined(@__MODULE__, :_solution_102) && return _solution_102

    parameters_2_102 = getparameters()
    parameters_2_102[:lt] = 2000

    tables_2_102 = gettables()
    tables_2_102[:lmft] = (0.0, 1.4, 1.4, 1.4, 1.4, 1.4)

    system = historicalrun(params=parameters_2_102, tables=tables_2_102)
    global _solution_102 = solve(system, (1900, 2100))

    return _solution_102
end


"""
    fig_102a(; kwargs...)

Reproduce Fig 2.102a. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-17: equitable food distribution and nutrition education.
"""
fig_102a(; kwargs...) = plotvariables(fig102solution(), (t, 1900, 2100), _variables_a(); title="Fig. 2.102a", kwargs...)

"""
    fig_102b(; kwargs...)

Reproduce Fig 2.102b. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-17: equitable food distribution and nutrition education.
"""
fig_102b(; kwargs...) = plotvariables(fig102solution(), (t, 1900, 2100), _variables_b(); title="Fig. 2.102b", kwargs...)

"""
    fig_102c(; kwargs...)

Reproduce Fig 2.102c. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-17: equitable food distribution and nutrition education.
"""
fig_102c(; kwargs...) = plotvariables(fig102solution(), (t, 1900, 2100), _variables_c(); title="Fig. 2.102c", kwargs...)


function fig104solution()
    isdefined(@__MODULE__, :_solution_104) && return _solution_104

    parameters_2_104 = getparameters()
    parameters_2_104[:lt] = 2000

    tables_2_104 = gettables()
    tables_2_104[:hsapc] = (0.0, 125.0, 250.0, 375.0, 500.0, 625.0, 750.0, 875.0, 1000.0)

    system = historicalrun(params=parameters_2_104, tables=tables_2_104)
    global _solution_104 = solve(system, (1900, 2100))

    return _solution_104
end


"""
    fig_104a(; kwargs...)

Reproduce Fig 2.104a. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-19: greater allocations to health services.
"""
fig_104a(; kwargs...) = plotvariables(fig104solution(), (t, 1900, 2100), _variables_a(); title="Fig. 2.104a", kwargs...)

"""
    fig_104b(; kwargs...)

Reproduce Fig 2.104b. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-19: greater allocations to health services.
"""
fig_104b(; kwargs...) = plotvariables(fig104solution(), (t, 1900, 2100), _variables_b(); title="Fig. 2.104b", kwargs...)

"""
    fig_104c(; kwargs...)

Reproduce Fig 2.104c. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-19: greater allocations to health services.
"""
fig_104c(; kwargs...) = plotvariables(fig104solution(), (t, 1900, 2100), _variables_c(); title="Fig. 2.104c", kwargs...)


function fig105solution()
    isdefined(@__MODULE__, :_solution_105) && return _solution_105

    parameters_2_105 = getparameters()
    parameters_2_105[:lt] = 2000

    tables_2_105 = gettables()
    tables_2_105[:cmi] = (0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)

    system = historicalrun(params=parameters_2_105, tables=tables_2_105)
    global _solution_105 = solve(system, (1900, 2100))

    return _solution_105
end


"""
    fig_105a(; kwargs...)

Reproduce Fig 2.105a. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-20: no crowding effect.
"""
fig_105a(; kwargs...) = plotvariables(fig105solution(), (t, 1900, 2100), _variables_a(); title="Fig. 2.105a", kwargs...)

"""
    fig_105b(; kwargs...)

Reproduce Fig 2.105b. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-20: no crowding effect.
"""
fig_105b(; kwargs...) = plotvariables(fig105solution(), (t, 1900, 2100), _variables_b(); title="Fig. 2.105b", kwargs...)

"""
    fig_105c(; kwargs...)

Reproduce Fig 2.105c. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-20: no crowding effect.
"""
fig_105c(; kwargs...) = plotvariables(fig105solution(), (t, 1900, 2100), _variables_c(); title="Fig. 2.105c", kwargs...)


function fig106solution()
    isdefined(@__MODULE__, :_solution_106) && return _solution_106

    parameters_2_106 = getparameters()
    parameters_2_106[:lt] = 2000

    tables_2_106 = gettables()
    tables_2_106[:fm] = (1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0)

    system = historicalrun(params=parameters_2_106, tables=tables_2_106)
    global _solution_106 = solve(system, (1900, 2100))

    return _solution_106
end


"""
    fig_106a(; kwargs...)

Reproduce Fig 2.106a. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-21: constant maximum total fertility.
"""
fig_106a(; kwargs...) = plotvariables(fig106solution(), (t, 1900, 2100), _variables_a(); title="Fig. 2.106a", kwargs...)

"""
    fig_106b(; kwargs...)

Reproduce Fig 2.106b. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-21: constant maximum total fertility.
"""
fig_106b(; kwargs...) = plotvariables(fig106solution(), (t, 1900, 2100), _variables_b(); title="Fig. 2.106b", kwargs...)

"""
    fig_106c(; kwargs...)

Reproduce Fig 2.106c. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-21: constant maximum total fertility.
"""
fig_106c(; kwargs...) = plotvariables(fig106solution(), (t, 1900, 2100), _variables_c(); title="Fig. 2.106c", kwargs...)


function fig107solution()
    isdefined(@__MODULE__, :_solution_107) && return _solution_107

    parameters_2_107 = getparameters()
    parameters_2_107[:lt] = 2000

    tables_2_107 = gettables()
    tables_2_107[:sfsn] = (1.0, 1.9, 1.7, 1.6, 1.5)

    system = historicalrun(params=parameters_2_107, tables=tables_2_107)
    global _solution_107 = solve(system, (1900, 2100))

    return _solution_107
end


"""
    fig_107a(; kwargs...)

Reproduce Fig 2.107a. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-22: lower family size norm.
"""
fig_107a(; kwargs...) = plotvariables(fig107solution(), (t, 1900, 2100), _variables_a(); title="Fig. 2.107a", kwargs...)

"""
    fig_107b(; kwargs...)

Reproduce Fig 2.107b. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-22: lower family size norm.
"""
fig_107b(; kwargs...) = plotvariables(fig107solution(), (t, 1900, 2100), _variables_b(); title="Fig. 2.107b", kwargs...)

"""
    fig_107c(; kwargs...)

Reproduce Fig 2.107c. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-22: lower family size norm.
"""
fig_107c(; kwargs...) = plotvariables(fig107solution(), (t, 1900, 2100), _variables_c(); title="Fig. 2.107c", kwargs...)


function fig108solution()
    isdefined(@__MODULE__, :_solution_108) && return _solution_108

    parameters_2_108 = getparameters()
    parameters_2_108[:lt] = 2000

    tables_2_108 = gettables()
    tables_2_108[:sfsn] = (0.75, 0.75, 0.75, 0.75, 0.75)

    system = historicalrun(params=parameters_2_108, tables=tables_2_108)
    global _solution_108 = solve(system, (1900, 2100))

    return _solution_108
end


"""
    fig_108a(; kwargs...)

Reproduce Fig 2.108a. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-23: constant family size norm of 3.
"""
fig_108a(; kwargs...) = plotvariables(fig108solution(), (t, 1900, 2100), _variables_a(); title="Fig. 2.108a", kwargs...)

"""
    fig_108b(; kwargs...)

Reproduce Fig 2.108b. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-23: constant family size norm of 3.
"""
fig_108b(; kwargs...) = plotvariables(fig108solution(), (t, 1900, 2100), _variables_b(); title="Fig. 2.108b", kwargs...)

"""
    fig_108c(; kwargs...)

Reproduce Fig 2.108c. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-23: constant family size norm of 3.
"""
fig_108c(; kwargs...) = plotvariables(fig108solution(), (t, 1900, 2100), _variables_c(); title="Fig. 2.108c", kwargs...)


function fig109solution()
    isdefined(@__MODULE__, :_solution_109) && return _solution_109

    parameters_2_109 = getparameters()
    parameters_2_109[:lt] = 2000
    parameters_2_109[:sad] = 50

    system = historicalrun(params=parameters_2_109)
    global _solution_109 = solve(system, (1900, 2100))

    return _solution_109
end


"""
    fig_109a(; kwargs...)

Reproduce Fig 2.109a. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-24: increased social adjustment delay.
"""
fig_109a(; kwargs...) = plotvariables(fig109solution(), (t, 1900, 2100), _variables_a(); title="Fig. 2.109a", kwargs...)

"""
    fig_109b(; kwargs...)

Reproduce Fig 2.109b. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-24: increased social adjustment delay.
"""
fig_109b(; kwargs...) = plotvariables(fig109solution(), (t, 1900, 2100), _variables_b(); title="Fig. 2.109b", kwargs...)

"""
    fig_109c(; kwargs...)

Reproduce Fig 2.109c. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-24: increased social adjustment delay.
"""
fig_109c(; kwargs...) = plotvariables(fig109solution(), (t, 1900, 2100), _variables_c(); title="Fig. 2.109c", kwargs...)


function fig110solution()
    isdefined(@__MODULE__, :_solution_110) && return _solution_110

    parameters_2_110 = getparameters()
    parameters_2_110[:lt] = 2000

    tables_2_110 = gettables()
    tables_2_110[:frsn] = (1.0, 1.0, 1.0, 1.0, 1.0)

    system = historicalrun(params=parameters_2_110, tables=tables_2_110)
    global _solution_110 = solve(system, (1900, 2100))

    return _solution_110
end


"""
    fig_110a(; kwargs...)

Reproduce Fig 2.110a. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-25: no income expectation effect.
"""
fig_110a(; kwargs...) = plotvariables(fig110solution(), (t, 1900, 2100), _variables_a(); title="Fig. 2.110a", kwargs...)

"""
    fig_110b(; kwargs...)

Reproduce Fig 2.110b. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-25: no income expectation effect.
"""
fig_110b(; kwargs...) = plotvariables(fig110solution(), (t, 1900, 2100), _variables_b(); title="Fig. 2.110b", kwargs...)

"""
    fig_110c(; kwargs...)

Reproduce Fig 2.110c. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-25: no income expectation effect.
"""
fig_110c(; kwargs...) = plotvariables(fig110solution(), (t, 1900, 2100), _variables_c(); title="Fig. 2.110c", kwargs...)


function fig111solution()
    isdefined(@__MODULE__, :_solution_111) && return _solution_111

    parameters_2_111 = getparameters()
    parameters_2_111[:lt] = 2000

    tables_2_111 = gettables()
    tables_2_111[:cmple] = (5.0, 5.0, 2.5, 1.8, 1.6, 1.4, 1.3, 1.15, 1.1)

    system = historicalrun(params=parameters_2_111, tables=tables_2_111)
    global _solution_111 = solve(system, (1900, 2100))

    return _solution_111
end


"""
    fig_111a(; kwargs...)

Reproduce Fig 2.111a. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-26: increased compensation for perceived life expectancy.
"""
fig_111a(; kwargs...) = plotvariables(fig111solution(), (t, 1900, 2100), _variables_a(); title="Fig. 2.111a", kwargs...)

"""
    fig_111b(; kwargs...)

Reproduce Fig 2.111b. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-26: increased compensation for perceived life expectancy.
"""
fig_111b(; kwargs...) = plotvariables(fig111solution(), (t, 1900, 2100), _variables_b(); title="Fig. 2.111b", kwargs...)

"""
    fig_111c(; kwargs...)

Reproduce Fig 2.111c. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-26: increased compensation for perceived life expectancy.
"""
fig_111c(; kwargs...) = plotvariables(fig111solution(), (t, 1900, 2100), _variables_c(); title="Fig. 2.111c", kwargs...)


function fig112solution()
    isdefined(@__MODULE__, :_solution_112) && return _solution_112

    parameters_2_112 = getparameters()
    parameters_2_112[:lt] = 2000
    parameters_2_112[:lpd] = 10

    system = historicalrun(params=parameters_2_112)
    global _solution_112 = solve(system, (1900, 2100))

    return _solution_112
end


"""
    fig_112a(; kwargs...)

Reproduce Fig 2.112a. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-27: decreased lifetime perception delay.
"""
fig_112a(; kwargs...) = plotvariables(fig112solution(), (t, 1900, 2100), _variables_a(); title="Fig. 2.112a", kwargs...)

"""
    fig_112b(; kwargs...)

Reproduce Fig 2.112b. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-27: decreased lifetime perception delay.
"""
fig_112b(; kwargs...) = plotvariables(fig112solution(), (t, 1900, 2100), _variables_b(); title="Fig. 2.112b", kwargs...)

"""
    fig_112c(; kwargs...)

Reproduce Fig 2.112c. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-27: decreased lifetime perception delay.
"""
fig_112c(; kwargs...) = plotvariables(fig112solution(), (t, 1900, 2100), _variables_c(); title="Fig. 2.112c", kwargs...)


function fig113solution()
    isdefined(@__MODULE__, :_solution_113) && return _solution_113

    parameters_2_113 = getparameters()
    parameters_2_113[:lt] = 2000

    tables_2_113 = gettables()
    tables_2_113[:fce] = (0.5, 0.7, 0.8, 0.9, 0.95, 0.98, 0.98)

    system = historicalrun(params=parameters_2_113, tables=tables_2_113)
    global _solution_113 = solve(system, (1900, 2100))

    return _solution_113
end


"""
    fig_113a(; kwargs...)

Reproduce Fig 2.113a. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-28: decreased fertility control effectiveness.
"""
fig_113a(; kwargs...) = plotvariables(fig113solution(), (t, 1900, 2100), _variables_a(); title="Fig. 2.113a", kwargs...)

"""
    fig_113b(; kwargs...)

Reproduce Fig 2.113b. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-28: decreased fertility control effectiveness.
"""
fig_113b(; kwargs...) = plotvariables(fig113solution(), (t, 1900, 2100), _variables_b(); title="Fig. 2.113b", kwargs...)

"""
    fig_113c(; kwargs...)

Reproduce Fig 2.113c. The original figure is presented in Chapter 2 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 2-28: decreased fertility control effectiveness.
"""
fig_113c(; kwargs...) = plotvariables(fig113solution(), (t, 1900, 2100), _variables_c(); title="Fig. 2.113c", kwargs...)
