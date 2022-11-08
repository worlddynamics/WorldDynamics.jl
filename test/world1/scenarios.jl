using WorldDynamics, Test, ModelingToolkit

@testset "World1" begin
    @test isa(World1.standard_run(), ModelingToolkit.ODESystem)
end
