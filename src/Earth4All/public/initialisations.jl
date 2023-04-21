_inits = Dict{Symbol,Float64}(
    :RTFPUA => 0,
    :TFPEE5TA => 1,
)

getinitialisations() = copy(_inits)
