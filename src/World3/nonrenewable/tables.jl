tables = Dict{Symbol, Tuple{Vararg{Float64}}}(
    :pcrum => (0.0, 0.85, 2.6, 4.4, 5.4, 6.2, 6.8, 7.0, 7.0), # Line 132.1 Appendix A
    :fcaor1 => (1.0, 0.9, 0.7, 0.5, 0.2, 0.1, 0.05, 0.05, 0.05, 0.05, 0.05), # Line 135.1 Appendix A
    :fcaor2 => (1.0, 0.9, 0.7, 0.5, 0.2, 0.1, 0.05, 0.05, 0.05, 0.05, 0.05), # Line 136.1 Appendix A
)

ranges = Dict{Symbol, Tuple{Float64, Float64}}(
    :pcrum => (0, 1600), # Line 132 Appendix A
    :fcaor1 => (0, 1), # Line 135 Appendix A
    :fcaor2 => (0, 1), # Line 136 Appendix A
)

gettables() = copy(tables)
getranges() = copy(ranges)
