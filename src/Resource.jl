module Resource

using WorldDynamics
using ModelingToolkit

include("resource/tables.jl")
include("resource/parameters.jl")
include("resource/initialisations.jl")
include("resource/subsystems.jl")
include("resource/scenarios.jl")
include("resource/plots.jl")

end
