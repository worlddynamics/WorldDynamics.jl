_inits = Dict{Symbol,Float64}(
    :CCSD =>  0.15 + 0.005 + 0.02,
    :ELTI => 0.02,
    :PI => 0.02,
    :PU => 0.0326951,
    :CBSR => 0.02,
)


getinitialisations() = copy(_inits)
