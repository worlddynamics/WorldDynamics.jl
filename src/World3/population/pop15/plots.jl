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
        (pop.pc,   0, 1,   "pc"),
        (pop.pf,   0, 1,   "pf"),
        (pop.pw,   0, 1,   "pw"),
        (pop.pe,   0, 1,   "pe"),
        (dr.lmf,   0, 2,   "lmf"),
        (dr.lmhs,  0, 2,   "lmhs"),
        (dr.lmp,   0, 2,   "lmp"),
        (dr.lmc,   0, 2,   "lmc"),
        (dr.hsapc, 0, 250, "hsapc"),
        (dr.ehspc, 0, 250, "ehspc"),
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


fig_84() = plotvariables(historicalrunsolution(), (t, 1900, 1970), variables_a(); title="Fig. 2.84c")
fig_85() = plotvariables(historicalrunsolution(), (t, 1900, 1970), variables_b(); title="Fig. 2.85c")
fig_86() = plotvariables(historicalrunsolution(), (t, 1900, 1970), variables_c(); title="Fig. 2.86c")

function fig_87()
    parameters_2_87 = getparameters()
    parameters_2_87[:iphst] = 4000
    parameters_2_87[:lt2] = 1900

    system = historicalrun(params=parameters_2_87)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables_a(); title="Fig. 2.87c")
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

    return plotvariables(solution, (t, 1900, 2100), variables_a(); title="Fig. 2.88c")
end

function fig_89()
    parameters_2_89 = getparameters()
    parameters_2_89[:lt2] = 1900

    system = historicalrun(params=parameters_2_89)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables_a(); title="Fig. 2.89c")
end

fig_90() = plotvariables(historicalrunsolution(), (t, 1900, 2100), variables_a(); title="Fig. 2.90c")
fig_91() = plotvariables(historicalrunsolution(), (t, 1900, 2100), variables_b(); title="Fig. 2.91c")
fig_93() = plotvariables(historicalrunsolution(), (t, 1900, 2100), variables_c(); title="Fig. 2.93c")

function fig94solution()
    isdefined(@__MODULE__, :_solution_94) && return _solution_94

    @named pop = population()

    system = historicalrun()

    new_equations = equations(system)
    new_equations[96] = pop.extra ~ 0.1 * pop.p6 + 0.25 * pop.p7 + 0.3 * pop.p8 + 0.25 * pop.p9 + 0.1 * pop.p10

    @named new_system = ODESystem(new_equations)
    global _solution_94 = solve(new_system, (1900, 2100))

    return _solution_94
end

fig_94a() = plotvariables(fig94solution(), (t, 1900, 2100), variables_a(); title="Fig. 2.94a")
fig_94b() = plotvariables(fig94solution(), (t, 1900, 2100), variables_b(); title="Fig. 2.94b")
fig_94c() = plotvariables(fig94solution(), (t, 1900, 2100), variables_c(); title="Fig. 2.94c")

function fig_96()
    parameters_2_96 = getparameters()
    parameters_2_96[:fcest] = 75

    system = historicalrun(params=parameters_2_96)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables_a(); title="Fig. 2.96c")
end

function fig_97()
    parameters_2_97 = getparameters()
    parameters_2_97[:fcest] = 75
    parameters_2_97[:zpgt] = 75

    system = historicalrun(params=parameters_2_97)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables_a(); title="Fig. 2.97c")
end

function fig_98()
    parameters_2_98 = getparameters()
    parameters_2_98[:lt] = 2000

    system = historicalrun(params=parameters_2_98)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables_a(); title="Fig. 2.98c")
end

function fig_99()
    parameters_2_99 = getparameters()
    parameters_2_99[:lt] = 2000
    parameters_2_99[:fcest] = 75

    system = historicalrun(params=parameters_2_99)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables_a(); title="Fig. 2.99c")
end

function fig_100()
    parameters_2_100 = getparameters()
    parameters_2_100[:lt] = 2000
    parameters_2_100[:fcest] = 75
    parameters_2_100[:zpgt] = 75

    system = historicalrun(params=parameters_2_100)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables_a(); title="Fig. 2.100c")
end
