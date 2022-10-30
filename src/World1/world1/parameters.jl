_params = Dict{Symbol, Float64}(
    :brn => 0.045,
    :brms => 1.0,
    :msln => 1.0,
    :nrun => 1.0,
    :drn => 0.025,
    :drms => 1.0,
    :la => 135e6,
    :pdn => 265,
    :cigc => 1.0,
    :cidn => 0.025,
    :pols => 3.6e9,
    :poln => 1.0,
    :ciaft => 30.0,
    :qls => 1.0,
)

getparameters() = copy(_params)
