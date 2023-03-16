_params = Dict{Symbol,Float64}(
    :reinvestment_fraction => 0.2,
    :depreciation_factor => 0.1,
    :labour => 100,
)

getparameters() = copy(_params)
