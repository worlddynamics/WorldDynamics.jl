using WorldDynamics
using ModelingToolkit

function solveagriculture()
    @named pop = WorldDynamics.World3.Agriculture.population()
    @named io = WorldDynamics.World3.Agriculture.industrial_output()
    @named pp = WorldDynamics.World3.Agriculture.persistent_pollution()
    @named ld = WorldDynamics.World3.Agriculture.land_development()
    @named ai = WorldDynamics.World3.Agriculture.agricultural_inputs()
    @named iad = WorldDynamics.World3.Agriculture.investment_allocation_decision()
    @named leuiu = WorldDynamics.World3.Agriculture.land_erosion_urban_industrial_use()
    @named dlm = WorldDynamics.World3.Agriculture.discontinung_land_maintenance()
    @named lfr = WorldDynamics.World3.Agriculture.land_fertility_regeneration()
    @named lfd = WorldDynamics.World3.Agriculture.land_fertility_degradation()

    systems = [pop, io, pp, ld, ai, iad, leuiu, dlm, lfr, lfd]

    connection_eqs = [
        ld.ler ~ leuiu.ler
        ld.lrui ~ leuiu.lrui
        ld.ly ~ ai.ly
        ld.pop ~ pop.pop
        ld.iopc ~ io.iopc
        ld.io ~ io.io
        ld.fiald ~ iad.fiald
        ai.tai ~ ld.tai
        ai.fiald ~ iad.fiald
        ai.falm ~ dlm.falm
        ai.al ~ ld.al
        ai.lfert ~ lfd.lfert
        ai.io ~ io.io
        iad.ly ~ ai.ly
        iad.dcph ~ ld.dcph
        iad.alai ~ ai.alai
        iad.lymc ~ ai.lymc
        iad.aiph ~ ai.aiph
        leuiu.ly ~ ai.ly
        leuiu.al ~ ld.al
        leuiu.iopc ~ io.iopc
        leuiu.pop ~ pop.pop
        dlm.fpc ~ ld.fpc
        lfr.lfert ~ lfd.lfert
        lfr.falm ~ dlm.falm
        lfd.lfr ~ lfr.lfr
        lfd.ppolx ~ pp.ppolx
        io.pop ~ pop.pop
    ]

    return WorldDynamics.solvesystems(systems, connection_eqs, (1900.0, 1970.0))
end
