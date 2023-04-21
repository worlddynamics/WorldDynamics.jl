function pop_run(; kwargs...)
    @named pop = population(; kwargs...)
    @named pop_sup = population_support(; kwargs...)

    systems = [
        pop, pop_sup
    ]

    connection_eqs = [
        pop.GDP ~ pop_sup.GDP
        pop.IPP ~ pop_sup.IPP
        pop.OW ~ pop_sup.OW
    ]

    return WorldDynamics.compose(systems, connection_eqs)
end
