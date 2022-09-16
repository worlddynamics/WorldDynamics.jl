using Documenter, WorldDynamics

makedocs(sitename="WorldDynamics.jl",
    modules=[WorldDynamics],
    pages=[
        "Home" => "index.md",
        "WorldDynamics tutorial" => "tutorial.md",
        "World3 equations and constants" => "world3.md",
        "Source code documentation" => "source.md"
    ]
)

deploydocs(
    repo = "github.com/natema/WorldDynamics.jl.git",
)
