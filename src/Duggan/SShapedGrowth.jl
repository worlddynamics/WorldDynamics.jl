module SShapedGrowth

using WorldDynamics
using ModelingToolkit

include("sshapedgrowth/tables.jl")
include("sshapedgrowth/parameters.jl")
include("sshapedgrowth/initialisations.jl")
include("sshapedgrowth/subsystems.jl")
include("sshapedgrowth/scenarios.jl")
include("sshapedgrowth/plots.jl")

end
