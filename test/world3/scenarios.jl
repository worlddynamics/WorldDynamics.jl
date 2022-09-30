using WorldDynamics, Test, ModelingToolkit

@testset "World3" begin
    @test isa(World3.Agriculture.historicalrun(), ModelingToolkit.ODESystem)
    @test isa(World3.Capital.historicalrun(), ModelingToolkit.ODESystem)
    @test isa(World3.Pollution.historicalrun(), ModelingToolkit.ODESystem)
    @test isa(World3.NonRenewable.historicalrun(), ModelingToolkit.ODESystem)
    @test isa(World3.Pop1.historicalrun(), ModelingToolkit.ODESystem)
    @test isa(World3.Pop4.historicalrun(), ModelingToolkit.ODESystem)
    @test isa(World3.Pop15.historicalrun(), ModelingToolkit.ODESystem)
    @test isa(World3.historicalrun(), ModelingToolkit.ODESystem)
end
