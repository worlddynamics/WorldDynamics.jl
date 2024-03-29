function historicalrunsolution()
    isdefined(@__MODULE__, :_solution_historicalrun) && return _solution_historicalrun
    global _solution_historicalrun = solve(historicalrun(), (1900, 2100))
    return _solution_historicalrun
end


function _variables_31()
    @named pp = persistent_pollution()
    @named pd = pollution_damage()

    variables = [
        (pp.ppgr,  0, 2e9, "ppgr"),
        (pp.ppapr, 0, 2e9, "ppapr"),
        (pp.ppasr, 0, 2e9, "ppasr"),
        (pp.ppolx, 0, 1e2, "ppolx"),
        (pp.ahl,   0, 40,  "ahl"),
        (pd.lmp,   0, 1,   "lmp"),
        (pd.lfdr,  0, 0.5, "lfdr"),
    ]

    return variables
end


"""
    fig_26(; kwargs...)

Reproduce Fig 6.26. The original figure is presented in Chapter 6 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 6-1: behavior of the pollution sector in response to a pulse input in persistent pollution generation in 1920.
"""
function fig_26(; kwargs...)
    @named pp = persistent_pollution()
    @named pd = pollution_damage()

    variables = [
        (pp.ppgr,  0, 1e10, "ppgr"),
        (pp.ppapr, 0, 1e9,  "ppapr"),
        (pp.ppasr, 0, 1e9,  "ppasr"),
        (pp.ppolx, 0, 24,   "ppolx"),
        (pp.ahl,   0, 40,   "ahl"),
        (pd.lmp,   0, 1,    "lmp"),
        (pd.lfdr,  0, 0.5,  "lfdr"),
    ]

    initialisations_6_26 = getinitialisations()
    initialisations_6_26[:ppol] = 0

    system = historicalrun(inits=initialisations_6_26)

    new_equations = equations(system)
    new_equations[31] = pp.ppgr ~ 1e10 * clip(1, 0, t, 1920) * clip(0, 1, t, 1922)

    @named new_system = ODESystem(new_equations)
    solution = solve(new_system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 1980), variables; title="Fig. 6.26", kwargs...)
end

"""
    fig_27(; kwargs...)

Reproduce Fig 6.27. The original figure is presented in Chapter 6 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 6-2: behavior of the pollution sector in response to a step increase and decrease in persistent pollution generation.
"""
function fig_27(; kwargs...)
    @named pp = persistent_pollution()
    @named pd = pollution_damage()

    variables = [
        (pp.ppgr,  0, 1e9,  "ppgr"),
        (pp.ppapr, 0, 1e9,  "ppapr"),
        (pp.ppasr, 0, 1e9,  "ppasr"),
        (pp.ppolx, 0, 40,   "ppolx"),
        (pp.ahl,   0, 40,   "ahl"),
        (pd.lmp,   0, 1,    "lmp"),
        (pd.lfdr,  0, 0.5,  "lfdr"),
    ]

    initialisations_6_27 = getinitialisations()
    initialisations_6_27[:ppol] = 0

    system = historicalrun(inits=initialisations_6_27)

    new_equations = equations(system)
    new_equations[31] = pp.ppgr ~ WorldDynamics.step(t, 1e9, 1920) + WorldDynamics.step(t, -1e9, 2000)

    @named new_system = ODESystem(new_equations)
    solution = solve(new_system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables; title="Fig. 6.27", kwargs...)
end

"""
    fig_28(; kwargs...)

Reproduce Fig 6.28. The original figure is presented in Chapter 6 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Inputs to Run 6-3, the historical run of the pollution sector.
"""
function fig_28(; kwargs...)
    @named nr = non_renewable()
    @named pop = population()
    @named ag = agriculture()
    @named pp = persistent_pollution()

    variables = [
        (nr.pcrum, 0, 1  , "pcrum"),
        (pop.pop,  0, 4e9, "pop"),
        (ag.al,    0, 2e9, "al"),
        (ag.aiph,  0, 50 , "aiph"),
        (pp.ppgr,  0, 2e8, "ppgr"),
    ]

    return plotvariables(historicalrunsolution(), (t, 1900, 1970), variables; title="Fig. 6.28", kwargs...)
end

"""
    fig_29(; kwargs...)

Reproduce Fig 6.29. The original figure is presented in Chapter 6 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 6-3: historical run of the pollution sector.
"""
function fig_29(; kwargs...)
    @named pp = persistent_pollution()
    @named pd = pollution_damage()

    variables = [
        (pp.ppgr,  0, 2e8, "ppgr"),
        (pp.ppapr, 0, 2e8, "ppapr"),
        (pp.ppasr, 0, 2e8, "ppasr"),
        (pp.ppolx, 0, 1,   "ppolx"),
        (pp.ahl,   0, 2,   "ahl"),
        (pd.lmp,   0, 1,   "lmp"),
        (pd.lfdr,  0, 0.5, "lfdr"),
    ]

    return plotvariables(historicalrunsolution(), (t, 1900, 1970), variables; title="Fig. 6.29", kwargs...)
