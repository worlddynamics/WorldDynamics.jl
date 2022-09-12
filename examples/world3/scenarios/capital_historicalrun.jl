using WorldDynamics
using ModelingToolkit

function capital_historicalrun(; kwargs...)
    @named pop = WorldDynamics.World3.Capital.population(; kwargs...)
    @named nr = WorldDynamics.World3.Capital.non_renewable(; kwargs...)
    @named ag = WorldDynamics.World3.Capital.agriculture(; kwargs...)
    @named is = WorldDynamics.World3.Capital.industrial_subsector(; kwargs...)
    @named ss = WorldDynamics.World3.Capital.service_subsector(; kwargs...)
    @named js = WorldDynamics.World3.Capital.job_subsector(; kwargs...)

    systems = [pop, nr, ag, is, ss, js]

    connection_eqs = [
        is.pop ~ pop.pop
        is.fcaor ~ nr.fcaor
        is.cuf ~ js.cuf
        is.fioaa ~ ag.fioaa
        is.fioas ~ ss.fioas
        ss.iopc ~ is.iopc
        ss.io ~ is.io
        ss.cuf ~ js.cuf
        ss.pop ~ pop.pop
        js.ic ~ is.ic
        js.iopc ~ is.iopc
        js.sc ~ ss.sc
        js.sopc ~ ss.sopc
        js.al ~ ag.al
        js.aiph ~ ag.aiph
        js.p2 ~ pop.p2
        js.p3 ~ pop.p3
    ]

    return WorldDynamics.compose(systems, connection_eqs)
end
