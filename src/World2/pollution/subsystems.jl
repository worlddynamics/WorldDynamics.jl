@variables t
D = Differential(t)

function pollution(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @parameters pols = params[:pols] [description = "Pollution standard"]

    @variables polr(t) [description = "Pollution ratio"]
    @variables pol(t) = inits[:pol] [description = "Pollution"]

    @variables polg(t) [description = "Pollution generation	"]
    @variables pola(t) [description = "Pollution absorption"]

    eqs = [
        polr ~ pol / pols
        D(pol) ~ polg - pola
    ]

    ODESystem(eqs; name)
end

function pollution_absorption(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @variables pola(t) [description = "Pollution absorption"]
    @variables polat(t) [description = "Pollution absorption time"]

    @variables pol(t) [description = "Pollution"]
    @variables polr(t) [description = "Pollution ratio"]

    eqs = [
        pola ~ pol / polat
        polat ~ interpolate(polr, tables[:polat], ranges[:polat])
    ]

    ODESystem(eqs; name)
end

function pollution_generation(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @parameters poln = params[:poln] [description = "Pollution normal"]
    @parameters poln1 = params[:poln1] [description = "Pollution normal no. 1"]
    @parameters swt6 = params[:swt6] [description = "Switch time no. 6"]

    @variables polg(t) [description = "Pollution generation"]
    @variables polcm(t) [description = "Pollution from capital multiplier"]

    @variables p(t) [description = "Population"]
    @variables cir(t) [description = "Capital investment ratio"]

    eqs = [
        polg ~ p * clip(poln, poln1, swt6, t) * polcm
        polcm ~ interpolate(cir, tables[:polcm], ranges[:polcm])
    ]

    ODESystem(eqs; name)
end
