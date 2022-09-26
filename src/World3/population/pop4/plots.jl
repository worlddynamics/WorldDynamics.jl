include("../../../plotvariables.jl")


function _historicalrunsolution()
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

fig_84() = plotvariables(_historicalrunsolution(), (t, 1900, 1970), _variables_a(); title="Fig. 2.84b")
fig_85() = plotvariables(_historicalrunsolution(), (t, 1900, 1970), _variables_b(); title="Fig. 2.85b")
fig_86() = plotvariables(_historicalrunsolution(), (t, 1900, 1970), _variables_c(); title="Fig. 2.86b")

function fig_87()
    parameters_2_87 = getparameters()
    parameters_2_87[:iphst] = 4000
    parameters_2_87[:lt2] = 1900

    system = historicalrun(params=parameters_2_87)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_a(); title="Fig. 2.87b")
end

function fig_88()
    parameters_2_88 = getparameters()
    parameters_2_88[:iphst] = 4000
    parameters_2_88[:lt2] = 1900
    parameters_2_88[:cio] = 1000
    parameters_2_88[:cso] = 1500
    parameters_2_88[:cfood] = 2500

    system = historicalrun(params=parameters_2_88)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_a(); title="Fig. 2.88b")
end

function fig_89()
    parameters_2_89 = getparameters()
    parameters_2_89[:lt2] = 1900

    system = historicalrun(params=parameters_2_89)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_a(); title="Fig. 2.89b")
end

fig_90() = plotvariables(_historicalrunsolution(), (t, 1900, 2100), _variables_a(); title="Fig. 2.90b")
fig_91() = plotvariables(_historicalrunsolution(), (t, 1900, 2100), _variables_b(); title="Fig. 2.91b")
fig_93() = plotvariables(_historicalrunsolution(), (t, 1900, 2100), _variables_c(); title="Fig. 2.93b")

function fig_96()
    parameters_2_96 = getparameters()
    parameters_2_96[:fcest] = 75

    system = historicalrun(params=parameters_2_96)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_a(); title="Fig. 2.96b")
end

function fig_97()
    parameters_2_97 = getparameters()
    parameters_2_97[:fcest] = 75
    parameters_2_97[:zpgt] = 75

    system = historicalrun(params=parameters_2_97)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_a(); title="Fig. 2.97b")
end

function fig_98()
    parameters_2_98 = getparameters()
    parameters_2_98[:lt] = 2000

    system = historicalrun(params=parameters_2_98)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_a(); title="Fig. 2.98b")
end

function fig_99()
    parameters_2_99 = getparameters()
    parameters_2_99[:lt] = 2000
    parameters_2_99[:fcest] = 75

    system = historicalrun(params=parameters_2_99)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_a(); title="Fig. 2.99b")
end

function fig_100()
    parameters_2_100 = getparameters()
    parameters_2_100[:lt] = 2000
    parameters_2_100[:fcest] = 75
    parameters_2_100[:zpgt] = 75

    system = historicalrun(params=parameters_2_100)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_a(); title="Fig. 2.100b")
end


function _101solution()
    isdefined(@__MODULE__, :_solution_101) && return _solution_101

    parameters_2_101 = getparameters()
    parameters_2_101[:lt] = 2000

    system = historicalrun(params=parameters_2_101)
    global _solution_101 = solve(system, (1900, 2100))

    return _solution_101
end

fig_101a() = plotvariables(_101solution(), (t, 1900, 2100), _variables_a(); title="Fig. 2.101a")
fig_101b() = plotvariables(_101solution(), (t, 1900, 2100), _variables_b(); title="Fig. 2.101b")
fig_101c() = plotvariables(_101solution(), (t, 1900, 2100), _variables_c(); title="Fig. 2.101c")


function _102solution()
    isdefined(@__MODULE__, :_solution_102) && return _solution_102

    parameters_2_102 = getparameters()
    parameters_2_102[:lt] = 2000

    tables_2_102 = gettables()
    tables_2_102[:lmft] = (0.0, 1.4, 1.4, 1.4, 1.4, 1.4)

    system = historicalrun(params=parameters_2_102, tables=tables_2_102)
    global _solution_102 = solve(system, (1900, 2100))

    return _solution_102
end

