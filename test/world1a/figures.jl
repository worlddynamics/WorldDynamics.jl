using WorldDynamics, Test, PlotlyJS

@testset "World1A" begin
    @test isa(World1A.fig_std(), PlotlyJS.SyncPlot)
end
