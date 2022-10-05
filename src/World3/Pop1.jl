module Pop1

using ModelingToolkit
using WorldDynamics

include("population/common_pop/tables.jl")
include("population/common_pop/parameters.jl")
include("population/common_pop/initialisations.jl")
include("population/CommonPop.jl")

include("population/pop1/tables.jl")
include("population/pop1/parameters.jl")
include("population/pop1/initialisations.jl")
include("population/pop1/subsystems.jl")
include("population/pop1/scenarios.jl")
include("population/pop1/plots.jl")

end
