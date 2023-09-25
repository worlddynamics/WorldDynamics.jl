function historicalrun(; kwargs...)
    @named pop = population(; kwargs...)
    @named io = industrial_output(; kwargs...)
    @named pp = persistent_pollution(; kwargs...)
    @named ld = land_development(; kwargs...)
    @named ai = agricultural_inputs(; kwargs...)
    @named iad = investment_allocation_decision(; kwargs...)
    @named leuiu = land_erosion_urban_industrial_use(; kwargs...)
    @named dlm = discontinuing_land_maintenance(; kwargs...)
    @named lfr = land_fertility_regeneration(; kwargs...)
    @named lfd = land_fertility_degradation(; kwargs...)

    systems = [pop, io, pp, ld, ai, iad, leuiu, dlm, lfr, lfd]

    connection_eqs = WorldDynamics.variable_connections(systems)

    return WorldDynamics.compose(systems, connection_eqs)
end
