module World3

using ModelingToolkit
using WorldDynamics

include("Agriculture.jl")
include("Capital.jl")
include("NonRenewable.jl")
include("Pollution.jl")
include("Pop1.jl")
include("Pop4.jl")
include("Pop15.jl")
include("SupplementaryEquations.jl")

include("world3/scenarios.jl")
include("world3/plots.jl")

end
