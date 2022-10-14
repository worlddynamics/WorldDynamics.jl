_tables = Dict{Symbol, Tuple{Vararg{Float64}}}(
    :m1 => (0.0567, 0.0366, 0.0243, 0.0155, 0.0082, 0.0023, 0.001), # Line 4.1 Appendix A
    :m2 => (0.0266, 0.0171, 0.0110, 0.0065, 0.0040, 0.0016, 0.0008), # Line 8.1 Appendix A
    :m3 => (0.0562, 0.0373, 0.0252, 0.0171, 0.0118, 0.0083, 0.006), # Line 12.1 Appendix A
    :m4 => (0.13, 0.11, 0.09, 0.07, 0.06, 0.05, 0.04), # Line 16.1 Appendix A
)

_ranges = Dict{Symbol, Tuple{Float64, Float64}}(
    :m1 => (20, 80), # Line 4 Appendix A
    :m2 => (20, 80), # Line 8 Appendix A
    :m3 => (20, 80), # Line 12 Appendix A
    :m4 => (20, 80), # Line 16 Appendix A
)

_tables = merge(_tables, CommonPop._tables)
_ranges = merge(_ranges, CommonPop._ranges)

gettables() = copy(_tables)
getranges() = copy(_ranges)
