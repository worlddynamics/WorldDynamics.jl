@variables t
D = Differential(t)

function quality_life(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @parameters qls = params[:qls] [description = "Quality of life standard"]

    @variables ql(t) [description = "Quality of life"]
    @variables qlm(t) [description = "Quality of life from material"]
    @variables qlc(t) [description = "Quality of life from crowding"]
    @variables qlf(t) [description = "Quality of life from food"]
    @variables qlp(t) [description = "Quality of life from pollution"]

    @variables msl(t) [description = "Material standard of living"]
    @variables cr(t) [description = "Crowding ratio"]
    @variables fr(t) [description = "Food ratio"]
    @variables polr(t) [description = "Pollution ratio"]

    eqs = [
        ql ~ qls * qlm * qlc * qlf * qlp
        qlm ~ interpolate(msl, tables[:qlm], ranges[:qlm])
        qlc ~ interpolate(cr, tables[:qlc], ranges[:qlc])
        qlf ~ interpolate(fr, tables[:qlf], ranges[:qlf])
        qlp ~ interpolate(polr, tables[:qlp], ranges[:qlp])
    ]

    ODESystem(eqs; name)
end
