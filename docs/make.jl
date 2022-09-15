using Documenter

push!(LOAD_PATH, "../src/")
using WorldDynamics

makedocs(sitename="WorldDynamics Documentation",
    modules=[WorldDynamics],
    pages=["WorldDynamics tutorial" => "tutorial.md", "World3 equations and constants" => "world3.md", "Source code documentation" => "source.md"])
