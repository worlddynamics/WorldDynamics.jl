include("../../src/NonRenewable.jl")
include("../../src/solvesystems.jl")


function solvenonrenewable()
    @named pop = NonRenewable.population()
    @named io = NonRenewable.industrial_output()
    @named ic = NonRenewable.industrial_capital()
    @named nr = NonRenewable.non_renewable()

    systems = [pop, io, ic, nr]

    connection_eqs = [
        nr.pop ~ pop.pop
        nr.iopc ~ io.iopc
        io.ic ~ ic.ic
        io.fcaor ~ nr.fcaor
        io.pop ~ pop.pop
        ic.io ~ io.io
    ]

    return solvesystems(systems, connection_eqs, (1900.0, 2100.0))
end
