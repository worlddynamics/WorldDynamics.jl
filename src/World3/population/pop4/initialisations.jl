_inits = Dict{Symbol, Float64}(
    :p1 => 65e7, # Line 2.2 Appendix A
    :p2 => 70e7, # Line 6.2 Appendix A
    :p3 => 19e7, # Line 10.2 Appendix A
    :p4 => 6e7, # Line 14.2 Appendix A
)

_inits = merge(_inits, CommonPop._inits)

getinitialisations() = copy(_inits)
