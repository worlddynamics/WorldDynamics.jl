module Population


using Interpolations, ModelingToolkit

include("population/Pop4.jl")


population = Pop4.population
death_rate = Pop4.death_rate
birth_rate = Pop4.birth_rate


end # module