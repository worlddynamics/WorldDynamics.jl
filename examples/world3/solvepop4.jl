using ModelingToolkit, DifferentialEquations

include("../../src/Pop4.jl")


function solvepop4()
    @named pop = Pop4.population()

    @named dr = Pop4.death_rate()
    @named br = Pop4.birth_rate()

    @named io = Pop4.industrial_output()
    @named so = Pop4.service_output()
    @named pp = Pop4.persistent_pollution()
    @named f  = Pop4.food()

    connection_eqs = [
        # pop4    
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
        # pop4 + common pop
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