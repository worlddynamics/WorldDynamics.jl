module AgricultureInvestment

using ModelingToolkit
using WorldDynamics

include("agricultureinvestment/tables.jl")
include("agricultureinvestment/parameters.jl")
include("agricultureinvestment/initialisations.jl")
include("agricultureinvestment/subsystems.jl")

end
