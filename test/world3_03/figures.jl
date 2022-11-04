using WorldDynamics, Test, PlotlyJS

@testset verbose=true "World3-03" begin

    @testset "Standard runs" begin
        @test isa(World3_03.fig_scenario1a(), PlotlyJS.SyncPlot)
        @test isa(World3_03.fig_scenario1b(), PlotlyJS.SyncPlot)
        @test isa(World3_03.fig_scenario1c(), PlotlyJS.SyncPlot)
    end

end
