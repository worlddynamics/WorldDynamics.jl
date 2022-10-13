_inits = Dict{Symbol, Float64}(
    :ci => 0.4e9,
)

getinitialisations() = copy(_inits)
