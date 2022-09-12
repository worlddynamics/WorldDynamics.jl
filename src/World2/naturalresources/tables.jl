tables = Dict{Symbol, Tuple{Vararg{Number}}}(
    :nrem => (0.0, 0.15, 0.5, 0.85, 1.0),
    :nrmm => (0.0, 1.0, 1.8, 2.4, 2.9, 3.3, 3.6, 3.8, 3.9, 3.95, 4.0),
)

ranges = Dict{Symbol, Tuple{Number,Number}}(
    :nrem => (0, 1),
    :nrmm => (0, 10),
)
