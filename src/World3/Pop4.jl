module Pop4

using ModelingToolkit
using WorldDynamics

include("population/common_pop/tables.jl")
include("population/common_pop/parameters.jl")
include("population/common_pop/initialisations.jl")
include("population/CommonPop.jl")

include("population/pop4/tables.jl")
include("population/pop4/initialisations.jl")
include("population/pop4/subsystems.jl")
include("population/pop4/scenarios.jl")
include("population/pop4/plots.jl")

end
