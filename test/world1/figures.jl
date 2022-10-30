using WorldDynamics, Test, PlotlyJS

@testset "World1" begin
    @test isa(World1.fig_std(), PlotlyJS.SyncPlot)
    @test isa(World1.fig_1(), PlotlyJS.SyncPlot)
    @test isa(World1.fig_2(), PlotlyJS.SyncPlot)
    @test isa(World1.fig_3(), PlotlyJS.SyncPlot)
    @test isa(World1.fig_4(), PlotlyJS.SyncPlot)
    @test isa(World1.fig_5(), PlotlyJS.SyncPlot)
    @test isa(World1.fig_6(), PlotlyJS.SyncPlot)
    @test isa(World1.fig_7(), PlotlyJS.SyncPlot)
    @test isa(World1.fig_8(), PlotlyJS.SyncPlot)
    @test isa(World1.fig_9(), PlotlyJS.SyncPlot)
    @test isa(World1.fig_10(), PlotlyJS.SyncPlot)
    @test isa(World1.fig_11(), PlotlyJS.SyncPlot)
    @test isa(World1.fig_12(), PlotlyJS.SyncPlot)
end
