module Agriculture

using ModelingToolkit
using WorldDynamics

include("agriculture/tables.jl")
include("agriculture/parameters.jl")
include("agriculture/initialisations.jl")
include("agriculture/subsystems.jl")
include("agriculture/scenarios.jl")
include("agriculture/plots.jl")

end
