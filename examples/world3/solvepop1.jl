using ModelingToolkit, DifferentialEquations

include("../../src/Pop1.jl")


function solvepop1()
    @named pop = Pop1.population()

    @named dr = Pop1.death_rate()
    @named br = Pop1.birth_rate()

    @named io = Pop1.industrial_output()
    @named so = Pop1.service_output()
    @named pp = Pop1.persistent_pollution()
    @named f  = Pop1.food()

    connection_eqs = [
        # pop1
        pop.le ~ dr.le
        pop.tf ~ br.tf
        # common pop
        dr.fpc ~ f.fpc
        dr.sopc ~ so.sopc
        dr.iopc ~ io.iopc
        dr.ppolx ~ pp.ppolx
        br.le ~ dr.le
        br.iopc ~ io.iopc
        br.sopc ~ so.sopc
        # pop1 + common pop
        dr.dr ~ pop.dr
        dr.pop ~ pop.pop
        br.br ~ pop.br
        br.pop ~ pop.pop
        io.pop ~ pop.pop
        so.pop ~ pop.pop
        f.pop ~ pop.pop
    ]

    @variables t

    @named _pop_model = ODESystem(connection_eqs, t)
    @named pop_model = compose(_pop_model, [pop, dr, br, io, so, pp, f])

    pop_sys = structural_simplify(pop_model)

    prob = ODEProblem(pop_sys, [], (1900.0, 1970.0))
    sol = solve(prob, Tsit5())

    return sol
end
