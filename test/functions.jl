using WorldDynamics, Test

@testset verbose=true "Interpolate interval" begin
    @test WorldDynamics.interpolate(-1.1, (1.0, 2.0, 3.0), (-1.0, 1.0)) == 1
    @test WorldDynamics.interpolate(-1.0, (1.0, 2.0, 3.0), (-1.0, 1.0)) == 1
    @test WorldDynamics.interpolate(-0.5, (1.0, 2.0, 3.0), (-1.0, 1.0)) == 1.5
    @test WorldDynamics.interpolate(0.0, (1.0, 2.0, 3.0), (-1.0, 1.0)) == 2
    @test WorldDynamics.interpolate(0.5, (1.0, 2.0, 3.0), (-1.0, 1.0)) == 2.5
    @test WorldDynamics.interpolate(1.0, (1.0, 2.0, 3.0), (-1.0, 1.0)) == 3
    @test WorldDynamics.interpolate(1.1, (1.0, 2.0, 3.0), (-1.0, 1.0)) == 3
end

@testset verbose=true "Interpolate single value" begin
    @test WorldDynamics.interpolate(-1.1, -1, 1, -1, 1) == -1.1
    @test WorldDynamics.interpolate(-1, -1, 1, -1, 1) == -1
    @test WorldDynamics.interpolate(0, -1, 1, -1, 1) == 0
    @test WorldDynamics.interpolate(1, -1, 1, -1, 1) == 1
    @test WorldDynamics.interpolate(1.1, -1, 1, -1, 1) == 1.1
end

@testset verbose=true "Clip" begin
    @test WorldDynamics.clip(1.0, -1.0, -1.0, 0.0) == -1.0
    @test WorldDynamics.clip(1.0, -1.0, 0.0, 0.0) == 1.0
    @test WorldDynamics.clip(1.0, -1.0, 1.0, 0.0) == 1.0
end

@testset verbose=true "Step" begin
    @test WorldDynamics.step(-1.0, 1.0, 0.0) == 0.0
    @test WorldDynamics.step(0.0, 1.0, 0.0) == 1.0
    @test WorldDynamics.step(1.0, 1.0, 0.0) == 1.0
end

@testset verbose=true "Switch" begin
    @test WorldDynamics.switch(1.0, -1.0, 0) == 1
    @test WorldDynamics.switch(1.0, -1.0, 0.0) == 1
    @test WorldDynamics.switch(1.0, -1.0, 0.1) == -1
    @test WorldDynamics.switch(1.0, -1.0, 1e-15) == -1
    @test WorldDynamics.switch(1.0, -1.0, 1e-16) == 1
end
