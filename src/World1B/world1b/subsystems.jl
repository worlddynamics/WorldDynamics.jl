@variables t

function world1b(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @variables qlm(t) qlf(t)
    @variables ciqr(t)

    eqs = [
        ciqr ~ interpolate(qlm / qlf, tables[:ciqr], ranges[:ciqr])
    ]

    ODESystem(eqs, t; name)
end
