module World1A

using WorldDynamics
using ModelingToolkit

include("world1a/tables.jl")
include("world1a/parameters.jl")
include("world1a/initialisations.jl")
include("world1a/subsystems.jl")
include("world1a/scenarios.jl")
include("world1a/plots.jl")

end
