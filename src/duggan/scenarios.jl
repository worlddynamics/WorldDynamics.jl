function duggan(; kwargs...)
    @named cap = Capital.capital_system(; kwargs...)
    @named res = Resource.resource_system(; kwargs...)

    systems = [cap, res,]

    connection_eqs = variable_connections(systems)

    return WorldDynamics.compose(systems, connection_eqs)
end