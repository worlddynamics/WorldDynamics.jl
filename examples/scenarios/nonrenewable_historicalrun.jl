using WorldDynamics
using ModelingToolkit

function nonrenewable_historicalrun(; kwargs...)
    @named pop = WorldDynamics.World3.NonRenewable.population(; kwargs...)
    @named io = WorldDynamics.World3.NonRenewable.industrial_output(; kwargs...)
    @named ic = WorldDynamics.World3.NonRenewable.industrial_capital(; kwargs...)
    @named nr = WorldDynamics.World3.NonRenewable.non_renewable(; kwargs...)

    systems = [pop, io, ic, nr]

    connection_eqs = [
        nr.pop ~ pop.pop
        nr.iopc ~ io.iopc
        io.ic ~ ic.ic
        io.fcaor ~ nr.fcaor
        io.pop ~ pop.pop
        ic.io ~ io.io
    ]

    return WorldDynamics.compose(systems, connection_eqs)
end
