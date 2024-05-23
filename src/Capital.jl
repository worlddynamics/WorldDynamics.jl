module Capital

using WorldDynamics
using ModelingToolkit

include("capital/tables.jl")
include("capital/parameters.jl")
include("capital/initialisations.jl")
include("capital/subsystems.jl")

end
