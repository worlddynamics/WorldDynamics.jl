tables = Dict{Symbol, Tuple{Vararg{Float64}}}(
    :ifpc1 => (230.0, 480.0, 690.0, 850.0, 970.0, 1070.0, 1150.0, 1210.0, 1250.0), # Line 90.1 Appendix A
    :ifpc2 => (230.0, 480.0, 690.0, 850.0, 970.0, 1070.0, 1150.0, 1210.0, 1250.0), # Line 91.1 Appendix A
    :fioaa1 => (0.4, 0.2, 0.1, 0.025, 0.0, 0.0), # Line 94.1 Appendix A
    :fioaa2 => (0.4, 0.2, 0.1, 0.025, 0.0, 0.0), # Line 95.1 Appendix A
    :dcph => (100000.0, 7400.0, 5200.0, 3500.0, 2400.0, 1500.0, 750.0, 300.0, 150.0, 75.0, 50.0), # Line 97.1 Appendix A
    :lymc => (1.0, 3.0, 3.8, 4.4, 4.9, 5.4, 5.7, 6.0, 6.3, 6.6, 6.9, 7.2, 7.4, 7.6, 7.8, 8.0, 8.2, 8.4, 8.6, 8.8, 9.0, 9.2, 9.4, 9.6, 9.8, 10.0), # Line 102.1 Appendix A
    :lymap1 => (1.0, 1.0, 0.7, 0.4), # Line 106.1 Appendix A
    :lymap2 => (1.0, 1.0, 0.7, 0.4), # Line 107.1 Appendix A
    :fiald => (0.0, 0.05, 0.15, 0.3, 0.5, 0.7, 0.85, 0.95, 1.0), # Line 108.1 Appendix A
    :mlymc => (0.075, 0.03, 0.015, 0.011, 0.009, 0.008, 0.007, 0.006, 0.005, 0.005, 0.005, 0.005, 0.005, 0.005, 0.005, 0.005), # Line 111.1 Appendix A
    :llmy1 => (1.2, 1.0, 0.63, 0.36, 0.16, 0.055, 0.04, 0.025, 0.015, 0.01), # Line 114.1 Appendix A
    :llmy2 => (1.2, 1.0, 0.63, 0.36, 0.16, 0.055, 0.04, 0.025, 0.015, 0.01), # Line 115.1 Appendix A
    :uilpc => (0.005, 0.008, 0.015, 0.025, 0.04, 0.055, 0.07, 0.08, 0.09), # Line 117.1 Appendix A
    :lfdr => (0.0, 0.1, 0.3, 0.5), # Line 122.1 Appendix A
    :lfrt => (20.0, 13.0, 8.0, 4.0, 2.0, 2.0), # Line 125.1 Appendix A
    :falm => (0.0, 0.04, 0.07, 0.09, 0.1), # Line 126.1 Appendix A
)

ranges = Dict{Symbol, Tuple{Float64, Float64}}(
    :ifpc1 => (0, 1600), # Line 90 Appendix A
    :ifpc2 => (0, 1600), # Line 91 Appendix A
    :fioaa1 => (0.0, 2.5), # Line 94 Appendix A
    :fioaa2 => (0.0, 2.5), # Line 95 Appendix A
    :dcph => (0, 1), # Line 97 Appendix A
    :lymc => (0, 1000), # Line 102 Appendix A
    :lymap1 => (0, 30), # Line 106 Appendix A
    :lymap2 => (0, 30), # Line 107 Appendix A
    :fiald => (0, 2), # Line 108 Appendix A
    :mlymc => (0, 600), # Line 111 Appendix A
    :llmy1 => (0, 9), # Line 114 Appendix A
    :llmy2 => (0, 9), # Line 115 Appendix A
    :uilpc => (0, 1600), # Line 117 Appendix A
    :lfdr => (0, 30), # Line 122 Appendix A
    :lfrt => (0, 0.1), # Line 125 Appendix A
    :falm => (0, 4), # Line 126 Appendix A
)

gettables() = copy(tables)
getranges() = copy(ranges)