fig_102a() = plotvariables(_102solution(), (t, 1900, 2100), _variables_a(); title="Fig. 2.102a")
fig_102b() = plotvariables(_102solution(), (t, 1900, 2100), _variables_b(); title="Fig. 2.102b")
fig_102c() = plotvariables(_102solution(), (t, 1900, 2100), _variables_c(); title="Fig. 2.102c")


function _104solution()
    isdefined(@__MODULE__, :_solution_104) && return _solution_104

    parameters_2_104 = getparameters()
    parameters_2_104[:lt] = 2000

    tables_2_104 = gettables()
    tables_2_104[:hsapc] = (0.0, 125.0, 250.0, 375.0, 500.0, 625.0, 750.0, 875.0, 1000.0)

    system = historicalrun(params=parameters_2_104, tables=tables_2_104)
    global _solution_104 = solve(system, (1900, 2100))

    return _solution_104
end

fig_104a() = plotvariables(_104solution(), (t, 1900, 2100), _variables_a(); title="Fig. 2.104a")
fig_104b() = plotvariables(_104solution(), (t, 1900, 2100), _variables_b(); title="Fig. 2.104b")
fig_104c() = plotvariables(_104solution(), (t, 1900, 2100), _variables_c(); title="Fig. 2.104c")


function _105solution()
    isdefined(@__MODULE__, :_solution_105) && return _solution_105

    parameters_2_105 = getparameters()
    parameters_2_105[:lt] = 2000

    tables_2_105 = gettables()
    tables_2_105[:cmi] = (0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)

    system = historicalrun(params=parameters_2_105, tables=tables_2_105)
    global _solution_105 = solve(system, (1900, 2100))

    return _solution_105
end

fig_105a() = plotvariables(_105solution(), (t, 1900, 2100), _variables_a(); title="Fig. 2.105a")
fig_105b() = plotvariables(_105solution(), (t, 1900, 2100), _variables_b(); title="Fig. 2.105b")
fig_105c() = plotvariables(_105solution(), (t, 1900, 2100), _variables_c(); title="Fig. 2.105c")


function _106solution()
    isdefined(@__MODULE__, :_solution_106) && return _solution_106

    parameters_2_106 = getparameters()
    parameters_2_106[:lt] = 2000

    tables_2_106 = gettables()
    tables_2_106[:fm] = (1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0)

    system = historicalrun(params=parameters_2_106, tables=tables_2_106)
    global _solution_106 = solve(system, (1900, 2100))

    return _solution_106
end

fig_106a() = plotvariables(_106solution(), (t, 1900, 2100), _variables_a(); title="Fig. 2.106a")
fig_106b() = plotvariables(_106solution(), (t, 1900, 2100), _variables_b(); title="Fig. 2.106b")
fig_106c() = plotvariables(_106solution(), (t, 1900, 2100), _variables_c(); title="Fig. 2.106c")


function _107solution()
    isdefined(@__MODULE__, :_solution_107) && return _solution_107

    parameters_2_107 = getparameters()
    parameters_2_107[:lt] = 2000

    tables_2_107 = gettables()
    tables_2_107[:sfsn] = (1.0, 1.9, 1.7, 1.6, 1.5)

    system = historicalrun(params=parameters_2_107, tables=tables_2_107)
    global _solution_107 = solve(system, (1900, 2100))

    return _solution_107
end

fig_107a() = plotvariables(_107solution(), (t, 1900, 2100), _variables_a(); title="Fig. 2.107a")
fig_107b() = plotvariables(_107solution(), (t, 1900, 2100), _variables_b(); title="Fig. 2.107b")
fig_107c() = plotvariables(_107solution(), (t, 1900, 2100), _variables_c(); title="Fig. 2.107c")


function _108solution()
    isdefined(@__MODULE__, :_solution_108) && return _solution_108

    parameters_2_108 = getparameters()
    parameters_2_108[:lt] = 2000

    tables_2_108 = gettables()
    tables_2_108[:sfsn] = (0.75, 0.75, 0.75, 0.75, 0.75)

    system = historicalrun(params=parameters_2_108, tables=tables_2_108)
    global _solution_108 = solve(system, (1900, 2100))

    return _solution_108
end

