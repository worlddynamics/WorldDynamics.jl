using WorldDynamics
using ModelingToolkit

function nonrenewable_historicalrun()
    @named pop = WorldDynamics.World3.NonRenewable.population()
    @named io = WorldDynamics.World3.NonRenewable.industrial_output()
    @named ic = WorldDynamics.World3.NonRenewable.industrial_capital()
    @named nr = WorldDynamics.World3.NonRenewable.non_renewable()

    systems = [pop, io, ic, nr]

    connection_eqs = [
        nr.pop ~ pop.pop
        nr.iopc ~ io.iopc
        io.ic ~ ic.ic
        io.fcaor ~ nr.fcaor
        io.pop ~ pop.pop
        ic.io ~ io.io
    ]

    return WorldDynamics.solvesystems(systems, connection_eqs, (1900.0, 2100.0))
end
