module NonRenewable

using ModelingToolkit
using WorldDynamics

include("nonrenewable/tables.jl")
include("nonrenewable/parameters.jl")
include("nonrenewable/initialisations.jl")
include("nonrenewable/subsystems.jl")
include("nonrenewable/scenarios.jl")
include("nonrenewable/plots.jl")

end
