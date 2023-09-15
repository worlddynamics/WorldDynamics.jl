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

"""
    fig_scenario1a(; kwargs...)

Reproduce the first subfigure of _Scenario 1_ from Chapter 4, page 133, in [BTL](https://archive.org/details/beyondlimitsconf00mead).

Caption: **The "Standard Run" from The Limits to Growth**  
The world society proceeds along its historical path as long as possible without major policy change. 
Population and industry output grow until a combination of environmental and natural resource constraints eliminate the capacity of the capital sector to sustain investment. 
Industrial capital begins to depreciate faster than the new investment can rebuild it. 
As it falls, food and health services also fall, decreasing life expectancy and raising the death rate.
"""
fig_scenario1a(; kwargs...) = plotvariables(scenario1solution(), (t, 1900, 2100), _variables_a(); title="Scenario 1 - State of the world", kwargs...)

"""
    fig_scenario1b(; kwargs...)

Reproduce the second subfigure of _Scenario 1_ from Chapter 4, page 133, in [BTL](https://archive.org/details/beyondlimitsconf00mead).

Caption: **The "Standard Run" from The Limits to Growth**  
The world society proceeds along its historical path as long as possible without major policy change. 
Population and industry output grow until a combination of environmental and natural resource constraints eliminate the capacity of the capital sector to sustain investment. 
Industrial capital begins to depreciate faster than the new investment can rebuild it. 
As it falls, food and health services also fall, decreasing life expectancy and raising the death rate.
"""
fig_scenario1b(; kwargs...) = plotvariables(scenario1solution(), (t, 1900, 2100), _variables_b(); title="Scenario 1 - Material standard of living", kwargs...)

"""
    fig_scenario2a(; kwargs...)

Reproduce the first subfigure of _Scenario 2_ from Chapter 4, page 135, in [BTL](https://archive.org/details/beyondlimitsconf00mead).

Caption: **Doubled Resources Are Added to Scenario 1**  
If we double the natural resource endowment we assumed in Scenario 1, industry can grow 20 years longer. 
Population rises to more than 9 billion in 2040. 
These increased levels generate much more pollution, which reduces land yield and forces much greater investment in agriculture. 
Eventually declining food raises the population death rate.
"""
function fig_scenario2a(; kwargs...)
    nr_params = World3.NonRenewable.getparameters()
    nr_params[:nri] = 2e12

    system = scenario1(nonrenewable_params=nr_params)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_a(); title="Scenario 2 - State of the World", kwargs...)
end

"""
    fig_scenario2b(; kwargs...)
    
Reproduce the second subfigure of _Scenario 2_ from Chapter 4, page 135, in [BTL](https://archive.org/details/beyondlimitsconf00mead).

Caption: **Doubled Resources Are Added to Scenario 1**  
If we double the natural resource endowment we assumed in Scenario 1, industry can grow 20 years longer. 
Population rises to more than 9 billion in 2040. 
These increased levels generate much more pollution, which reduces land yield and forces much greater investment in agriculture. 
Eventually declining food raises the population death rate.
"""
function fig_scenario2b(; kwargs...)
    nr_params = World3.NonRenewable.getparameters()
    nr_params[:nri] = 2e12

    system = scenario1(nonrenewable_params=nr_params)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), _variables_b(); title="Scenario 2 - Material standard of living", kwargs...)
end
