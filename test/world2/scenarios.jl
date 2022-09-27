using WorldDynamics, Test, ModelingToolkit

@testset "World2" begin
    @test isa(World2.natural_resource_depletion(), ModelingToolkit.ODESystem)
end
