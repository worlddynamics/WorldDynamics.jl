using Documenter, WorldDynamics

makedocs(sitename="WorldDynamics.jl",
    modules=[WorldDynamics],
    pages=[
        "Home" => "index.md",
        "WorldDynamics tutorial" => "tutorial.md",
        "World 2 equations, variables, and parameters" => "world2.md",
        "World 3 equations, variables, and parameters" => "world3.md",
        "Source code documentation" => "source.md",
    ]
)

deploydocs(
    repo = "github.com/worlddynamics/WorldDynamics.jl.git",
)
