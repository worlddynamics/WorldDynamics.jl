inits = Dict{Symbol, Float64}(
    :al => 0.9e9, # Line 85.2 Appendix A
    :pal => 2.3e9, # Line 86.2 Appendix A
    :ai => 5e9, # Line 99.1 Appendix A
    :uil => 8.2e6, # Line 120.2 Appendix A
    :lfert => 600, # Line 121.2 Appendix A
    :pfr => 1, # Line 128.1 Appendix A
)

getinitialisations() = copy(inits)
