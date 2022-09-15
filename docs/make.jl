using Documenter

push!(LOAD_PATH, "../src/")
using WorldDynamics

makedocs(sitename="WorldDynamics Documentation",
    modules=[WorldDynamics],
    pages=["WorldDynamics documentation" => "index.md"],
)
