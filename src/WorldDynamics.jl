module WorldDynamics

include("functions.jl")
include("plotvariables.jl")
include("solvesystems.jl")

export interpolate, plotvariables

include("World2/World2.jl")
include("World3/World3.jl")

export World2
export World3

end
