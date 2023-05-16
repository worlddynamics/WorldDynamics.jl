function historicalrun(; kwargs...)
    @named pop = population(; kwargs...)
    @named dr = death_rate(; kwargs...)
    @named br = birth_rate(; kwargs...)
    @named io = industrial_output(; kwargs...)
    @named so = service_output(; kwargs...)
    @named pp = persistent_pollution(; kwargs...)
    @named f  = food(; kwargs...)

    systems = [pop, dr, br, io, so, pp, f]

    connection_eqs = WorldDynamics.variable_connections(systems)

    return WorldDynamics.compose(systems, connection_eqs)
end
