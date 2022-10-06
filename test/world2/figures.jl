using WorldDynamics, Test, PlotlyJS

@testset verbose=true "World2" begin

    @testset "Limits to Growth" begin
        @test isa(World2.fig_1(), PlotlyJS.SyncPlot)
        @test isa(World2.fig_2(), PlotlyJS.SyncPlot)
        @test isa(World2.fig_3(), PlotlyJS.SyncPlot)
        @test isa(World2.fig_4(), PlotlyJS.SyncPlot)
        @test isa(World2.fig_5(), PlotlyJS.SyncPlot)
        @test isa(World2.fig_6(), PlotlyJS.SyncPlot)
        @test isa(World2.fig_7(), PlotlyJS.SyncPlot)
        @test isa(World2.fig_8(), PlotlyJS.SyncPlot)
        @test isa(World2.fig_9(), PlotlyJS.SyncPlot)
        @test isa(World2.fig_10(), PlotlyJS.SyncPlot)
        @test isa(World2.fig_11(), PlotlyJS.SyncPlot)
        @test isa(World2.fig_12(), PlotlyJS.SyncPlot)
    end

end
