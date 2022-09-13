# WorldDynamics.jl Documentation

# To be used in VSCode
# push!(LOAD_PATH, "./src/") 
# To be used in REPL with working directory WorldDynamics.jl
push!(LOAD_PATH, "src/")
# include("src/WorldDynamics.jl")
# include("docs/make.jl")

using Documenter, Main.WorldDynamics

makedocs(sitename="WorldDynamics.jl",
    modules=[WorldDynamics],
    pages=["WorldDynamics documentation" => "index.md"])