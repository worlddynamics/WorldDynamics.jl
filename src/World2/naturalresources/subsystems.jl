@variables t
D = Differential(t)

function natural_resources(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @variables nrem(t) [description = "Natural resource extraction multiplier"]
    @variables nrfr(t) [description = "Natural resource fraction remaining"]
    @variables nr(t) = inits[:nr] [description = "Natural resources"]

    @variables nrur(t) [description = "Natural resource usage rate"]

    eqs = [
        nrem ~ interpolate(nrfr, tables[:nrem], ranges[:nrem])
        nrfr ~ nr / inits[:nr]
        D(nr) ~ -nrur
    ]

    ODESystem(eqs; name)
end

function natural_resources_usage_rate(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @parameters nrun = params[:nrun] [description = "Natural resource usage normal"]
    @parameters nrun1 = params[:nrun1] [description = "Natural resource usage normal no. 1"]
    @parameters swt2 = params[:swt2] [description = "Switch time no. 2"]

    @variables nrur(t) [description = "Natural resource usage rate"]
    @variables nrmm(t) [description = "Natural resources from material multiplier"]

    @variables p(t) [description = "Population"]
    @variables msl(t) [description = "Material standard of living"]

    eqs = [
        nrur ~ p * clip(nrun, nrun1, swt2, t) * nrmm
        nrmm ~ interpolate(msl, tables[:nrmm], ranges[:nrmm])
    ]

    ODESystem(eqs; name)
end
