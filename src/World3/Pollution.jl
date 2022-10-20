module Pollution

using ModelingToolkit
using WorldDynamics

include("pollution/tables.jl")
include("pollution/parameters.jl")
include("pollution/initialisations.jl")
include("pollution/subsystems.jl")
include("pollution/scenarios.jl")
include("pollution/plots.jl")

end
