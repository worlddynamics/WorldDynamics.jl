@variables t
D = Differential(t)

function agriculture_investment(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @parameters fc = params[:fc] [description = "Food coefficient"]
    @parameters fc1 = params[:fc1] [description = "Food coefficient no. 1"]
    @parameters swt7 = params[:swt7] [description = "Switch time no. 7"]
    @parameters fn = params[:fn] [description = "Food normal"]
    @parameters ciaft = params[:ciaft] [description = "Capital investment in agriculture fraction adjustment time"]

    @variables fr(t) [description = "Food ratio"]
    @variables fpci(t) [description = "Food potential from capital investment"]
    @variables fcm(t) [description = "Food from crowding multiplier"]
    @variables fpm(t) [description = "Food from pollution multiplier"]
    @variables ciaf(t) = inits[:ciaf] [description = "Capital investment in agriculture fraction"]
    @variables cfifr(t) [description = "Capital fraction indicated by food ratio"]
    @variables ciqr(t) [description = "Capital investment from quality ratio"]

    @variables cr(t) [description = "Crowding ratio"]
    @variables cira(t) [description = "Capital investment ratio in agriculture"]
    @variables polr(t) [description = "Pollution ratio"]
    @variables qlm(t) [description = "Quality of life from material"]
    @variables qlf(t) [description = "Quality of life from food"]

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
