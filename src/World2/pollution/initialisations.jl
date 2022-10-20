_inits = Dict{Symbol, Float64}(
    :pol => 0.2e9,
)

getinitialisations() = copy(_inits)
