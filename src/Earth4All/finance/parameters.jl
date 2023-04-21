_params = Dict{Symbol,Float64}(
    :GRCR => 0,
    :FSRT =>1,
    :NBOM => 0.015,
    :NBBM => 0.005,
    :NSR => 0.02,
    :IEFT => 10,
    :IPT => 1,
    :UPT => 1,
    :INSR => 0.7,
    :IT => 0.02,
    :UT => 0.05,
    :UNSR => -1.5,
    :SRAT => 1,

)

getparameters() = copy(_params)
