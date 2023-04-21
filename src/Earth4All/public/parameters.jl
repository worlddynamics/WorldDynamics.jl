_params = Dict{Symbol,Float64}(
    :xETAC2022 => 0,
    :xETAC2100 => 0,
    :CTA2022 => 9145,
    :FUATA => 0.3,
    :sOWTFP => -0.1,
    :IPR1980 => 1.2,
    :IPRVPSS => 1,
    :EDROTA2022 => 0.003,
    :DROTA1980 => 0.01,
    :SC1980 => 0.3,
    :SCROTA => 0.5,
    :MIROTA2022 => 0.005,
    :GDPTL => 15,
    :IIEEROTA => -0.1,
)

getparameters() = copy(_params)
