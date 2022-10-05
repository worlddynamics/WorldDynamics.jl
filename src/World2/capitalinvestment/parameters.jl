params = Dict{Symbol, Float64}(
    :ecirn => 1,
    :ciafn => 0.3,
    :cign => 0.05,
    :cign1 => 0.05,
    :swt4 => 1970,
    :cidn => 0.025,
    :cidn1 => 0.025,
    :swt5 => 1970,
)

getparameters() = copy(params)
