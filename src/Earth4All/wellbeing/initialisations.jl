_inits = Dict{Symbol,Float64}(
    :ORP => 0,
    :PAWBI => 0.65,
    :RD => 30,
    :STE => 1.3,
    :STR => 0.6,
)

getinitialisations() = copy(_inits)