end

"""
    fig_30(; kwargs...)

Reproduce Fig 6.30. The original figure is presented in Chapter 6 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Inputs to Run 6-4 of the pollution sector when continued material growth is assumed.
"""
function fig_30(; kwargs...)
    @named nr = non_renewable()
    @named pop = population()
    @named ag = agriculture()
    @named pp = persistent_pollution()

    variables = [
        (nr.pcrum, 0, 8,      "pcrum"),
        (pop.pop,  0, 1.6e10, "pop"),
        (ag.al,    0, 4e9,    "al"),
        (ag.aiph,  0, 1.5e3,  "aiph"),
        (pp.ppgr,  0, 8e9,    "ppgr"),
    ]

    return plotvariables(historicalrunsolution(), (t, 1900, 2100), variables; title="Fig. 6.30", kwargs...)
end


"""
    fig_31(; kwargs...)

Reproduce Fig 6.31. The original figure is presented in Chapter 6 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 6-4: behavior of the pollution sector in response to continued material growth.
"""
fig_31(; kwargs...) = plotvariables(historicalrunsolution(), (t, 1900, 2100), _variables_31(); title="Fig. 6.31", kwargs...)

"""
    fig_32(; kwargs...)

Reproduce Fig 6.32. The original figure is presented in Chapter 6 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 6-5: behavior of the pollution sector with decreased toxicity indices.
"""
function fig_32(; kwargs...)
    parameters_6_32 = getparameters()
    parameters_6_32[:imti] = 1
    parameters_6_32[:amti] = 0.5
    parameters_6_32[:ppol70] = 4.03e7

    system = historicalrun(params=parameters_6_32)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_31(); title="Fig. 6.32", kwargs...)
end

"""
    fig_33(; kwargs...)

Reproduce Fig 6.33. The original figure is presented in Chapter 6 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 6-6: behavior of the pollution sector when the estimate of the persistent pollution transmission delay is doubled.
"""
function fig_33(; kwargs...)
    parameters_6_33 = getparameters()
    parameters_6_33[:pptd1] = 40
    parameters_6_33[:pptd2] = 40
    parameters_6_33[:ppol70] = 8.19e7

    system = historicalrun(params=parameters_6_33)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_31(); title="Fig. 6.33", kwargs...)
end

"""
    fig_34(; kwargs...)

Reproduce Fig 6.34. The original figure is presented in Chapter 6 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 6-7: behavior of the pollution sector when the estimate of the persistent pollution transmission delay is halved.
"""
function fig_34(; kwargs...)
    parameters_6_34 = getparameters()
    parameters_6_34[:pptd1] = 10
    parameters_6_34[:pptd2] = 10
    parameters_6_34[:ppol70] = 1.9e8

    system = historicalrun(params=parameters_6_34)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_31(); title="Fig. 6.34", kwargs...)
end

"""
    fig_35(; kwargs...)

Reproduce Fig 6.35. The original figure is presented in Chapter 6 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 6-8: behavior of the pollution sector when the assimilation half-life is assumed to increase twice as fast with a rising index of persistent pollution.
"""
function fig_35(; kwargs...)
    tables_6_35 = gettables()
    tables_6_35[:ahlm] = (1, 21, 41, 61, 81)

    system = historicalrun(tables=tables_6_35)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_31(); title="Fig. 6.35", kwargs...)
end

"""
    fig_36(; kwargs...)

Reproduce Fig 6.36. The original figure is presented in Chapter 6 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 6-9: behavior of the pollution sector when the assimilation half-life is assumed to be constant.
"""
function fig_36(; kwargs...)
    tables_6_36 = gettables()
    tables_6_36[:ahlm] = (1, 1, 1, 1, 1)

    system = historicalrun(tables=tables_6_36)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_31(); title="Fig. 6.36", kwargs...)
end

"""
    fig_37(; kwargs...)

Reproduce Fig 6.37. The original figure is presented in Chapter 6 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 6-10: behavior of the pollution sector in response to a doubling of the persistent pollution transmission delay in 1975.
"""
function fig_37(; kwargs...)
    parameters_6_37 = getparameters()
    parameters_6_37[:pptd2] = 40

    system = historicalrun(params=parameters_6_37)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_31(); title="Fig. 6.37", kwargs...)
end

"""
    fig_38(; kwargs...)

Reproduce Fig 6.38. The original figure is presented in Chapter 6 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 6-11: behavior of the pollution sector in response to an advance in persistent pollution assimilation technology in 1975.
"""
function fig_38(; kwargs...)
    tables_6_38 = gettables()
    tables_6_38[:ahlm] = (1, 6, 11, 16, 21)

    system = historicalrun(tables=tables_6_38)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_31(); title="Fig. 6.38", kwargs...)
end

