@variables t
D = Differential(t)

function capital_investment(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @parameters ecirn = params[:ecirn] [description = "Effective capital investment ratio normal"]
    @parameters ciafn = params[:ciafn] [description = "Capital investment in agriculture fraction normal"]

    @variables msl(t) [description = "Material standard of living"]
    @variables ecir(t) [description = "Effective capital investment ratio"]
    @variables cira(t) [description = "Capital investment ratio in agriculture"]
    @variables cir(t) [description = "Capital investment ratio"]
    @variables ci(t) = inits[:ci] [description = "Capital investment"]

    @variables ciaf(t) [description = "Capital investment in agriculture fraction"]
    @variables nrem(t) [description = "Natural resource extraction multiplier"]
    @variables p(t) [description = "Population"]
    @variables cig(t) [description = "Capital investment generation"]
    @variables cid(t) [description = "Capital investment discard"]

    eqs = [
        msl ~ ecir / ecirn
        ecir ~ cir * (1 - ciaf) * nrem / (1 - ciafn)
        cira ~ cir * ciaf / ciafn
        cir ~ ci / p
        D(ci) ~ cig - cid
    ]

    ODESystem(eqs, t; name)
end

function capital_investment_generation(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @parameters cign = params[:cign] [description = "Capital investment generation normal"]
    @parameters cign1 = params[:cign1] [description = "Capital investment generation normal no. 1"]
    @parameters swt4 = params[:swt4] [description = "Switch time no. 4"]

    @variables cig(t) [description = "Capital investment generation"]
    @variables cim(t) [description = "Capital investment multiplier"]

    @variables p(t) [description = "Population"]
    @variables msl(t) [description = "Material standard of living"]

    eqs = [
        cig ~ p * cim * clip(cign, cign1, swt4, t)
        cim ~ interpolate(msl, tables[:cim], ranges[:cim])
    ]

    ODESystem(eqs, t; name)
end

function capital_investment_discard(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @parameters cidn = params[:cidn] [description = "Capital investment discard normal"]
    @parameters cidn1 = params[:cidn1] [description = "Capital investment discard normal no. 1"]
    @parameters swt5 = params[:swt5] [description = "Switch time no. 5"]

    @variables cid(t) [description = "Capital investment discard"]

    @variables ci(t) [description = "Capital investment"]

    eqs = [
        cid ~ ci * clip(cidn, cidn1, swt5, t)
    ]

    ODESystem(eqs, t; name)
end
