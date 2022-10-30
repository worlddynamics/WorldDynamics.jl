_inits = Dict{Symbol, Float64}(
    :pop => 1.65e9,
    :nr => 900e9,
    :ci => 0.4e9,
    :pol => 0.2e9,
    :ciaf => 0.3,
)

getinitialisations() = copy(_inits)
