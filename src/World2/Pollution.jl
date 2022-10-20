module Pollution

using ModelingToolkit
using WorldDynamics

include("pollution/tables.jl")
include("pollution/parameters.jl")
include("pollution/initialisations.jl")
include("pollution/subsystems.jl")

end
