function historicalrunsolution()
    isdefined(@__MODULE__, :_solution_historicalrun) && return _solution_historicalrun
    global _solution_historicalrun = solve(historicalrun(), (1900, 2100))
    return _solution_historicalrun
end


function _variables_37()
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

function _variables_40()
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

function _variables_45()
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
    Reproduce Fig 3.36. The original figure is presented in Chapter 3 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Driving functions for the standard run of the capital sector.
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
    Reproduce Fig 3.37. The original figure is presented in Chapter 3 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 3-1: standard run of the capital sector with exogenous inputs.
"""
fig_37(; kwargs...) = plotvariables(historicalrunsolution(), (t, 1900, 2000), _variables_37(); title="Fig. 3.37", kwargs...)


"""
    Reproduce Fig 3.38. The original figure is presented in Chapter 3 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 3-2: behavior of the capital sector when the average lifetime of industrial capital is increased from 14 to 21 years with standard inputs.
"""
function fig_38(; kwargs...)
    parameters_3_38 = getparameters()
    parameters_3_38[:alic1] = 21

    system = historicalrun(params=parameters_3_38)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2000), _variables_37(); title="Fig. 3.38", kwargs...)
end

"""
    Reproduce Fig 3.39. The original figure is presented in Chapter 3 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run3-3: behaviorofthecapital sector when the capital-output ratio is decreased from 3 to 2 years with standard inputs.
"""
function fig_39(; kwargs...)
    parameters_3_39 = getparameters()
    parameters_3_39[:icor1] = 2

    system = historicalrun(params=parameters_3_39)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2000), _variables_37(); title="Fig. 3.39", kwargs...)
end

"""
    Reproduce Fig 3.40. The original figure is presented in Chapter 3 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 3-4: behavior of the capital sector when the industrial capital-output ratio is increased from 3 to 4 years with standard inputs.
    Note: Scales for IOPC, SOPC, and IO have been changed from their normal values.
"""
function fig_40(; kwargs...)
    parameters_3_40 = getparameters()
    parameters_3_40[:icor1] = 4

    system = historicalrun(params=parameters_3_40)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2000), _variables_40(); title="Fig. 3.40", kwargs...)
end

"""
    Reproduce Fig 3.41. The original figure is presented in Chapter 3 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 3-5: behavior of the capital sector when the fraction of capital allocated to obtaining resources is increased from 0.05 to 0.35 with other inputs at their standard values.
    Note: Scales for IOPC, SOPC, and IO have been changed from their normal values.
"""
function fig_41(; kwargs...)
    cap_tables_3_41 = gettables()
    cap_tables_3_41[:fcaor] = (0.35, 0.35, 0.35, 0.35, 0.35, 0.35, 0.35, 0.35, 0.35, 0.35, 0.35)

    system = historicalrun(tables=cap_tables_3_41)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2000), _variables_40(); title="Fig. 3.41", kwargs...)
end

"""
    Reproduce Fig 3.42. The original figure is presented in Chapter 3 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 3-6: behavior of the capital sector when the service capital-output ratio is increased from 1 to 2 years with standard inputs.
"""
function fig_42(; kwargs...)
    parameters_3_42 = getparameters()
    parameters_3_42[:scor1] = 2

    system = historicalrun(params=parameters_3_42)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2000), _variables_37(); title="Fig. 3.42", kwargs...)
end

"""
    Reproduce Fig 3.43. The original figure is presented in Chapter 3 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Driving functions for capital sector experiencing increasing resource costs.
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
    Reproduce Fig 3.44. The original figure is presented in Chapter 3 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 3-7: behavior of the capital sector when the fraction of capital allocated to obtaining resources increases after 1970.
"""
function fig_44(; kwargs...)
    cap_tables_3_44 = gettables()
    cap_tables_3_44[:fcaor] = (0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.4, 0.6, 0.8)

    system = historicalrun(tables=cap_tables_3_44)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2000), _variables_37(); title="Fig. 3.44", kwargs...)
end

"""
    Reproduce Fig 3.45. The original figure is presented in Chapter 3 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Driving functions for capital sector undergoing increasing food. costs
"""
function fig_45(; kwargs...)
    cap_tables_3_45 = gettables()
    cap_tables_3_45[:fioaa] = (0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.3, 0.3, 0.3)

    system = historicalrun(tables=cap_tables_3_45)
    solution = solve(system, (1900, 2100))
    return plotvariables(solution, (t, 1900, 2000), _variables_45(); title="Fig. 3.45", kwargs...)
end

"""
    Reproduce Fig 3.46. The original figure is presented in Chapter 3 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 3-8: behavior of the capital sector when the fraction of industrial output allocated to agriculture increases after 1970.
"""
function fig_46(; kwargs...)
    cap_tables_3_46 = gettables()
    cap_tables_3_46[:fioaa] = (0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.3, 0.3, 0.3)

    system = historicalrun(tables=cap_tables_3_46)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2000), _variables_37(); title="Fig. 3.46", kwargs...)
end

"""
    Reproduce Fig 3.47. The original figure is presented in Chapter 3 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Driving functions for a population decline in the capital sector.
"""
function fig_47(; kwargs...)
    cap_tables_3_47 = gettables()
    cap_tables_3_47[:pop] = (1.65, 1.73, 1.8, 2.1, 2.3, 2.55, 3, 3.65, 2, 0.5, 0.2)

    system = historicalrun(tables=cap_tables_3_47)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2000), _variables_45(); title="Fig. 3.47", kwargs...)
end

"""
    Reproduce Fig 3.48. The original figure is presented in Chapter 3 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 3-9: behavior of the capital sector when the
    population declines after 1970.
"""
function fig_48(; kwargs...)
    cap_tables_3_48 = gettables()
    cap_tables_3_48[:pop] = (1.65, 1.73, 1.8, 2.1, 2.3, 2.55, 3, 3.65, 2, 0.5, 0.2)

    system = historicalrun(tables=cap_tables_3_48)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2000), _variables_37(); title="Fig. 3.48", kwargs...)
end
