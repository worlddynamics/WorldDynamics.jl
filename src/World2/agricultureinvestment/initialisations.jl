_inits = Dict{Symbol, Float64}(
    :ciaf => 0.2,
)

getinitialisations() = copy(_inits)
