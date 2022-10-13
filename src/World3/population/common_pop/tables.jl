_tables = Dict{Symbol, Tuple{Vararg{Float64}}}(
    :cmi => (0.5, 0.05, -0.1, -0.08, -0.02, 0.05, 0.1, 0.15, 0.2), # Line 27.1 Appendix A
    :fpu => (0.0, 0.2, 0.4, 0.5, 0.58, 0.65, 0.72, 0.78, 0.8), # Line 26.1 Appendix A
    :hsapc => (0.0, 20.0, 50.0, 95.0, 140.0, 175.0, 200.0, 220.0, 230.0), # Line 21.1 Appendix A
    :lmf => (0.0, 1.0, 1.2, 1.3, 1.35, 1.4), # Line 20.1 Appendix A
    :lmhs1 => (1.0, 1.1, 1.4, 1.6, 1.7, 1.8), # Line 24.1 Appendix A
    :lmhs2 => (1.0, 1.4, 1.6, 1.8, 1.95, 2.0), # Line 25.1 Appendix A
    :lmp => (1.0, 0.99, 0.97, 0.95, 0.9, 0.85, 0.75, 0.65, 0.55, 0.4, 0.2), # Line 29.1 Appendix A
    :fm => (0.0, 0.2, 0.4, 0.6, 0.8, 0.9, 1.0, 1.05, 1.1), # Line 34.1 Appendix A
    :cmple => (3.0, 2.1, 1.6, 1.4, 1.3, 1.2, 1.1, 1.05, 1.0), # Line 35.1 Appendix A
    :sfsn => (1.25, 1.0, 0.9, 0.8, 0.75), # Line 39.1 Appendix A
    :frsn => (0.5, 0.6, 0.7, 0.85, 1.0), # Line 41.1 Appendix A
    :fce => (0.75, 0.85, 0.9, 0.95, 0.98, 0.99, 1.0), # Line 45.2 Appendix A
    :fsafc => (0.0, 0.005, 0.015, 0.025, 0.03, 0.035), # Line 48.1 Appendix A
)

_ranges = Dict{Symbol, Tuple{Float64, Float64}}(
    :cmi => (0, 1600), # Line 27 Appendix A
    :fpu => (0, 16e9), # Line 26 Appendix A
    :hsapc => (0.0, 2000.0), # Line 21 Appendix A
    :lmf => (0.0, 5.0), # Line 20 Appendix A
    :lmhs1 => (0.0, 100.0), # Line 24 Appendix A
    :lmhs2 => (0.0, 100.0), # Line 25 Appendix A
    :lmp => (0.0, 100.0), # Line 29 Appendix A
    :fm => (0.0, 80.0), # Line 34 Appendix A
    :cmple => (0.0, 80.0), # Line 35 Appendix A
    :sfsn => (0.0, 800.0), # Line 39 Appendix A
    :frsn => (-0.2, 0.2), # Line 41 Appendix A
    :fce => (0.0, 3.0), # Line 45 Appendix A
    :fsafc => (0.0, 10.0), # Line 48 Appendix A
)
