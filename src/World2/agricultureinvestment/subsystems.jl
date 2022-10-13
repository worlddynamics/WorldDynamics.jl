@variables t
D = Differential(t)

function agriculture_investment(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @parameters fc = params[:fc]
    @parameters fc1 = params[:fc1]
    @parameters swt7 = params[:swt7]
    @parameters fn = params[:fn]
    @parameters ciaft = params[:ciaft]

    @variables fr(t)
    @variables fpci(t)
    @variables fcm(t)
    @variables fpm(t)
    @variables ciaf(t) = inits[:ciaf]
    @variables cfifr(t)
    @variables ciqr(t)

    @variables cr(t)
    @variables cira(t)
    @variables polr(t)
    @variables qlm(t)
    @variables qlf(t)

    eqs = [
        fr ~ fpci * fcm * fpm * clip(fc, fc1, swt7, t) / fn
        fcm ~ interpolate(cr, tables[:fcm], ranges[:fcm])
        fpci ~ interpolate(cira, tables[:fpci], ranges[:fpci])
        fpm ~ interpolate(polr, tables[:fpm], ranges[:fpm])
        D(ciaf) ~ (cfifr * ciqr - ciaf) / ciaft
        cfifr ~ interpolate(fr, tables[:cfifr], ranges[:cfifr])
        ciqr ~ interpolate(qlm / qlf, tables[:ciqr], ranges[:ciqr])
    ]

    ODESystem(eqs; name)
end
