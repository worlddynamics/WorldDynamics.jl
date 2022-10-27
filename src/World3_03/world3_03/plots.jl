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
        (nr.nr,    0, 2e12, "Resources"),
        (is.io,    0, 4e12, "Industrial output"),
        (ld.f,     0, 6e12, "Food"),
        (pop.pop,  0, 12e9, "Population"),
        (pp.ppolx, 0, 40,   "Pollution"),
    ]

    return variables
end

function _variables_b()
    @named ld = World3.Agriculture.land_development()
    @named is = World3.Capital.industrial_subsector()
    @named ss = World3.Capital.service_subsector()
    @named dr = World3.Pop4.death_rate()

    variables = [
        (ld.fpc,             0, 1000, "Food/person"),
        (is.iopc * is.fioac, 0, 250,  "Consumer goods/person"),
        (ss.sopc,            0, 1000, "Services/person"),
        (dr.le,              0, 90,   "Life expectancy"),
    ]

    return variables
end

function _variables_c()
    @named hwi = NewEquations.human_welfare_index()
    @named hef = NewEquations.human_ecological_footprint()

    variables = [
        (hwi.hwi, 0, 1, "Human welfare index"),
        (hef.hef, 0, 4, "Human ecological footprint"),
    ]

    return variables
end


@variables t

"""
Reproduce the first subfigure of _Scenario 1_ from Chapter 4, page 169, in [LtG30y](https://web.archive.org/web/20220308214339/https://systemdynamics.org/product/affiliate-limits-to-growth-the-30-year-update/).

Caption: **Scenario 1: A Reference Point**  
The world society proceeds in a traditional manner without any major deviation from the policies pursued during most of the twentieth century. 
Population and production increase until growth is halted by increasingly inaccessible nonrenewable resources. 
Ever more investment is required to maintain resource flows. 
Finally, lack of investment funds in the other sectors of the economy leads to declining output of both industrial goods and services. 
As they fall, food and health services are reduced, decreasing life expectancy and raising average death rates.
"""
fig_scenario1a(; kwargs...) = plotvariables(scenario1solution(), (t, 1900, 2100), _variables_a(); title="Scenario 1 - State of the World", kwargs...)

fig_scenario1b(; kwargs...) = plotvariables(scenario1solution(), (t, 1900, 2100), _variables_b(); title="Scenario 1 - Material Standard of Living", kwargs...)

"""
Reproduce the third subfigure of _Scenario 1_ from Chapter 4, page 169, in [LtG30y](https://web.archive.org/web/20220308214339/https://systemdynamics.org/product/affiliate-limits-to-growth-the-30-year-update/).

Caption: **Scenario 1: A Reference Point**  
The world society proceeds in a traditional manner without any major deviation from the policies pursued during most of the twentieth century. 
Population and production increase until growth is halted by increasingly inaccessible nonrenewable resources. 
Ever more investment is required to maintain resource flows. 
Finally, lack of investment funds in the other sectors of the economy leads to declining output of both industrial goods and services. 
As they fall, food and health services are reduced, decreasing life expectancy and raising average death rates.
"""
fig_scenario1c(; kwargs...) = plotvariables(scenario1solution(), (t, 1900, 2100), _variables_c(); title="Scenario 1 - Human Welfare and Footprint", kwargs...)
