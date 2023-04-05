using WorldDynamics, Test

@testset verbose = true "WorldDynamics.jl" begin

    @testset verbose = true "Scenarios" begin
        include("world2/scenarios.jl")
        include("world3/scenarios.jl")
        include("world3_91/scenarios.jl")
    end

    @testset verbose = true "Figures" begin
        include("world2/figures.jl")
        include("world3/figures.jl")
        include("world3_91/figures.jl")
    end

    include("solvesystems.jl")
end