fig_108a() = plotvariables(_108solution(), (t, 1900, 2100), _variables_a(); title="Fig. 2.108a")
fig_108b() = plotvariables(_108solution(), (t, 1900, 2100), _variables_b(); title="Fig. 2.108b")
fig_108c() = plotvariables(_108solution(), (t, 1900, 2100), _variables_c(); title="Fig. 2.108c")


function _109solution()
    isdefined(@__MODULE__, :_solution_109) && return _solution_109

    parameters_2_109 = getparameters()
    parameters_2_109[:lt] = 2000
    parameters_2_109[:sad] = 50

    system = historicalrun(params=parameters_2_109)
    global _solution_109 = solve(system, (1900, 2100))

    return _solution_109
end

fig_109a() = plotvariables(_109solution(), (t, 1900, 2100), _variables_a(); title="Fig. 2.109a")
fig_109b() = plotvariables(_109solution(), (t, 1900, 2100), _variables_b(); title="Fig. 2.109b")
fig_109c() = plotvariables(_109solution(), (t, 1900, 2100), _variables_c(); title="Fig. 2.109c")


function _110solution()
    isdefined(@__MODULE__, :_solution_110) && return _solution_110

    parameters_2_110 = getparameters()
    parameters_2_110[:lt] = 2000

    tables_2_110 = gettables()
    tables_2_110[:frsn] = (1.0, 1.0, 1.0, 1.0, 1.0)

    system = historicalrun(params=parameters_2_110, tables=tables_2_110)
    global _solution_110 = solve(system, (1900, 2100))

    return _solution_110
end

fig_110a() = plotvariables(_110solution(), (t, 1900, 2100), _variables_a(); title="Fig. 2.110a")
fig_110b() = plotvariables(_110solution(), (t, 1900, 2100), _variables_b(); title="Fig. 2.110b")
fig_110c() = plotvariables(_110solution(), (t, 1900, 2100), _variables_c(); title="Fig. 2.110c")


function _111solution()
    isdefined(@__MODULE__, :_solution_111) && return _solution_111

    parameters_2_111 = getparameters()
    parameters_2_111[:lt] = 2000

    tables_2_111 = gettables()
    tables_2_111[:cmple] = (5.0, 5.0, 2.5, 1.8, 1.6, 1.4, 1.3, 1.15, 1.1)

    system = historicalrun(params=parameters_2_111, tables=tables_2_111)
    global _solution_111 = solve(system, (1900, 2100))

    return _solution_111
end

fig_111a() = plotvariables(_111solution(), (t, 1900, 2100), _variables_a(); title="Fig. 2.111a")
fig_111b() = plotvariables(_111solution(), (t, 1900, 2100), _variables_b(); title="Fig. 2.111b")
fig_111c() = plotvariables(_111solution(), (t, 1900, 2100), _variables_c(); title="Fig. 2.111c")


function _112solution()
    isdefined(@__MODULE__, :_solution_112) && return _solution_112

    parameters_2_112 = getparameters()
    parameters_2_112[:lt] = 2000
    parameters_2_112[:lpd] = 10

    system = historicalrun(params=parameters_2_112)
    global _solution_112 = solve(system, (1900, 2100))

    return _solution_112
end

fig_112a() = plotvariables(_112solution(), (t, 1900, 2100), _variables_a(); title="Fig. 2.112a")
fig_112b() = plotvariables(_112solution(), (t, 1900, 2100), _variables_b(); title="Fig. 2.112b")
fig_112c() = plotvariables(_112solution(), (t, 1900, 2100), _variables_c(); title="Fig. 2.112c")


function _113solution()
    isdefined(@__MODULE__, :_solution_113) && return _solution_113

    parameters_2_113 = getparameters()
    parameters_2_113[:lt] = 2000

    tables_2_113 = gettables()
    tables_2_113[:fce] = (0.5, 0.7, 0.8, 0.9, 0.95, 0.98, 0.98)

    system = historicalrun(params=parameters_2_113, tables=tables_2_113)
    global _solution_113 = solve(system, (1900, 2100))

    return _solution_113
end

fig_113a() = plotvariables(_113solution(), (t, 1900, 2100), _variables_a(); title="Fig. 2.113a")
fig_113b() = plotvariables(_113solution(), (t, 1900, 2100), _variables_b(); title="Fig. 2.113b")
fig_113c() = plotvariables(_113solution(), (t, 1900, 2100), _variables_c(); title="Fig. 2.113c")
