function standard_run(; kwargs...)
    @named w1 = World1.standard_run(params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @named w1a = world1a()

    systems = [w1, w1a]

    connection_eqs = WorldDynamics.variable_connections(systems)

    system = WorldDynamics.compose(systems, connection_eqs)

    new_equations = equations(system)
    new_equations[9] = w1.msl ~ w1.ecir / w1.msln
    new_equations[13] = w1.nrur ~ w1.pop * w1.nrun * w1a.nrmm

    @named new_system = ODESystem(new_equations)

    return new_system
end
