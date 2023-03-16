_inits = Dict{Symbol,Float64}(
    :capital => 5,
    :resource => 1000,
)

getinitialisations() = copy(_inits)
