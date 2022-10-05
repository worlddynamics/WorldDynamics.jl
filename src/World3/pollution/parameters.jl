params = Dict{Symbol, Float64}(
    :pyear => 1975, # Line 150.1 Appendix A
    :ppgf1 => 1, # Line 138.1 Appendix A
    :ppgf21 => 1, # Line 138.2 Appendix A
    :frpm => 0.02, # Line 139.1 Appendix A
    :imef => 0.1, # Line 139.2 Appendix A
    :imti => 10, # Line 139.3 Appendix A
    :fipm => 0.001, # Line 140.1 Appendix A
    :amti => 1, # Line 140.2 Appendix A
    :pptd1 => 20, # Line 141.1 Appendix A
    :pptd2 => 20, # Line 141.1 Appendix A
    :ppol70 => 1.36e8, # Line 143.1 Appendix A
    :ahl70 => 1.5, # Line 146 Appendix A
    :swat => 0, # Line 138.2 Appendix A
    :tdd => 10,
    :pcti => 1,
    :pd => 5,
)

getparameters() = copy(params)
