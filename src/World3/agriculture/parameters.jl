params = Dict{Symbol, Float64}(
    :palt => 3.2e9, # Line 84.1 Appendix A
    :lfh => 0.7, # Line 87.1 Appendix A
    :pl => 0.1, # Line 87.2 Appendix A
    :alai1 => 2, # Line 100.1 Appendix A
    :alai2 => 2, # Line 100.2 Appendix A
    :lyf1 => 1, # Line 104.1 Appendix A
    :lyf2 => 1, # Line 104.2 Appendix A
    :io70 => 7.9e11, # Line 107.2 Appendix A
    :sd => 0.07, # Line 109.1 Appendix A
    :alln => 6000, # Line 112.1 Appendix A
    :uildt => 10, # Line 119.1 Appendix A
    :ilf => 600, # Line 124.1 Appendix A
    :sfpc => 230, # Line 127.1 Appendix A
    :fspd => 2, # Line 128.2 Appendix A
    :eyear => 2500,
    :popi => 1.65e9,
    :ioi => 0.67e11,
    :ppolxi => 0.12,
    :pyear => 1975, # Line 150.1 Appendix A
    :exppop => 0.012,
)

getparameters() = copy(params)
