using WorldDynamics, Test, PlotlyJS

@testset "World2" begin
    @test isa(World2.fig_1(), PlotlyJS.SyncPlot)
end
