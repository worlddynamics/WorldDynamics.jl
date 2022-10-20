using WorldDynamics, Test, ModelingToolkit

@testset "World3-03" begin
    @test isa(World3_03.scenario1(), ModelingToolkit.ODESystem)
end
