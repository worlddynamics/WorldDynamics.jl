using ModelingToolkit, DifferentialEquations

include("../common_pop/CommonPop.jl")
include("Pop1.jl")


function solvepop1()
    @named pop = Pop1.population()

    @named dr = CommonPop.death_rate()
    @named br = CommonPop.birth_rate()

    @named io = CommonPop.industrial_output()
    @named so = CommonPop.service_output()
    @named pp = CommonPop.persistent_pollution()
    @named f  = CommonPop.food()

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
