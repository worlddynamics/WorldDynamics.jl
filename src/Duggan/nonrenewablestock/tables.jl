_tables = Dict{Symbol,Tuple{Vararg{Float64}}}(
    :eepuc => (0.0, 0.25, 0.45, 0.63, 0.75, 0.85, 0.92, 0.96, 0.98, 0.99, 1.0),
)

_ranges = Dict{Symbol,Tuple{Float64,Float64}}(
    :eepuc => (0.0, 1000.0),
)

gettables() = copy(_tables)
getranges() = copy(_ranges)
