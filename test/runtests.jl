using WorldDynamics, Test

@testset verbose=true "WorldDynamics.jl" begin

    @testset verbose=true "Scenarios" begin
        include("world1/scenarios.jl")
        include("world1a/scenarios.jl")
        include("world1b/scenarios.jl")
        include("world2/scenarios.jl")
        include("world3/scenarios.jl")
        include("world3_91/scenarios.jl")
        include("world3_03/scenarios.jl")
    end

    @testset verbose=true "Figures" begin
        include("world1/figures.jl")
        include("world1a/figures.jl")
        include("world1b/figures.jl")
        include("world2/figures.jl")
        include("world3/figures.jl")
        include("world3_91/figures.jl")
        include("world3_03/figures.jl")
    end

end
