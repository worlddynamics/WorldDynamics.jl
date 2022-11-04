using WorldDynamics, Test, ModelingToolkit

@testset "World1A" begin
    @test isa(World1A.standard_run(), ModelingToolkit.ODESystem)
end
