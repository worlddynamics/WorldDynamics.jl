module World2

include("AgricultureInvestment.jl")
include("CapitalInvestment.jl")
include("NaturalResources.jl")
include("Pollution.jl")
include("Population.jl")
include("QualityLife.jl")

include("../solvesystems.jl")
include("world2/scenarios.jl")
include("world2/plots.jl")

end
