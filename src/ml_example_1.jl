using ModelingToolkit, Plots, DifferentialEquations

@variables t
D = Differential(t)

function fol_factory(separate=false; name)
    @parameters τ
    @variables x(t) f(t) RHS(t)
    eqs = separate ? [RHS ~ (f - x) / τ, D(x) ~ RHS] : D(x) ~ (f - x) / τ
    ODESystem(eqs; name)
end

@named fol_1 = fol_factory()
@named fol_2 = fol_factory(true)

connections = [fol_1.f ~ 1.5, fol_2.f ~ fol_1.x]

connected = compose(ODESystem(connections, name=:connected), fol_1, fol_2)
connected_simp = structural_simplify(connected)
equations(connected_simp)

u0 = [fol_1.x => -0.5, fol_2.x => 1.0]
p = [fol_1.τ => 2.0, fol_2.τ => 4.0]
prob = ODEProblem(connected_simp, u0, (0.0, 10.0), p)
plot(solve(prob))