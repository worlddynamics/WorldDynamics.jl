include("../../src/Pollution.jl")
include("../../src/solvesystems.jl")


function solvepollution()
    @named pop = Pollution.population()
    @named nr = Pollution.non_renewable()
    @named ag = Pollution.agriculture()
    @named pd = Pollution.pollution_damage()
    @named atcc = Pollution.adaptive_technological_control_cards()
    @named pp = Pollution.persistent_pollution()

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

    return solvesystems(systems, connection_eqs, (1900.0, 1970.0))
end
