module Duggan

using ModelingToolkit
using WorldDynamics

include("functions.jl")
include("solvesystems.jl")

include("Capital.jl")
include("Resource.jl")

include("duggan/scenarios.jl")
include("duggan/solutions.jl")
include("duggan/plots.jl")

end
