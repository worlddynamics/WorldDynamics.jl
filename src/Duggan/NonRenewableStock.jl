module NonRenewableStock

using WorldDynamics
using ModelingToolkit

include("nonrenewablestock/tables.jl")
include("nonrenewablestock/parameters.jl")
include("nonrenewablestock/initialisations.jl")
include("nonrenewablestock/subsystems.jl")
include("nonrenewablestock/scenarios.jl")
include("nonrenewablestock/plots.jl")

end
