@variables t
D = Differential(t)

function economic_growth(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @parameters depreciation_factor = params[:depreciation_factor]
    @parameters labour = params[:labour]
    @parameters reinvestment_fraction = params[:reinvestment_fraction]

    @variables machines(t) = inits[:machines]
    @variables investment(t)
    @variables economic_output(t)
    @variables discards(t)

    eqs = [
        D(machines) ~ investment - discards
        investment ~ economic_output * reinvestment_fraction
        discards ~ machines * depreciation_factor
        economic_output ~ labour * sqrt(machines)
    ]

    ODESystem(eqs; name)
end
