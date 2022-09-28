include("../../../plotvariables.jl")


function historicalrunsolution()
    isdefined(@__MODULE__, :_solution_historicalrun) && return _solution_historicalrun
    global _solution_historicalrun = solve(historicalrun(), (1900, 2100))
    return _solution_historicalrun
end


function variables_a()
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

function variables_b()
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

function variables_c()
    @named br = birth_rate()

    variables = [
        (br.tf,   0, 15,   "tf"),
        (br.mtf,  0, 15,   "mtf"),
        (br.dtf,   0, 15,   "dtf"),
        (br.dcfs,   0, 15,   "dcfs"),
        (br.frsn, 0.6, 1.4, "frsn"),
        (br.sfsn, 0.75, 1.25, "sfsn"),
        (br.cmple, 1, 4, "cmple"),
    ]

    return variables
end

"""
    Reproduce Fig 2.84b. The original figure is presented on Chapter 2.
"""
fig_84() = plotvariables(historicalrunsolution(), (t, 1900, 1970), variables_a(); title="Fig. 2.84b")

"""
    Reproduce Fig 2.85b. The original figure is presented on Chapter 2.
"""
fig_85() = plotvariables(historicalrunsolution(), (t, 1900, 1970), variables_b(); title="Fig. 2.85b")

"""
    Reproduce Fig 2.86b. The original figure is presented on Chapter 2.
"""
fig_86() = plotvariables(historicalrunsolution(), (t, 1900, 1970), variables_c(); title="Fig. 2.86b")

"""
    Reproduce Fig 2.87b. The original figure is presented on Chapter 2.
"""
function fig_87()
    parameters_2_87 = getparameters()
    parameters_2_87[:iphst] = 4000
    parameters_2_87[:lt2] = 1900

    system = historicalrun(params=parameters_2_87)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables_a(); title="Fig. 2.87b")
end

"""
    Reproduce Fig 2.88b. The original figure is presented on Chapter 2.
"""
function fig_88()
    parameters_2_88 = getparameters()
    parameters_2_88[:iphst] = 4000
    parameters_2_88[:lt2] = 1900
    parameters_2_88[:cio] = 1000
    parameters_2_88[:cso] = 1500
    parameters_2_88[:cfood] = 2500

    system = historicalrun(params=parameters_2_88)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables_a(); title="Fig. 2.88b")
end

"""
    Reproduce Fig 2.89b. The original figure is presented on Chapter 2.
"""
function fig_89()
    parameters_2_89 = getparameters()
    parameters_2_89[:lt2] = 1900

    system = historicalrun(params=parameters_2_89)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables_a(); title="Fig. 2.89b")
end

"""
    Reproduce Fig 2.90b. The original figure is presented on Chapter 2.
"""
fig_90() = plotvariables(historicalrunsolution(), (t, 1900, 2100), variables_a(); title="Fig. 2.90b")

"""
    Reproduce Fig 2.91b. The original figure is presented on Chapter 2.
"""
fig_91() = plotvariables(historicalrunsolution(), (t, 1900, 2100), variables_b(); title="Fig. 2.91b")

"""
    Reproduce Fig 2.93b. The original figure is presented on Chapter 2.
"""
fig_93() = plotvariables(historicalrunsolution(), (t, 1900, 2100), variables_c(); title="Fig. 2.93b")

"""
    Reproduce Fig 2.96b. The original figure is presented on Chapter 2.
"""
function fig_96()
    parameters_2_96 = getparameters()
    parameters_2_96[:fcest] = 75

    system = historicalrun(params=parameters_2_96)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables_a(); title="Fig. 2.96b")
end

"""
    Reproduce Fig 2.97b. The original figure is presented on Chapter 2.
"""
function fig_97()
    parameters_2_97 = getparameters()
    parameters_2_97[:fcest] = 75
    parameters_2_97[:zpgt] = 75

    system = historicalrun(params=parameters_2_97)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables_a(); title="Fig. 2.97b")
end

"""
    Reproduce Fig 2.98b. The original figure is presented on Chapter 2.
"""
function fig_98()
    parameters_2_98 = getparameters()
    parameters_2_98[:lt] = 2000

    system = historicalrun(params=parameters_2_98)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables_a(); title="Fig. 2.98b")
end

