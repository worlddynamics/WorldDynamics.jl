module Population

using WorldDynamics
using ModelingToolkit

include("population/tables.jl")
include("population/parameters.jl")
include("population/initialisations.jl")
include("population/subsystems.jl")
include("population/scenarios.jl")
include("population/plots.jl")

end
