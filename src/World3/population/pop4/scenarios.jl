function historicalrun(; kwargs...)
    @named pop = population(; kwargs...)
    @named dr = death_rate(; kwargs...)
    @named br = birth_rate(; kwargs...)
    @named io = industrial_output(; kwargs...)
    @named so = service_output(; kwargs...)
    @named pp = persistent_pollution(; kwargs...)
    @named f  = food(; kwargs...)

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

    return compose(systems, connection_eqs)
end
