_tables = Dict{Symbol,Tuple{Vararg{Float64}}}(
)

_ranges = Dict{Symbol,Tuple{Float64,Float64}}(
)

gettables() = copy(_tables)
getranges() = copy(_ranges)
