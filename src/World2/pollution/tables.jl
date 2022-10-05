tables = Dict{Symbol, Tuple{Vararg{Float64}}}(
    :polcm => (0.05, 1.0, 3.0, 5.4, 7.4, 8.0),
    :polat => (0.6, 2.5, 5.0, 8.0, 11.5, 15.5, 20.0),
)

ranges = Dict{Symbol, Tuple{Float64, Float64}}(
    :polcm => (0, 5),
    :polat => (0, 60),
)

gettables() = copy(tables)
getranges() = copy(ranges)
