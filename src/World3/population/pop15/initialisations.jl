_inits = Dict{Symbol, Float64}(
    :p1 => 5.3e7,
    :p2 => 2.1e8,
    :p3 => 2.2e8,
    :p4 => 1.8e8,
    :p5 => 1.6e8,
    :p6 => 1.5e8,
    :p7 => 1.3e8,
    :p8 => 1.1e8,
    :p9 => 9.6e7,
    :p10 => 8.3e7,
    :p11 => 6.8e7,
    :p12 => 5.6e7,
    :p13 => 4.5e7,
    :p14 => 3.3e7,
    :p15 => 4.8e7,
)

_inits = merge(_inits, CommonPop._inits)

getinitialisations() = copy(_inits)
