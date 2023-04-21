module Wellbeing

using WorldDynamics
using ModelingToolkit

include("wellbeing/tables.jl")
include("wellbeing/parameters.jl")
include("wellbeing/initialisations.jl")
include("wellbeing/subsystems.jl")
include("wellbeing/scenarios.jl")
include("wellbeing/plots.jl")

end
