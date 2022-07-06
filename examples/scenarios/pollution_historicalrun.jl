using WorldDynamics
using ModelingToolkit

function pollution_historicalrun(; kwargs...)
    @named pop = WorldDynamics.World3.Pollution.population(; kwargs...)
    @named nr = WorldDynamics.World3.Pollution.non_renewable(; kwargs...)
    @named ag = WorldDynamics.World3.Pollution.agriculture(; kwargs...)
    @named pd = WorldDynamics.World3.Pollution.pollution_damage(; kwargs...)
    @named atcc = WorldDynamics.World3.Pollution.adaptive_technological_control_cards(; kwargs...)
    @named pp = WorldDynamics.World3.Pollution.persistent_pollution(; kwargs...)

    systems = [pop, nr, ag, pd, atcc, pp]

    connection_eqs = [
        pd.ppolx ~ pp.ppolx
        atcc.lmp ~ pd.lmp
        pp.ppgf22 ~ atcc.ppgf22
        pp.pcrum ~ nr.pcrum
        pp.pop ~ pop.pop
        pp.aiph ~ ag.aiph
        pp.al ~ ag.al
    ]

    return WorldDynamics.compose(systems, connection_eqs)
end
