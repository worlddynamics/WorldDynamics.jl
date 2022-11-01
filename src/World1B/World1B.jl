module World1B

using ModelingToolkit
using WorldDynamics

include("world1b/tables.jl")
include("world1b/parameters.jl")
include("world1b/initialisations.jl")
include("world1b/subsystems.jl")
include("world1b/scenarios.jl")
include("world1b/plots.jl")

end
