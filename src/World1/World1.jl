module World1

using WorldDynamics
using ModelingToolkit

include("world1/tables.jl")
include("world1/parameters.jl")
include("world1/initialisations.jl")
include("world1/subsystems.jl")
include("world1/scenarios.jl")
include("world1/plots.jl")

end