"""
    fig_39(; kwargs...)

Reproduce Fig 6.39. The original figure is presented in Chapter 6 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 6-12: behavior of the pollution sector in response to a 50 percent increase in human health and land fertility technology in 1975.
"""
function fig_39(; kwargs...)
    tables_6_39 = gettables()
    tables_6_39[:lmp2] = (1, 1, 0.99, 0.98, 0.95, 0.92, 0.88, 0.82, 0.77, 0.70, 0.60)
    tables_6_39[:lfdr2] = (0, 0.05, 0.15, 0.25)

    system = historicalrun(tables=tables_6_39)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_31(); title="Fig. 6.39", kwargs...)
end

"""
    fig_40(; kwargs...)

Reproduce Fig 6.40. The original figure is presented in Chapter 6 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 6-13: behavior of the pollution sector in response to a sudden increase in persistent pollution generation control technology in 1975.
"""
function fig_40(; kwargs...)
    parameters_6_40 = getparameters()
    parameters_6_40[:ppgf21] = 0.2

    system = historicalrun(params=parameters_6_40)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_31(); title="Fig. 6.40", kwargs...)
end

"""
    fig_41(; kwargs...)

Reproduce Fig 6.41. The original figure is presented in Chapter 6 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 6-14: behavior of the pollution sector in response to adaptive persistent pollution generation control technologies when the persistent pollution transmission delay is assumed to be 20 years.
"""
function fig_41(; kwargs...)
    parameters_6_41 = getparameters()
    parameters_6_41[:swat] = 1

    system = historicalrun(params=parameters_6_41)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_31(); title="Fig. 6.41", kwargs...)
end

"""
    fig_43(; kwargs...)

Reproduce Fig 6.43. The original figure is presented in Chapter 6 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 6-15: behavior of the pollution sector in response to adaptive persistent pollution generation control technologies when the persistent pollution transmission delay is assumed to be 2 years.
"""
function fig_43(; kwargs...)
    parameters_6_43 = getparameters()
    parameters_6_43[:swat] = 1
    parameters_6_43[:pptd1] = 2
    parameters_6_43[:pptd2] = 2

    system = historicalrun(params=parameters_6_43)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_31(); title="Fig. 6.43", kwargs...)
end

"""
    fig_44(; kwargs...)

Reproduce Fig 6.44. The original figure is presented in Chapter 6 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 6-16: behavior of the pollution sector when persistent pollution generation stabilizes in the year 2000.
"""
function fig_44(; kwargs...)
    tables_6_44 = gettables()
    tables_6_44[:pcrum] = (17, 30, 52, 79, 138, 280, 280, 280, 280, 280, 280)
    tables_6_44[:pop] = (16, 19, 22, 31, 42, 53, 53, 53, 53, 53, 53)
    tables_6_44[:aiph] = (6.6, 11, 20, 34, 51, 97, 97, 97, 97, 97, 97)
    tables_6_44[:al] = (9, 10, 11, 13, 16, 20, 20, 20, 20, 20, 20)

    system = historicalrun(tables=tables_6_44)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_31(); title="Fig. 6.44", kwargs...)
end

"""
    fig_45(; kwargs...)

Reproduce Fig 6.45. The original figure is presented in Chapter 6 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 6-17: behavior of the pollution sector when persistent pollution generation stabilizes in the year 2020.
"""
function fig_45(; kwargs...)
    tables_6_45 = gettables()
    tables_6_45[:pcrum] = (17, 30, 52, 78, 138, 280, 480, 480, 480, 480, 480)
    tables_6_45[:pop] = (16, 19, 22, 31, 42, 53, 67, 67, 67, 67, 67)
    tables_6_45[:aiph] = (6.6, 11, 20, 34, 51, 97, 168, 168, 168, 168, 168)
    tables_6_45[:al] = (9, 10, 11, 13, 16, 20, 24, 24, 24, 24, 24)

    system = historicalrun(tables=tables_6_45)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_31(); title="Fig. 6.45", kwargs...)
end

"""
    fig_46(; kwargs...)

Reproduce Fig 6.46. The original figure is presented in Chapter 6 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

Caption: Run 6-18: behavior of the pollution sector when adaptive persistent pollution generation control technologies are combined with material equilibrium in the year 2020.
"""
function fig_46(; kwargs...)
    parameters_6_46 = getparameters()
    parameters_6_46[:swat] = 1

    tables_6_46 = gettables()
    tables_6_46[:pcrum] = (17, 30, 52, 78, 138, 280, 480, 480, 480, 480, 480)
    tables_6_46[:pop] = (16, 19, 22, 31, 42, 53, 67, 67, 67, 67, 67)
    tables_6_46[:aiph] = (6.6, 11, 20, 34, 57, 97, 168, 168, 168, 168, 168)
    tables_6_46[:al] = (9, 10, 11, 13, 16, 20, 24, 24, 24, 24, 24)

    system = historicalrun(params=parameters_6_46, tables=tables_6_46)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_31(); title="Fig. 6.46", kwargs...)
end
