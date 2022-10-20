_inits = Dict{Symbol, Float64}(
    :ic => 2.1e11,
)

getinitialisations() = copy(_inits)
