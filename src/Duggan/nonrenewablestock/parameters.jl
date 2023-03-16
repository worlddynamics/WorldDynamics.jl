_params = Dict{Symbol,Float64}(
    :cost_per_investment => 2,
    :depreciation_rate => 0.05,
    :fraction_profits_reinvested => 0.12,
    :revenue_per_unit_extracted => 3,
    :desired_growth_fraction => 0.07,
)

getparameters() = copy(_params)
