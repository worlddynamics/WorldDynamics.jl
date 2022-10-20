function scenario1solution()
    isdefined(@__MODULE__, :_solution_scenario1) && return _solution_scenario1
    global _solution_scenario1 = solve(scenario1(), (1900, 2100))
    return _solution_scenario1
end


function _variables_a()
    @named nr = World3.NonRenewable.non_renewable()
    @named is = World3.Capital.industrial_subsector()
    @named ld = World3.Agriculture.land_development()
    @named pop = World3.Pop4.population()
    @named pp = World3.Pollution.persistent_pollution()

    variables = [
        (nr.nr,    0, 2e12, "resources"),
        (is.io,    0, 4e12, "industrial output"),
        (ld.f,     0, 6e12, "food"),
        (pop.pop,  0, 13e9, "population"),
        (pp.ppolx, 0, 40,   "pollution"),
    ]

    return variables
end

function _variables_b()
    @named ld = World3.Agriculture.land_development()
    @named is = World3.Capital.industrial_subsector()
    @named ss = World3.Capital.service_subsector()
    @named dr = World3.Pop4.death_rate()

    variables = [
        (ld.fpc,             0, 1000, "food/person"),
        (is.iopc * is.fioac, 0, 250,  "consumer goods/person"),
        (ss.sopc,            0, 1000, "services/person"),
        (dr.le,              0, 90,   "life expectancy"),
    ]

    return variables
end


@variables t

fig_scenario1a(; kwargs...) = plotvariables(scenario1solution(), (t, 1900, 2100), _variables_a(); title="Scenario 1 - State of the world", kwargs...)

fig_scenario1b(; kwargs...) = plotvariables(scenario1solution(), (t, 1900, 2100), _variables_b(); title="Scenario 1 - Material standard of living", kwargs...)

function fig_scenario2a(; kwargs...)
    nr_params = World3.NonRenewable.getparameters()
    nr_params[:nri] = 2e12

    system = scenario1(nonrenewable_params=nr_params)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_a(); title="Scenario 2 - State of the World", kwargs...)
end

function fig_scenario2b(; kwargs...)
    nr_params = World3.NonRenewable.getparameters()
    nr_params[:nri] = 2e12

    system = scenario1(nonrenewable_params=nr_params)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_a(); title="Scenario 2 - Material standard of living", kwargs...)
end
