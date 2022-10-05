tables = Dict{Symbol, Tuple{Vararg{Float64}}}(
    :qlm => (0.2, 1.0, 1.7, 2.3, 2.7, 2.9),
    :qlc => (2.0, 1.3, 1.0, 0.75, 0.55, 0.45, 0.38, 0.3, 0.25, 0.22, 0.2),
    :qlf => (0.0, 1.0, 1.8, 2.4, 2.7),
    :qlp => (1.04, 0.85, 0.6, 0.3, 0.15, 0.05, 0.02),
)

ranges = Dict{Symbol, Tuple{Float64, Float64}}(
    :qlm => (0, 5),
    :qlc => (0, 5),
    :qlf => (0, 4),
    :qlp => (0, 60),
)

gettables() = copy(tables)
getranges() = copy(ranges)
