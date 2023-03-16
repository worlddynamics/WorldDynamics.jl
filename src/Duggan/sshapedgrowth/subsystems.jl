@variables t
D = Differential(t)

function s_shaped_growth(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @parameters capacity = params[:capacity]
    @parameters ref_availability = params[:ref_availability]
    @parameters ref_growth_rate = params[:ref_growth_rate]

    @variables stock(t) = inits[:stock]
    @variables availability(t)
    @variables effect_availability_growth_rate(t)
    @variables growth_rate(t)
    @variables net_flow(t)

    eqs = [
        D(stock) ~ net_flow
        net_flow ~ stock * growth_rate
        growth_rate ~ ref_growth_rate * effect_availability_growth_rate
        effect_availability_growth_rate ~ availability / ref_availability
        availability ~ 1 - stock / capacity
    ]

    ODESystem(eqs; name)
end
