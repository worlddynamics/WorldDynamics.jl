include("../../src/Pop1.jl")
include("../../src/solvesystems.jl")


function solvepop1()
    @named pop = Pop1.population()
    @named dr = Pop1.death_rate()
    @named br = Pop1.birth_rate()
    @named io = Pop1.industrial_output()
    @named so = Pop1.service_output()
    @named pp = Pop1.persistent_pollution()
    @named f  = Pop1.food()

    systems = [pop, dr, br, io, so, pp, f]

    connection_eqs = [
        pop.le ~ dr.le
        pop.tf ~ br.tf
        dr.fpc ~ f.fpc
        dr.sopc ~ so.sopc
        dr.iopc ~ io.iopc
        dr.ppolx ~ pp.ppolx
        br.le ~ dr.le
        br.iopc ~ io.iopc
        br.sopc ~ so.sopc
        dr.dr ~ pop.dr
        dr.pop ~ pop.pop
        br.br ~ pop.br
        br.pop ~ pop.pop
        io.pop ~ pop.pop
        so.pop ~ pop.pop
        f.pop ~ pop.pop
    ]

    return solvesystems(systems, connection_eqs, (1900.0, 1970.0))
end
