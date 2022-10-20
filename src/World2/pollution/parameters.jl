_params = Dict{Symbol, Float64}(
    :pols => 3.6e9,
    :poln => 1,
    :poln1 => 1,
    :swt6 => 1970,
)

getparameters() = copy(_params)
