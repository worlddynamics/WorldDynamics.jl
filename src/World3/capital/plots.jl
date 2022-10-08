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
        (ss.fioas, 0, 0.4,  "fioas"),
        (js.cuf,   0, 1,    "cuf"),
    ]

    return variables
end

function variables_40()
    @named is = industrial_subsector()
    @named ss = service_subsector()
    @named js = job_subsector()

    variables = [
        (is.iopc,  0, 100,   "iopc"),
        (ss.sopc,  0, 100,   "sopc"),
        (is.io,    0, 400e9, "io"),
        (ss.fioas, 0, 0.4,   "fioas"),
        (js.cuf,   0, 1,     "cuf"),
    ]

    return variables
end

function variables_45()
    @named pop = population()
    @named nr = non_renewable()
    @named ag = agriculture()

    variables = [
        (pop.pop,  0, 5e9,  "pop"),
        (nr.fcaor, 0, 0.25, "fcaor"),
        (ag.fioaa, 0, 0.5,  "fioaa"),
    ]

    return variables
end


"""
    Reproduce Fig 3.36. The original figure is presented on Chapter 3.
"""
function fig_36(; kwargs...)
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

    return plotvariables(historicalrunsolution(), (t, 1900, 1970), variables; title="Fig. 3.36", kwargs...)
end


"""
    Reproduce Fig 3.37. The original figure is presented on Chapter 3.
"""
fig_37(; kwargs...) = plotvariables(historicalrunsolution(), (t, 1900, 2000), variables_37(); title="Fig. 3.37", kwargs...)


"""
    Reproduce Fig 3.38. The original figure is presented on Chapter 3.
"""
function fig_38(; kwargs...)
    parameters_3_38 = getparameters()
    parameters_3_38[:alic1] = 21

    system = historicalrun(params=parameters_3_38)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2000), variables_37(); title="Fig. 3.38", kwargs...)
end

"""
    Reproduce Fig 3.39. The original figure is presented on Chapter 3.
"""
function fig_39(; kwargs...)
    parameters_3_39 = getparameters()
    parameters_3_39[:icor1] = 2

    system = historicalrun(params=parameters_3_39)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2000), variables_37(); title="Fig. 3.39", kwargs...)
end

"""
    Reproduce Fig 3.40. The original figure is presented on Chapter 3.
"""
function fig_40(; kwargs...)
    parameters_3_40 = getparameters()
    parameters_3_40[:icor1] = 4

    system = historicalrun(params=parameters_3_40)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2000), variables_40(); title="Fig. 3.40", kwargs...)
end

"""
    Reproduce Fig 3.41. The original figure is presented on Chapter 3.
"""
function fig_41(; kwargs...)
    cap_tables_3_41 = gettables()
    cap_tables_3_41[:fcaor] = (0.35, 0.35, 0.35, 0.35, 0.35, 0.35, 0.35, 0.35, 0.35, 0.35, 0.35)

    system = historicalrun(tables=cap_tables_3_41)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2000), variables_40(); title="Fig. 3.41", kwargs...)
end

"""
    Reproduce Fig 3.42. The original figure is presented on Chapter 3.
"""
function fig_42(; kwargs...)
    parameters_3_42 = getparameters()
    parameters_3_42[:scor1] = 2

    system = historicalrun(params=parameters_3_42)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2000), variables_37(); title="Fig. 3.42", kwargs...)
end

"""
    Reproduce Fig 3.43. The original figure is presented on Chapter 3.
"""
function fig_43(; kwargs...)
    @named pop = population()
    @named nr = non_renewable()
    @named ag = agriculture()

    variables = [
        (pop.pop,  0, 5e9, "pop"),
        (nr.fcaor, 0, 1,   "fcaor"),
        (ag.fioaa, 0, 0.5, "fioaa"),
    ]

    cap_tables_3_43 = gettables()
    cap_tables_3_43[:fcaor] = (0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.4, 0.6, 0.8)

    system = historicalrun(tables=cap_tables_3_43)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2000), variables; title="Fig. 3.43", kwargs...)
end

"""
    Reproduce Fig 3.44. The original figure is presented on Chapter 3.
"""
function fig_44(; kwargs...)
    cap_tables_3_44 = gettables()
    cap_tables_3_44[:fcaor] = (0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.4, 0.6, 0.8)

    system = historicalrun(tables=cap_tables_3_44)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2000), variables_37(); title="Fig. 3.44", kwargs...)
end

"""
    Reproduce Fig 3.45. The original figure is presented on Chapter 3.
"""
function fig_45(; kwargs...)
    cap_tables_3_45 = gettables()
    cap_tables_3_45[:fioaa] = (0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.3, 0.3, 0.3)

    system = historicalrun(tables=cap_tables_3_45)
    solution = solve(system, (1900, 2100))
    return plotvariables(solution, (t, 1900, 2000), variables_45(); title="Fig. 3.45", kwargs...)
end

"""
    Reproduce Fig 3.46. The original figure is presented on Chapter 3.
"""
function fig_46(; kwargs...)
    cap_tables_3_46 = gettables()
    cap_tables_3_46[:fioaa] = (0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.3, 0.3, 0.3)

    system = historicalrun(tables=cap_tables_3_46)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2000), variables_37(); title="Fig. 3.46", kwargs...)
end

"""
    Reproduce Fig 3.47. The original figure is presented on Chapter 3.
"""
function fig_47(; kwargs...)
    cap_tables_3_47 = gettables()
    cap_tables_3_47[:pop] = (1.65, 1.73, 1.8, 2.1, 2.3, 2.55, 3, 3.65, 2, 0.5, 0.2)

    system = historicalrun(tables=cap_tables_3_47)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2000), variables_45(); title="Fig. 3.47", kwargs...)
end

"""
    Reproduce Fig 3.48. The original figure is presented on Chapter 3.
"""
function fig_48(; kwargs...)
    cap_tables_3_48 = gettables()
    cap_tables_3_48[:pop] = (1.65, 1.73, 1.8, 2.1, 2.3, 2.55, 3, 3.65, 2, 0.5, 0.2)

    system = historicalrun(tables=cap_tables_3_48)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2000), variables_37(); title="Fig. 3.48", kwargs...)
end
