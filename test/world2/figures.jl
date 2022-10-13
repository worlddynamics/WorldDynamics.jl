using WorldDynamics, Test, PlotlyJS

@testset verbose=true "World2" begin

    @testset "Chapter 4" begin
        @test isa(World2.fig_4_1(), PlotlyJS.SyncPlot)
        @test isa(World2.fig_4_2(), PlotlyJS.SyncPlot)
        @test isa(World2.fig_4_3(), PlotlyJS.SyncPlot)
        @test isa(World2.fig_4_4(), PlotlyJS.SyncPlot)
        @test isa(World2.fig_4_5(), PlotlyJS.SyncPlot)
        @test isa(World2.fig_4_6(), PlotlyJS.SyncPlot)
        @test isa(World2.fig_4_7(), PlotlyJS.SyncPlot)
        @test isa(World2.fig_4_8(), PlotlyJS.SyncPlot)
        @test isa(World2.fig_4_9(), PlotlyJS.SyncPlot)
        @test isa(World2.fig_4_10(), PlotlyJS.SyncPlot)
        @test isa(World2.fig_4_11(), PlotlyJS.SyncPlot)
        @test isa(World2.fig_4_12(), PlotlyJS.SyncPlot)
    end

    @testset "Chapter 5" begin
        @test isa(World2.fig_5_1(), PlotlyJS.SyncPlot)
        @test isa(World2.fig_5_2(), PlotlyJS.SyncPlot)
        @test isa(World2.fig_5_3(), PlotlyJS.SyncPlot)
        @test isa(World2.fig_5_4(), PlotlyJS.SyncPlot)
        @test isa(World2.fig_5_5(), PlotlyJS.SyncPlot)
        @test isa(World2.fig_5_6(), PlotlyJS.SyncPlot)
        @test isa(World2.fig_5_7(), PlotlyJS.SyncPlot)
        @test isa(World2.fig_5_8(), PlotlyJS.SyncPlot)
        @test isa(World2.fig_5_9(), PlotlyJS.SyncPlot)
        @test isa(World2.fig_5_10(), PlotlyJS.SyncPlot)
        @test isa(World2.fig_5_11(), PlotlyJS.SyncPlot)
        @test isa(World2.fig_5_12(), PlotlyJS.SyncPlot)
        @test isa(World2.fig_5_13(), PlotlyJS.SyncPlot)
        @test isa(World2.fig_5_14(), PlotlyJS.SyncPlot)
    end

    @testset "Chapter 6" begin
        @test isa(World2.fig_6_1(), PlotlyJS.SyncPlot)
    end

end
