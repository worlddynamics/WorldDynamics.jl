_tables = Dict{Symbol, Tuple{Vararg{Float64}}}(
    :fioas2 => (0.3, 0.2, 0.1, 0.05, 0.0), # Line 65.1 Appendix A
    :fioas1 => (0.3, 0.2, 0.1, 0.05, 0.0), # Line 64.1 Appendix A
    :isopc1 => (40.0, 300.0, 640.0, 1000.0, 1220.0, 1450.0, 1650.0, 1800.0, 2000.0), # Line 61.1 Appendix A
    :isopc2 => (40.0, 300.0, 640.0, 1000.0, 1220.0, 1450.0, 1650.0, 1800.0, 2000.0), # Line 62.1 Appendix A
    :fioacv => (0.3, 0.32, 0.34, 0.36, 0.38, 0.43, 0.73, 0.77, 0.81, 0.82, 0.83), # Line 59.1 Appendix A
    :cuf => (1.0, 0.9, 0.7, 0.3, 0.1, 0.1), # Line 83.2 Appendix A
    :jpicu => (0.37, 0.18, 0.12, 0.09, 0.07, 0.06), # Line 75.1 Appendix A
    :jph => (2.0, 0.5, 0.4, 0.3, 0.27, 0.24, 0.2, 0.2), # Line 79.1 Appendix A
    :jpscu => (1.1, 0.6, 0.35, 0.2, 0.15, 0.15), # Line 77.1 Appendix A
    :pop => (1.65, 1.73, 1.8, 2.1, 2.3, 2.55, 3.0, 3.65, 4.0, 4.6, 5.15),
    :fcaor => (0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05),
    :fioaa => (0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1),
    :aiph => (5.0, 11.0, 21.0, 34.0, 58.0, 86.0, 123.0, 61.0, 23.0, 8.0, 3.0),
    :al => (9.0, 10.0, 11.0, 13.0, 16.0, 20.0, 23.0, 24.0, 24.0, 24.0, 24.0),
)

_ranges = Dict{Symbol, Tuple{Float64, Float64}}(
    :fioaa => (1900, 2000),
    :fioas2 => (0, 2), # Line 65 Appendix A
    :fioas1 => (0, 2), # Line 64 Appendix A
    :isopc1 => (0, 1600), # Line 61 Appendix A
    :isopc2 => (0, 1600), # Line 62 Appendix A
    :fioacv => (0, 2), # Line 59 Appendix A
    :cuf => (1, 11), # Line 83 Appendix A
    :jpicu => (50, 800), # Line 75 Appendix A
    :jph => (2, 30), # Line 79 Appendix A
    :aiph => (1900, 2100),
    :al => (1900, 2100),
    :jpscu => (50, 800), # Line 77 Appendix A
    :pop => (1900, 2000),
    :fcaor => (1900, 2000),
)

gettables() = copy(_tables)
getranges() = copy(_ranges)
