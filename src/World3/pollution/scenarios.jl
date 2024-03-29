function historicalrun(; kwargs...)
    @named pop = population(; kwargs...)
    @named nr = non_renewable(; kwargs...)
    @named ag = agriculture(; kwargs...)
    @named pd = pollution_damage(; kwargs...)
    @named atcc = adaptive_technological_control_cards(; kwargs...)
    @named pp = persistent_pollution(; kwargs...)

    systems = [pop, nr, ag, pd, atcc, pp]

    connection_eqs = WorldDynamics.variable_connections(systems)

    return WorldDynamics.compose(systems, connection_eqs)
end
