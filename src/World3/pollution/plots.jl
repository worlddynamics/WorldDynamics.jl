include("../../plotvariables.jl")


function _historicalrunsolution()
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


function fig_28()
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

    return plotvariables(_historicalrunsolution(), (t, 1900, 1970), variables; title="Fig. 6.28")
end

function fig_29()
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

    return plotvariables(_historicalrunsolution(), (t, 1900, 1970), variables; title="Fig. 6.29")
end

function fig_30()
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

    return plotvariables(_historicalrunsolution(), (t, 1900, 2100), variables; title="Fig. 6.30")
end

fig_31() = plotvariables(_historicalrunsolution(), (t, 1900, 2100), _variables_31(); title="Fig. 6.31")

function fig_32()
    parameters_6_32 = getparameters()
    parameters_6_32[:imti] = 1
    parameters_6_32[:amti] = 0.5
    parameters_6_32[:ppol70] = 4.03e7

    system = historicalrun(params=parameters_6_32)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_31(); title="Fig. 6.32")
end

function fig_33()
    parameters_6_33 = getparameters()
    parameters_6_33[:pptd1] = 40
    parameters_6_33[:pptd2] = 40
    parameters_6_33[:ppol70] = 8.19e7

    system = historicalrun(params=parameters_6_33)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_31(); title="Fig. 6.33")
end

function fig_34()
    parameters_6_34 = getparameters()
    parameters_6_34[:pptd1] = 10
    parameters_6_34[:pptd2] = 10
    parameters_6_34[:ppol70] = 1.9e8

    system = historicalrun(params=parameters_6_34)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_31(); title="Fig. 6.34")
end

function fig_35()
    tables_6_35 = gettables()
    tables_6_35[:ahlm] = (1, 21, 41, 61, 81)

    system = historicalrun(tables=tables_6_35)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_31(); title="Fig. 6.35")
end

function fig_36()
    tables_6_36 = gettables()
    tables_6_36[:ahlm] = (1, 1, 1, 1, 1)

    system = historicalrun(tables=tables_6_36)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_31(); title="Fig. 6.36")
end

function fig_37()
    parameters_6_37 = getparameters()
    parameters_6_37[:pptd2] = 40

    system = historicalrun(params=parameters_6_37)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_31(); title="Fig. 6.37")
end

function fig_38()
    tables_6_38 = gettables()
    tables_6_38[:ahlm] = (1, 6, 11, 16, 21)

    system = historicalrun(tables=tables_6_38)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_31(); title="Fig. 6.38")
end

function fig_39()
    tables_6_39 = gettables()
    tables_6_39[:lmp2] = (1, 1, 0.99, 0.98, 0.95, 0.92, 0.88, 0.82, 0.77, 0.70, 0.60)
    tables_6_39[:lfdr2] = (0, 0.05, 0.15, 0.25)

    system = historicalrun(tables=tables_6_39)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_31(); title="Fig. 6.39")
end

function fig_40()
    parameters_6_40 = getparameters()
    parameters_6_40[:ppgf21] = 0.2

    system = historicalrun(params=parameters_6_40)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_31(); title="Fig. 6.40")
end

function fig_41()
    parameters_6_41 = getparameters()
    parameters_6_41[:swat] = 1

    system = historicalrun(params=parameters_6_41)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_31(); title="Fig. 6.41")
end

function fig_43()
    parameters_6_43 = getparameters()
    parameters_6_43[:swat] = 1
    parameters_6_43[:pptd1] = 2
    parameters_6_43[:pptd2] = 2

    system = historicalrun(params=parameters_6_43)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_31(); title="Fig. 6.43")
end

function fig_44()
    tables_6_44 = gettables()
    tables_6_44[:pcrum] = (17, 30, 52, 79, 138, 280, 280, 280, 280, 280, 280)
    tables_6_44[:pop] = (16, 19, 22, 31, 42, 53, 53, 53, 53, 53, 53)
    tables_6_44[:aiph] = (6.6, 11, 20, 34, 51, 97, 97, 97, 97, 97, 97)
    tables_6_44[:al] = (9, 10, 11, 13, 16, 20, 20, 20, 20, 20, 20)

    system = historicalrun(tables=tables_6_44)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_31(); title="Fig. 6.44")
end

function fig_45()
    tables_6_45 = gettables()
    tables_6_45[:pcrum] = (17, 30, 52, 78, 138, 280, 480, 480, 480, 480, 480)
    tables_6_45[:pop] = (16, 19, 22, 31, 42, 53, 67, 67, 67, 67, 67)
    tables_6_45[:aiph] = (6.6, 11, 20, 34, 51, 97, 168, 168, 168, 168, 168)
    tables_6_45[:al] = (9, 10, 11, 13, 16, 20, 24, 24, 24, 24, 24)

    system = historicalrun(tables=tables_6_45)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_31(); title="Fig. 6.45")
end

function fig_46()
    parameters_6_46 = getparameters()
    parameters_6_46[:swat] = 1

    tables_6_46 = gettables()
    tables_6_46[:pcrum] = (17, 30, 52, 78, 138, 280, 480, 480, 480, 480, 480)
    tables_6_46[:pop] = (16, 19, 22, 31, 42, 53, 67, 67, 67, 67, 67)
    tables_6_46[:aiph] = (6.6, 11, 20, 34, 57, 97, 168, 168, 168, 168, 168)
    tables_6_46[:al] = (9, 10, 11, 13, 16, 20, 24, 24, 24, 24, 24)

    system = historicalrun(params=parameters_6_46, tables=tables_6_46)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_31(); title="Fig. 6.46")
end
