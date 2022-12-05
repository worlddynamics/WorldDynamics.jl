function vensim_run(; kwargs...)
    @named pop = population(; kwargs...)

    systems = [pop]

    connection_eqs::Vector{Symbolics.Equation} = []

    return WorldDynamics.compose(systems, connection_eqs)
end
