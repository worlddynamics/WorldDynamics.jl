module World2

using WorldDynamics
using ModelingToolkit

include("AgricultureInvestment.jl")
include("CapitalInvestment.jl")
include("NaturalResources.jl")
include("Pollution.jl")
include("Population.jl")
include("QualityLife.jl")

include("world2/scenarios.jl")
include("world2/plots.jl")

end
