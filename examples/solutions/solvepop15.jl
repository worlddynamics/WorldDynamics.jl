include("../../src/Pop15.jl")
include("../../src/solvesystems.jl")


function solvepop15()
    @named pop = Pop15.population()
    @named dr = Pop15.death_rate()
    @named br = Pop15.birth_rate()
    @named io = Pop15.industrial_output()
    @named so = Pop15.service_output()
    @named pp = Pop15.persistent_pollution()
    @named f  = Pop15.food()

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
