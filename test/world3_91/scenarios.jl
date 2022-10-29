using WorldDynamics, Test, ModelingToolkit

@testset "World3-91" begin
    @test isa(World3_91.scenario1(), ModelingToolkit.ODESystem)
end
