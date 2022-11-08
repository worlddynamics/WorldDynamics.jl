using WorldDynamics, Test, ModelingToolkit

@testset "World1B" begin
    @test isa(World1B.standard_run(), ModelingToolkit.ODESystem)
end
