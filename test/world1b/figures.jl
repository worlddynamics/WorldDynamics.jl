using WorldDynamics, Test, PlotlyJS

@testset "World1B" begin
    @test isa(World1B.fig_std(), PlotlyJS.SyncPlot)
end
