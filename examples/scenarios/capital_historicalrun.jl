using WorldDynamics
using ModelingToolkit

function capital_historicalrun()
    @named pop = WorldDynamics.World3.Capital.population()
    @named nr = WorldDynamics.World3.Capital.non_renewable()
    @named ag = WorldDynamics.World3.Capital.agriculture()
    @named is = WorldDynamics.World3.Capital.industrial_subsector()
    @named ss = WorldDynamics.World3.Capital.service_subsector()
    @named js = WorldDynamics.World3.Capital.job_subsector()

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

    return WorldDynamics.solvesystems(systems, connection_eqs, (1900, 1970.0))
end
