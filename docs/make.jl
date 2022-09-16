using Documenter

push!(LOAD_PATH, "../src/")
using WorldDynamics

makedocs(sitename="WorldDynamics.jl",
    modules=[WorldDynamics],
    pages=[
        "Home" => "index.md",
        "WorldDynamics tutorial" => "tutorial.md",
        "World 3 equations, variables, and parameters" => "world3.md",
        "Source code documentation" => "source.md"
    ]
)
