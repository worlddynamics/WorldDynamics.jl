function historicalrun(; kwargs...)
    @named pop = population(; kwargs...)
    @named io = industrial_output(; kwargs...)
    @named pp = persistent_pollution(; kwargs...)
    @named ld = land_development(; kwargs...)
    @named ai = agricultural_inputs(; kwargs...)
    @named iad = investment_allocation_decision(; kwargs...)
    @named leuiu = land_erosion_urban_industrial_use(; kwargs...)
    @named dlm = discontinuing_land_maintenance(; kwargs...)
    @named lfr = land_fertility_regeneration(; kwargs...)
    @named lfd = land_fertility_degradation(; kwargs...)

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

    return WorldDynamics.compose(systems, connection_eqs)
end
