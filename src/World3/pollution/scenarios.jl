function historicalrun(; kwargs...)
    @named pop = population(; kwargs...)
    @named nr = non_renewable(; kwargs...)
    @named ag = agriculture(; kwargs...)
    @named pd = pollution_damage(; kwargs...)
    @named atcc = adaptive_technological_control_cards(; kwargs...)
    @named pp = persistent_pollution(; kwargs...)

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

    return compose(systems, connection_eqs)
end
