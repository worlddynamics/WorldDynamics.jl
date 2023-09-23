using WorldDynamics, Test

@testset verbose=true "Functions" begin
    include("functions.jl")
end

@testset verbose=true "World3_03" begin
    include("world3_03.jl")
end
