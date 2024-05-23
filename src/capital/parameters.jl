_params = Dict{Symbol,Float64}(
    :CPI => 2,
    :DERA => 0.05,
    :FPR => 0.12,
    :DGF => 0.07,
)
getparameters() = copy(_params)