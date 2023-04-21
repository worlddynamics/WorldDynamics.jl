module Earth4All

using ModelingToolkit
using WorldDynamics

include("Wellbeing.jl")
include("Population.jl")
include("Finance.jl")
include("Public.jl")

include("earth4all/scenarios.jl")
include("earth4all/plots.jl")

end
