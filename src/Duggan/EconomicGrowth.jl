module EconomicGrowth

using WorldDynamics
using ModelingToolkit

include("economicgrowth/tables.jl")
include("economicgrowth/parameters.jl")
include("economicgrowth/initialisations.jl")
include("economicgrowth/subsystems.jl")
include("economicgrowth/scenarios.jl")
include("economicgrowth/plots.jl")

end
