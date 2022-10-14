_tables = Dict{Symbol, Tuple{Vararg{Float64}}}(
    :cim => (0.1, 1.0, 1.8, 2.4, 2.8, 3.0),
)

_ranges = Dict{Symbol, Tuple{Float64, Float64}}(
    :cim => (0, 5),
)

gettables() = copy(_tables)
getranges() = copy(_ranges)
