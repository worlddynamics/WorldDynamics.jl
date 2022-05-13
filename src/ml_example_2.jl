using ModelingToolkit, Plots, DifferentialEquations, LinearAlgebra
using Symbolics: scalarize

@variables t
D = Differential(t)

function Mass(; name, m=1.0, xy=[0.0, 0.0], u=[0.0, 0.0])
    ps = @parameters m = m
    sts = @variables pos[1:2](t) = xy v[1:2](t) = u
    eqs = scalarize(D.(pos) .~ v)
    ODESystem(eqs, t, [pos..., v...], ps; name)
end

function Spring(; name, k=1e4, l=1.0)
    ps = @parameters k = k l = l
    @variables x(t), dir[1:2](t)
    ODESystem(Equation[], t, [x, dir...], ps; name)
end

function connect_spring(spring, a, b)
    [
        spring.x ~ norm(scalarize(a .- b))
        scalarize(spring.dir .~ scalarize(a .- b))
    ]
end

spring_force(spring) = -spring.k .* scalarize(spring.dir) .* (spring.x - spring.l) ./ spring.x

m = 1.0
xy = [1.0, -1.0]
k = 1e4
l = 1.0
center = [0.0, 0.0]
g = [0.0, -9.81]
@named mass = Mass(m=m, xy=xy)
@named spring = Spring(k=k, l=l)

eqs = [
    connect_spring(spring, mass.pos, center)
    scalarize(D.(mass.v) .~ spring_force(spring) / mass.m .+ g)
]

@named _model = ODESystem(eqs, t, [spring.x; spring.dir; mass.pos], [])
@named model = compose(_model, mass, spring)
sys = structural_simplify(model)

prob = ODEProblem(sys, [], (0.0, 3.0))
sol = solve(prob, Rosenbrock23())
plot(sol)