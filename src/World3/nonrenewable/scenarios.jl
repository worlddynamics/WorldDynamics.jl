function historicalrun(; kwargs...)
    @named pop = population(; kwargs...)
    @named io = industrial_output(; kwargs...)
    @named ic = industrial_capital(; kwargs...)
    @named nr = non_renewable(; kwargs...)

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
