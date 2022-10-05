module CapitalInvestment

using ModelingToolkit
using WorldDynamics

include("capitalinvestment/tables.jl")
include("capitalinvestment/parameters.jl")
include("capitalinvestment/initialisations.jl")
include("capitalinvestment/subsystems.jl")

end
