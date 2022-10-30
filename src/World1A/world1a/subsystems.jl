@variables t

function world1a(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @variables msl(t)
    @variables nrmm(t)

    eqs = [
        nrmm ~ interpolate(msl, tables[:nrmm], ranges[:nrmm])
    ]

    ODESystem(eqs; name)
end
