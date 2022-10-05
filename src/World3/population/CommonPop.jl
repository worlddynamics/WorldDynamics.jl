module CommonPop

using ModelingToolkit
using WorldDynamics

export death_rate, birth_rate

include("common_pop/tables.jl")
include("common_pop/parameters.jl")
include("common_pop/initialisations.jl")
include("common_pop/subsystems.jl")

end
