using ModelingToolkit, Plots, DifferentialEquations

@variables t
D = Differential(t)

function foo(g; name)
    @variables f(t)
    eqs = [D(f) ~ g(t)]
    ODESystem(eqs; name)
end

function empty(; name)
    @variables f(t)
    ODESystem(Equation[], t, [f], []; name)
end

@named foo1 = foo(t -> t * sin(t))
@named foo2 = foo(t -> 1.2t)
@named foo_tot = empty()

connections = [foo_tot.f ~ foo1.f + foo2.f]

connected = compose(ODESystem(connections, name=:connected), foo_tot, foo1, foo2)
equations(connected)
connected_simp = structural_simplify(connected)
equations(connected_simp)
observed(connected_simp)

sol = solve(ODEProblem(connected_simp, ones(2), (0, 10)))
plot(sol, vars=[foo_tot.f, foo1.f, foo2.f])