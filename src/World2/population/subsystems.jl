@variables t
D = Differential(t)

function population(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @parameters la = params[:la] [description = "Land area"]
    @parameters pdn = params[:pdn] [description = "Population density normal"]

    @variables p(t) = inits[:p] [description = "Population"]
    @variables cr(t) [description = "Crowding ratio"]

    @variables br(t) [description = "Birth rate"]
    @variables dr(t) [description = "Death rate"]

    eqs = [
        D(p) ~ br - dr
        cr ~ p / (la * pdn)
    ]

    ODESystem(eqs; name)
end

function birth_rate(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @parameters brn = params[:brn] [description = "Birth rate normal"]
    @parameters brn1 = params[:brn1] [description = "Birth rate normal no. 1"]
    @parameters swt1 = params[:swt1] [description = "Switch time no. 1"]

    @variables br(t) [description = "Birth rate"]
    @variables brmm(t) [description = "Birth rate from material multiplier"]
    @variables brcm(t) [description = "Birth rate from crowding multiplier"]
    @variables brfm(t) [description = "Birth rate from food multiplier"]
    @variables brpm(t) [description = "Birth rate from pollution multiplier"]

    @variables p(t) [description = "Population"]
    @variables msl(t) [description = "Material standard of living"]
    @variables cr(t) [description = "Crowding ratio"]
    @variables fr(t) [description = "Food ratio"]
    @variables polr(t) [description = "Pollution ratio"]

    eqs = [
        br ~ p * clip(brn, brn1, swt1, t) * brfm * brmm * brcm * brpm
        brmm ~ interpolate(msl, tables[:brmm], ranges[:brmm])
        brcm ~ interpolate(cr, tables[:brcm], ranges[:brcm])
        brfm ~ interpolate(fr, tables[:brfm], ranges[:brfm])
        brpm ~ interpolate(polr, tables[:brpm], ranges[:brpm])
    ]

    ODESystem(eqs; name)
end

function death_rate(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @parameters drn = params[:drn] [description = "Death rate normal"]
    @parameters drn1 = params[:drn1] [description = "Death rate normal no. 1"]
    @parameters swt3 = params[:swt3] [description = "Switch time no. 3"]

    @variables dr(t) [description = "Death rate"]
    @variables drmm(t) [description = "Death rate from material multiplier"]
    @variables drcm(t) [description = "Death rate from crowding multiplier"]
    @variables drfm(t) [description = "Death rate from food multiplier"]
    @variables drpm(t) [description = "Death rate from pollution multiplier"]

    @variables p(t) [description = "Population"]
    @variables msl(t) [description = "Material standard of living"]
    @variables cr(t) [description = "Crowding ratio"]
    @variables fr(t) [description = "Food ratio"]
    @variables polr(t) [description = "Pollution ratio"]

    eqs = [
        dr ~ p * clip(drn, drn1, swt3, t) * drfm * drmm * drcm * drpm
        drmm ~ interpolate(msl, tables[:drmm], ranges[:drmm])
        drcm ~ interpolate(cr, tables[:drcm], ranges[:drcm])
        drfm ~ interpolate(fr, tables[:drfm], ranges[:drfm])
        drpm ~ interpolate(polr, tables[:drpm], ranges[:drpm])
    ]

    ODESystem(eqs; name)
end
