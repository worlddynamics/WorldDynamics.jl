module WorldDynamics

include("plotvariables.jl")
include("solvesystems.jl")

export plotvariables

module World3

include("World3/Agriculture.jl")
include("World3/Capital.jl")
include("World3/NonRenewable.jl")
include("World3/Pollution.jl")
include("World3/Pop1.jl")
include("World3/Pop4.jl")
include("World3/Pop15.jl")
include("World3/SupplementaryEquations.jl")

end

module World2

include("World2/AgricultureInvestment.jl")
include("World2/CapitalInvestment.jl")
include("World2/NaturalResources.jl")
include("World2/Pollution.jl")
include("World2/Population.jl")
include("World2/QualityLife.jl")

end

end