"""
    Reproduce Fig 2.99b. The original figure is presented on Chapter 2.
"""
function fig_99()
    parameters_2_99 = getparameters()
    parameters_2_99[:lt] = 2000
    parameters_2_99[:fcest] = 75

    system = historicalrun(params=parameters_2_99)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables_a(); title="Fig. 2.99b")
end

"""
    Reproduce Fig 2.100b. The original figure is presented on Chapter 2.
"""
function fig_100()
    parameters_2_100 = getparameters()
    parameters_2_100[:lt] = 2000
    parameters_2_100[:fcest] = 75
    parameters_2_100[:zpgt] = 75

    system = historicalrun(params=parameters_2_100)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables_a(); title="Fig. 2.100b")
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
    Reproduce Fig 2.101a. The original figure is presented on Chapter 2.
"""
fig_101a() = plotvariables(fig101solution(), (t, 1900, 2100), variables_a(); title="Fig. 2.101a")

"""
    Reproduce Fig 2.101b. The original figure is presented on Chapter 2.
"""
fig_101b() = plotvariables(fig101solution(), (t, 1900, 2100), variables_b(); title="Fig. 2.101b")

"""
    Reproduce Fig 2.101c. The original figure is presented on Chapter 2.
"""
fig_101c() = plotvariables(fig101solution(), (t, 1900, 2100), variables_c(); title="Fig. 2.101c")


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
    Reproduce Fig 2.102a. The original figure is presented on Chapter 2.
"""
fig_102a() = plotvariables(fig102solution(), (t, 1900, 2100), variables_a(); title="Fig. 2.102a")

"""
    Reproduce Fig 2.102b. The original figure is presented on Chapter 2.
"""
fig_102b() = plotvariables(fig102solution(), (t, 1900, 2100), variables_b(); title="Fig. 2.102b")

"""
    Reproduce Fig 2.102c. The original figure is presented on Chapter 2.
"""
fig_102c() = plotvariables(fig102solution(), (t, 1900, 2100), variables_c(); title="Fig. 2.102c")


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
    Reproduce Fig 2.104a. The original figure is presented on Chapter 2.
"""
fig_104a() = plotvariables(fig104solution(), (t, 1900, 2100), variables_a(); title="Fig. 2.104a")

"""
    Reproduce Fig 2.104b. The original figure is presented on Chapter 2.
"""
fig_104b() = plotvariables(fig104solution(), (t, 1900, 2100), variables_b(); title="Fig. 2.104b")

"""
    Reproduce Fig 2.104c. The original figure is presented on Chapter 2.
"""
fig_104c() = plotvariables(fig104solution(), (t, 1900, 2100), variables_c(); title="Fig. 2.104c")


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
    Reproduce Fig 2.105a. The original figure is presented on Chapter 2.
"""
fig_105a() = plotvariables(fig105solution(), (t, 1900, 2100), variables_a(); title="Fig. 2.105a")

"""
    Reproduce Fig 2.105b. The original figure is presented on Chapter 2.
"""
fig_105b() = plotvariables(fig105solution(), (t, 1900, 2100), variables_b(); title="Fig. 2.105b")

"""
    Reproduce Fig 2.105c. The original figure is presented on Chapter 2.
"""
fig_105c() = plotvariables(fig105solution(), (t, 1900, 2100), variables_c(); title="Fig. 2.105c")


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
    Reproduce Fig 2.106a. The original figure is presented on Chapter 2.
"""
fig_106a() = plotvariables(fig106solution(), (t, 1900, 2100), variables_a(); title="Fig. 2.106a")

"""
    Reproduce Fig 2.106b. The original figure is presented on Chapter 2.
"""
fig_106b() = plotvariables(fig106solution(), (t, 1900, 2100), variables_b(); title="Fig. 2.106b")

"""
    Reproduce Fig 2.106c. The original figure is presented on Chapter 2.
"""
fig_106c() = plotvariables(fig106solution(), (t, 1900, 2100), variables_c(); title="Fig. 2.106c")


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
    Reproduce Fig 2.107a. The original figure is presented on Chapter 2.
"""
fig_107a() = plotvariables(fig107solution(), (t, 1900, 2100), variables_a(); title="Fig. 2.107a")

