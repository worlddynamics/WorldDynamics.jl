include("../../plotvariables.jl")


function historicalrunsolution()
    isdefined(@__MODULE__, :_solution_historicalrun) && return _solution_historicalrun
    global _solution_historicalrun = solve(historicalrun(), (1900, 2100))
    return _solution_historicalrun
end


function variables_37()
    @named is = industrial_subsector()
    @named ss = service_subsector()
    @named js = job_subsector()

    variables = [
        (is.iopc,  0, 1000, "iopc"),
        (ss.sopc,  0, 1000, "sopc"),
        (is.io,    0, 4e12, "io"),
        (ss.fioas, 0, 0.4, "fioas"),
        (js.cuf,   0, 1, "cuf"),
    ]

    return variables
end

function variables_40()
    @named is = industrial_subsector()
    @named ss = service_subsector()
    @named js = job_subsector()

    variables = [
        (is.iopc,  0, 100, "iopc"),
        (ss.sopc,  0, 100, "sopc"),
        (is.io,    0, 400e9, "io"),
        (ss.fioas, 0, 0.4, "fioas"),
        (js.cuf,   0, 1, "cuf"),
    ]

    return variables
end

function variables_45()
    @named pop = population()
    @named nr = non_renewable()
    @named ag = agriculture()

    variables = [
        (pop.pop,  0, 5e9, "pop"),
        (nr.fcaor,  0, 0.25, "fcaor"),
        (ag.fioaa,    0, 0.5, "fioaa"),
    ]

    return variables
end


function fig_36()
    @named pop = population()
    @named ag = agriculture()
    @named nr = non_renewable()

    variables = [
        (pop.pop,  0, 5e9,   "pop"),
        (ag.al,    0, 1.5e9, "al"),
        (ag.fioaa, 0, 0.5,   "fioaa"),
        (nr.fcaor, 0, 0.25,  "fcaor"),
        (ag.aiph,  0, 50,    "aiph"),
    ]

    return plotvariables(historicalrunsolution(), (t, 1900, 1970), variables; title="Fig. 3.36")
end

fig_37() = plotvariables(historicalrunsolution(), (t, 1900, 2000), variables_37(); title="Fig. 3.37")

function fig_38()
    parameters_3_38 = getparameters()
    parameters_3_38[:alic1] = 21

    system = historicalrun(params=parameters_3_38)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2000), variables_37(); title="Fig. 3.38")
end

function fig_39()
    parameters_3_39 = getparameters()
    parameters_3_39[:icor1] = 2

    system = historicalrun(params=parameters_3_39)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2000), variables_37(); title="Fig. 3.39")
end

function fig_40()
    parameters_3_40 = getparameters()
    parameters_3_40[:icor1] = 4

    system = historicalrun(params=parameters_3_40)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2000), variables_40(); title="Fig. 3.40")
end

function fig_41()
    cap_tables_3_41 = gettables()
    cap_tables_3_41[:fcaor] = (0.35, 0.35, 0.35, 0.35, 0.35, 0.35, 0.35, 0.35, 0.35, 0.35, 0.35)

    system = historicalrun(tables=cap_tables_3_41)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2000), variables_40(); title="Fig. 3.41")
end

function fig_42()
    parameters_3_42 = getparameters()
    parameters_3_42[:scor1] = 2

    system = historicalrun(params=parameters_3_42)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2000), variables_37(); title="Fig. 3.42")
end

function fig_43()
    @named pop = population()
    @named nr = non_renewable()
    @named ag = agriculture()

    variables = [
        (pop.pop,  0, 5e9, "pop"),
        (nr.fcaor,  0, 1, "fcaor"),
        (ag.fioaa,    0, 0.5, "fioaa"),
    ]

    cap_tables_3_43 = gettables()
    cap_tables_3_43[:fcaor] = (0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.4, 0.6, 0.8)

    system = historicalrun(tables=cap_tables_3_43)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2000), variables; title="Fig. 3.43")
end

function fig_44()
    cap_tables_3_44 = gettables()
    cap_tables_3_44[:fcaor] = (0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.4, 0.6, 0.8)

    system = historicalrun(tables=cap_tables_3_44)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2000), variables_37(); title="Fig. 3.44")
end

function fig_45()
    cap_tables_3_45 = gettables()
    cap_tables_3_45[:fioaa] = (0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.3, 0.3, 0.3)

    system = historicalrun(tables=cap_tables_3_45)
    solution = solve(system, (1900, 2100))
    return plotvariables(solution, (t, 1900, 2000), variables_45(); title="Fig. 3.45")
end

function fig_46()
    cap_tables_3_46 = gettables()
    cap_tables_3_46[:fcaor] = (0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.3, 0.3, 0.3)

    system = historicalrun(tables=cap_tables_3_46)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2000), variables_37(); title="Fig. 3.46")
end

function fig_47()
    cap_tables_3_47 = gettables()
    cap_tables_3_47[:pop] = (1.65, 1.73, 1.8, 2.1, 2.3, 2.55, 3, 3.65, 2, 0.5, 0.2)

    system = historicalrun(tables=cap_tables_3_47)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2000), variables_45(); title="Fig. 3.47")
end

function fig_48()
    cap_tables_3_48 = gettables()
    cap_tables_3_48[:pop] = (1.65, 1.73, 1.8, 2.1, 2.3, 2.55, 3, 3.65, 2, 0.5, 0.2)

    system = historicalrun(tables=cap_tables_3_48)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2000), variables_37(); title="Fig. 3.48")
end
