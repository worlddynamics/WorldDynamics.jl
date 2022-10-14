function historicalrunsolution()
    isdefined(@__MODULE__, :_solution_historicalrun) && return _solution_historicalrun
    global _solution_historicalrun = solve(historicalrun(), (1900, 2100))
    return _solution_historicalrun
end


function variables_nr()
    @named nr = non_renewable()
    @named ic = industrial_capital()
    @named io = industrial_output()
    @named pop = population()

    variables = [
        (nr.nrfr,  0, 1,     "nrfr"),
        (nr.fcaor, 0, 1,     "fcaor"),
        (ic.ic,    0, 40e12, "ic"),
        (io.io,    0, 10e12, "io"),
        (pop.pop,  0, 16e9,  "pop"),
    ]

    return variables
end



"""
    Reproduce Fig 5.25. The original figure is presented in Chapter 5 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 5-1: standard run for the nonrenewable resource sector.
"""
fig_25(; kwargs...) = plotvariables(historicalrunsolution(), (t, 1900, 2100), variables_nr(); title="Fig. 5.25", kwargs...)

"""
    Reproduce Fig 5.26. The original figure is presented in Chapter 5 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 5-2: Behavior of the sector with double the initial value of nonrenewable resources.
"""
function fig_26(; kwargs...)
    parameters_5_26 = getparameters()
    parameters_5_26[:nri] = 2e12

    system = historicalrun(params=parameters_5_26)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables_nr(); title="Fig. 5.26", kwargs...)
end

"""
    Reproduce Fig 5.28. The original figure is presented in Chapter 5 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 5-3: The effects of cost-reducing technologies on the behavior of the nonrenewable resource sector.
"""
function fig_28(; kwargs...)
    tables_5_28 = gettables()
    tables_5_28[:fcaor2] = (1.0, 0.3, 0.1, 0.065, 0.06, 0.055, 0.05, 0.05, 0.05, 0.05, 0.05)

    system = historicalrun(tables=tables_5_28)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables_nr(); title="Fig. 5.28", kwargs...)
end

"""
    Reproduce Fig 5.29. The original figure is presented in Chapter 5 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 5-4: the effects of resource-conserving technologies on the behavior of the nonrenewable resource sector.
"""
function fig_29(; kwargs...)
    parameters_5_29 = getparameters()
    parameters_5_29[:nruf2] = 0.25

    system = historicalrun(params=parameters_5_29)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables_nr(); title="Fig. 5.29", kwargs...)
end

"""
    Reproduce Fig 5.30. The original figure is presented in Chapter 5 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 5-5: The effects of zero population growth and advanced technological policies on the behavior of the nonrenewable resource sector.
"""
function fig_30(; kwargs...)
    parameters_5_30 = getparameters()
    parameters_5_30[:zpgt] = 1975
    parameters_5_30[:nruf2] = 0.25

    tables_5_30 = gettables()
    tables_5_30[:fcaor2] = (1.0, 0.3, 0.1, 0.065, 0.06, 0.055, 0.05, 0.05, 0.05, 0.05, 0.05)

    system = historicalrun(params=parameters_5_30, tables=tables_5_30)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables_nr(); title="Fig. 5.30", kwargs...)
end