"""
    Reproduce Fig 2.107b. The original figure is presented on Chapter 2.
"""
fig_107b() = plotvariables(fig107solution(), (t, 1900, 2100), variables_b(); title="Fig. 2.107b")

"""
    Reproduce Fig 2.107c. The original figure is presented on Chapter 2.
"""
fig_107c() = plotvariables(fig107solution(), (t, 1900, 2100), variables_c(); title="Fig. 2.107c")


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
    Reproduce Fig 2.108a. The original figure is presented on Chapter 2.
"""
fig_108a() = plotvariables(fig108solution(), (t, 1900, 2100), variables_a(); title="Fig. 2.108a")

"""
    Reproduce Fig 2.108b. The original figure is presented on Chapter 2.
"""
fig_108b() = plotvariables(fig108solution(), (t, 1900, 2100), variables_b(); title="Fig. 2.108b")

"""
    Reproduce Fig 2.108c. The original figure is presented on Chapter 2.
"""
fig_108c() = plotvariables(fig108solution(), (t, 1900, 2100), variables_c(); title="Fig. 2.108c")


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
    Reproduce Fig 2.109a. The original figure is presented on Chapter 2.
"""
fig_109a() = plotvariables(fig109solution(), (t, 1900, 2100), variables_a(); title="Fig. 2.109a")

"""
    Reproduce Fig 2.109b. The original figure is presented on Chapter 2.
"""
fig_109b() = plotvariables(fig109solution(), (t, 1900, 2100), variables_b(); title="Fig. 2.109b")

"""
    Reproduce Fig 2.109c. The original figure is presented on Chapter 2.
"""
fig_109c() = plotvariables(fig109solution(), (t, 1900, 2100), variables_c(); title="Fig. 2.109c")


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
    Reproduce Fig 2.110a. The original figure is presented on Chapter 2.
"""
fig_110a() = plotvariables(fig110solution(), (t, 1900, 2100), variables_a(); title="Fig. 2.110a")

"""
    Reproduce Fig 2.110b. The original figure is presented on Chapter 2.
"""
fig_110b() = plotvariables(fig110solution(), (t, 1900, 2100), variables_b(); title="Fig. 2.110b")

"""
    Reproduce Fig 2.110c. The original figure is presented on Chapter 2.
"""
fig_110c() = plotvariables(fig110solution(), (t, 1900, 2100), variables_c(); title="Fig. 2.110c")


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
    Reproduce Fig 2.111a. The original figure is presented on Chapter 2.
"""
fig_111a() = plotvariables(fig111solution(), (t, 1900, 2100), variables_a(); title="Fig. 2.111a")

"""
    Reproduce Fig 2.111b. The original figure is presented on Chapter 2.
"""
fig_111b() = plotvariables(fig111solution(), (t, 1900, 2100), variables_b(); title="Fig. 2.111b")

"""
    Reproduce Fig 2.111c. The original figure is presented on Chapter 2.
"""
fig_111c() = plotvariables(fig111solution(), (t, 1900, 2100), variables_c(); title="Fig. 2.111c")


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
    Reproduce Fig 2.112a. The original figure is presented on Chapter 2.
"""
fig_112a() = plotvariables(fig112solution(), (t, 1900, 2100), variables_a(); title="Fig. 2.112a")

"""
    Reproduce Fig 2.112b. The original figure is presented on Chapter 2.
"""
fig_112b() = plotvariables(fig112solution(), (t, 1900, 2100), variables_b(); title="Fig. 2.112b")

"""
    Reproduce Fig 2.112c. The original figure is presented on Chapter 2.
"""
fig_112c() = plotvariables(fig112solution(), (t, 1900, 2100), variables_c(); title="Fig. 2.112c")


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
    Reproduce Fig 2.113a. The original figure is presented on Chapter 2.
"""
fig_113a() = plotvariables(fig113solution(), (t, 1900, 2100), variables_a(); title="Fig. 2.113a")

"""
    Reproduce Fig 2.113b. The original figure is presented on Chapter 2.
"""
fig_113b() = plotvariables(fig113solution(), (t, 1900, 2100), variables_b(); title="Fig. 2.113b")

"""
    Reproduce Fig 2.113c. The original figure is presented on Chapter 2.
"""
fig_113c() = plotvariables(fig113solution(), (t, 1900, 2100), variables_c(); title="Fig. 2.113c")
