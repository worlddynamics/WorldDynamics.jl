using WorldDynamics
using ModelingToolkit

function solvepollution()
    @named pop = WorldDynamics.World3.Pollution.population()
    @named nr = WorldDynamics.World3.Pollution.non_renewable()
    @named ag = WorldDynamics.World3.Pollution.agriculture()
    @named pd = WorldDynamics.World3.Pollution.pollution_damage()
    @named atcc = WorldDynamics.World3.Pollution.adaptive_technological_control_cards()
    @named pp = WorldDynamics.World3.Pollution.persistent_pollution()

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

    return WorldDynamics.solvesystems(systems, connection_eqs, (1900.0, 1970.0))
end
