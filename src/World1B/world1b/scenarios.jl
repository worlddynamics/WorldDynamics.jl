function standard_run(; kwargs...)
    @named w1 = World1.standard_run(params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @named w1a = World1A.standard_run(params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @named w1b = world1b()

    systems = [w1, w1a, w1b]

    connection_eqs = WorldDynamics.variable_connections(systems)

    system = WorldDynamics.compose(systems, connection_eqs)

    @variables t
    D = Differential(t)

    new_equations = equations(system)
    new_equations[10] = w1.msl ~ w1.ecir / (1.0 - _params[:ciafn])
    new_equations[27] = w1.cira ~ w1.cir * w1.ciaf / _params[:ciafn]
    new_equations[7] = D(w1.ciaf) ~ (w1.cfifr * w1b.ciqr - w1.ciaf) / (w1.ciaft)

    @named new_system = ODESystem(new_equations)

    return new_system
end
