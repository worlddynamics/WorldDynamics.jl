using WorldDynamics, Test, PlotlyJS

@testset verbose=true "World3-91" begin

    @testset "Standard runs" begin
        @test isa(World3_91.fig_scenario1a(), PlotlyJS.SyncPlot)
        @test isa(World3_91.fig_scenario1b(), PlotlyJS.SyncPlot)
        @test isa(World3_91.fig_scenario2a(), PlotlyJS.SyncPlot)
        @test isa(World3_91.fig_scenario2b(), PlotlyJS.SyncPlot)
    end

end
