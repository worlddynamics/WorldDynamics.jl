module Capital

using ModelingToolkit
using WorldDynamics

include("capital/tables.jl")
include("capital/parameters.jl")
include("capital/initialisations.jl")
include("capital/subsystems.jl")
include("capital/scenarios.jl")
include("capital/plots.jl")

end
