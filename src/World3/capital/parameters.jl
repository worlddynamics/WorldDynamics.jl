_params = Dict{Symbol, Float64}(
    :pyear => 4000, # Line 150.1 Appendix A
    :icor1 => 3, # Line 51.1 Appendix A
    :icor2 => 3, # Line 51.2 Appendix A
    :alic1 => 14, # Line 54.1 Appendix A
    :alic2 => 14, # Line 54.2 Appendix A
    :iet => 4000, # Line 57.1 Appendix A
    :iopcd => 400, # Line 59.2 Appendix A
    :fioac1 => 0.43, # Line 58.1 Appendix A
    :fioac2 => 0.43, # Line 58.2 Appendix A
    :alsc1 => 20, # Line 69.1 Appendix A
    :alsc2 => 20, # Line 69.2 Appendix A
    :scor1 => 1, # Line 72.1 Appendix A
    :scor2 => 1, # Line 72.2 Appendix A
    :lfpf => 0.75, # Line 80.1 Appendix A
    :lufdt => 2, # Line 82.1 Appendix A
)

getparameters() = copy(_params)
