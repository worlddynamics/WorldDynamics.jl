@variables t
D = Differential(t)

function capital_investment(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @parameters ecirn = params[:ecirn]
    @parameters ciafn = params[:ciafn]

    @variables msl(t)
    @variables ecir(t)
    @variables cir(t)
    @variables cira(t)
    @variables ci(t) = inits[:ci]

    @variables ciaf(t)
    @variables nrem(t)
    @variables p(t)
    @variables cig(t)
    @variables cid(t)

    eqs = [
        msl ~ ecir / ecirn
        ecir ~ cir * (1 - ciaf) * nrem / (1 - ciafn)
        cira ~ cir * ciaf / ciafn
        cir ~ ci / p
        D(ci) ~ cig - cid
    ]

    ODESystem(eqs; name)
end

function capital_investment_generation(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @parameters cign = params[:cign]
    @parameters cign1 = params[:cign1]
    @parameters swt4 = params[:swt4]

    @variables cig(t)
    @variables cim(t)

    @variables p(t)
    @variables msl(t)

    eqs = [
        cig ~ p * cim * clip(cign, cign1, swt4, t)
        cim ~ interpolate(msl, tables[:cim], ranges[:cim])
    ]

    ODESystem(eqs; name)
end

function capital_investment_discard(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @parameters cidn = params[:cidn]
    @parameters cidn1 = params[:cidn1]
    @parameters swt5 = params[:swt5]

    @variables cid(t)

    @variables ci(t)

    eqs = [
        cid ~ ci * clip(cidn, cidn1, swt5, t)
    ]

    ODESystem(eqs; name)
end
