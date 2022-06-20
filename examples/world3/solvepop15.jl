using ModelingToolkit, DifferentialEquations

include("../../src/Pop15.jl")


function solvepop15()
    @named pop = Pop15.population()

    @named dr = Pop15.death_rate()
    @named br = Pop15.birth_rate()

    @named io = Pop15.industrial_output()
    @named so = Pop15.service_output()
    @named pp = Pop15.persistent_pollution()
    @named f  = Pop15.food()

    connection_eqs = [
        # pop15
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
        # pop15 + common pop
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

    prob = ODEProblem(pop_sys, [], (1900, 1970.0))
    sol = solve(prob, Tsit5())

    return sol
end
