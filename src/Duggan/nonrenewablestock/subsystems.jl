@variables t
D = Differential(t)

function non_renewable_stock(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @parameters cost_per_investment = params[:cost_per_investment]
    @parameters depreciation_rate = params[:depreciation_rate]
    @parameters fraction_profits_reinvested = params[:fraction_profits_reinvested]
    @parameters revenue_per_unit_extracted = params[:revenue_per_unit_extracted]
    @parameters desired_growth_fraction = params[:desired_growth_fraction]

    @variables capital(t) = inits[:capital]
    @variables depreciation(t)
    @variables desired_investment(t)
    @variables resource(t) = inits[:resource]
    @variables extraction(t)
    @variables extraction_efficiency_per_unit_capital(t)
    @variables total_revenue(t)
    @variables capital_costs(t)
    @variables profit(t)
    @variables capital_funds(t)
    @variables maximum_investment(t)
    @variables investment(t)

    eqs = [
        D(capital) ~ investment - depreciation
        depreciation ~ capital * depreciation_rate
        desired_investment ~ desired_growth_fraction * capital
        D(resource) ~ -extraction
        extraction ~ capital * extraction_efficiency_per_unit_capital
        extraction_efficiency_per_unit_capital ~ interpolate(resource, tables[:eepuc], ranges[:eepuc])
        total_revenue ~ revenue_per_unit_extracted * extraction
        capital_costs ~ capital * 0.10
        profit ~ total_revenue - capital_costs
        capital_funds ~ profit * fraction_profits_reinvested
        maximum_investment ~ capital_funds / cost_per_investment
        investment ~ min(desired_investment, maximum_investment)
    ]

    ODESystem(eqs; name)
end
