using Test, ModelingToolkit, DifferentialEquations
@testset verbose = true "variable_connections" begin
    @variables t x(t) y(t) z(t) w(t) u(t) v(t)
    D = Differential(t)

    eqs1 = [D(x) ~ x - x * y
        D(y) ~ y + x * z]

    eqs2 = [D(z) ~ z + 3
        D(w) ~ w + 2 * z]

    eqs3 = [D(x) ~ x - x * y
        D(y) ~ y + x * x]

    eqs4 = [D(u) ~ x - u * v
        v ~ z * u]

    @named sys1 = ODESystem(eqs1, t)
    @named sys2 = ODESystem(eqs2, t)
    @named sys3 = ODESystem(eqs3, t)
    @named sys4 = ODESystem(eqs4, t)

    @test WorldDynamics.variable_connections([sys1, sys2]) == [sys1.z ~ sys2.z]
    @test WorldDynamics.variable_connections([sys1, sys2, sys4]) == [sys4.z ~ sys2.z, sys1.z ~ sys2.z, sys4.x ~ sys1.x, ]
    output = WorldDynamics.variable_connections([sys2, sys3])
    @test isempty(output)
end