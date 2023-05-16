function historicalrun(; kwargs...)
    @named pop = population(; kwargs...)
    @named io = industrial_output(; kwargs...)
    @named ic = industrial_capital(; kwargs...)
    @named nr = non_renewable(; kwargs...)

    systems = [pop, io, ic, nr]

    connection_eqs = WorldDynamics.variable_connections(systems)

    return WorldDynamics.compose(systems, connection_eqs)
end
