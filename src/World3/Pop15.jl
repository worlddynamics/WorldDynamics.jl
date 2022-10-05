module Pop15

using ModelingToolkit
using WorldDynamics

include("population/common_pop/tables.jl")
include("population/common_pop/parameters.jl")
include("population/common_pop/initialisations.jl")
include("population/CommonPop.jl")

include("population/pop15/tables.jl")
include("population/pop15/initialisations.jl")
include("population/pop15/subsystems.jl")
include("population/pop15/scenarios.jl")
include("population/pop15/plots.jl")

end
