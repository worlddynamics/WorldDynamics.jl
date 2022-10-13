_tables = Dict{Symbol, Tuple{Vararg{Float64}}}(
    :fcm => (2.4, 1.0, 0.6, 0.4, 0.3, 0.2),
    :fpci => (0.5, 1.0, 1.4, 1.7, 1.9, 2.05, 2.2),
    :fpm => (1.02, 0.9, 0.65, 0.35, 0.2, 0.1, 0.05),
    :cfifr => (1.0, 0.6, 0.3, 0.15, 0.1),
    :ciqr => (0.7, 0.8, 1.0, 1.5, 2.0),
)

_ranges = Dict{Symbol, Tuple{Float64, Float64}}(
    :fcm => (0, 5),
    :fpci => (0, 6),
    :fpm => (0, 60),
    :cfifr => (0, 2),
    :ciqr => (0, 2),
)

gettables() = copy(_tables)
getranges() = copy(_ranges)
