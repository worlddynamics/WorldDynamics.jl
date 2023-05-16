function historicalrun(; kwargs...)
    @named pop = population(; kwargs...)
    @named nr = non_renewable(; kwargs...)
    @named ag = agriculture(; kwargs...)
    @named is = industrial_subsector(; kwargs...)
    @named ss = service_subsector(; kwargs...)
    @named js = job_subsector(; kwargs...)

    systems = [pop, nr, ag, is, ss, js]

    connection_eqs = WorldDynamics.variable_connections(systems)

    return WorldDynamics.compose(systems, connection_eqs)
end
