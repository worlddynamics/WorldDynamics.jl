tables = Dict{Symbol, Tuple{Vararg{Float64}}}(
    :pcrum => (0.0, 0.85, 2.6, 4.4, 5.4, 6.2, 6.8, 7.0, 7.0),
    :fcaor1 => (1.0, 0.9, 0.7, 0.5, 0.2, 0.1, 0.05, 0.05, 0.05, 0.05, 0.05),
    :fcaor2 => (1.0, 0.9, 0.7, 0.5, 0.2, 0.1, 0.05, 0.05, 0.05, 0.05, 0.05),
)

ranges = Dict{Symbol, Tuple{Float64, Float64}}(
    :pcrum => (0, 1600),
    :fcaor1 => (0, 1),
    :fcaor2 => (0, 1),
)
