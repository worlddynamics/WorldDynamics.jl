# The HTML page generator

Repository of the Julia code which generates the HTML pages corresponding to a model structured into systems and implemented by using WorldDynamics.jl. Each page contains two HTML tables with all the variables and the parameters of the corresponding system of model.

## An example 

### Setting up the environment

[Install Julia](https://julialang.org/) and clone this repository. After starting the Julia REPL in the repository folder, we can instantiate the environment by running
```jl
julia> using Pkg
julia> Pkg.activate(".")
julia> Pkg.instantiate()
```

### Implementing the Model

We implement the [model](https://worlddynamics.github.io/WorldDynamics.jl/stable/tutorial/#Implementing-a-new-model) implemented in the WorldDynamics tutorial and described in the third chapter of the book *System Dynamics Modeling with R* (2016), by Jim Duggan. Here, however, we split the model into two systems: `capital` and `resource`. For each system, we create four Julia files, corresponding to the variable initialisation values, the parameter values, the ODE system, amd the interpolation tables used by the ODE system. These four files are included within the `Capital.jl` file and within the `Resource.jl` file.

#### The capital system

The `initialisations.jl` file of the capital system is the following.

```
_inits = Dict{Symbol,Float64}(
    :CAPI => 5,
)
getinitialisations() = copy(_inits)
```

The `parameters.jl` file of the capital system is the following.

```
_params = Dict{Symbol,Float64}(
    :CPI => 2,
    :DERA => 0.05,
    :FPR => 0.12,
    :DGF => 0.07,
)
getparameters() = copy(_params)
```

The `subsystems.jl` file of the capital system is the following.

```
include("../functions.jl")

@variables t
D = Differential(t)

function capital_system(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @parameters CPI = params[:CPI] [description = "The Cost Per unit of Investment."]
    @parameters DERA = params[:DERA] [description = "The DEpreciation RAte."]
    @parameters FPR = params[:FPR] [description = "A fixed Fraction of Profits are Reinvested and available as capital funds."]
    @parameters DGF = params[:DGF] [description = "The Desired Growth Fraction is the initial target investment rate for capital, in order to stimulate growth."]
    @variables CAPI(t) = inits[:CAPI] [description = "The CAPItal stock provides the capability to extract the resource."]
    @variables DEPR(t) [description = "The DEPReciation effect on capital."]
    @variables DEIN(t) [description = "DEsired INvestment represents the target investment rate for capital, in order to stimulate growth."]
    @variables TORE(t)
    @variables CACO(t) [description = "The CApital COsts are deducted from the revenue to generate a value for profits."]
    @variables PROF(t) [description = "The PROFit is the total revenue minus the capital costs."]
    @variables CAFU(t) [description = "A fixed percentage of profits are available as CApital FUnds."]
    @variables MAIN(t) [description = "The cost per unit of investment determines the MAximum INvestment in capital possible."]
    @variables INVE(t) [description = "The INVEstment of the company cannot be more than the company's target and cannot be more than the maximum value."]
    eqs = [
        D(CAPI) ~ INVE - DEPR
        DEPR ~ CAPI * DERA
        DEIN ~ DGF * CAPI
        CACO ~ CAPI * 0.10
        PROF ~ TORE - CACO
        CAFU ~ PROF * FPR
        MAIN ~ CAFU / CPI
        INVE ~ min(DEIN, MAIN)
    ]
    ODESystem(eqs, t; name)
end
```

The `tables.jl` file of the capital system is the following (no table is used).

```
_tables = Dict{Symbol,Tuple{Vararg{Float64}}}(
)
_ranges = Dict{Symbol,Tuple{Float64,Float64}}(
)
gettables() = copy(_tables)
getranges() = copy(_ranges)
```

#### The resource system

The `initialisations.jl` file of the resource system is the following.

```
_inits = Dict{Symbol,Float64}(
    :RESO => 1000,
)
getinitialisations() = copy(_inits)
```

The `parameters.jl` file of the resource system is the following.

```
_params = Dict{Symbol,Float64}(
    :RPUE => 3,
)
getparameters() = copy(_params)
```

The `subsystems.jl` file of the resource system is the following.

```
include("../functions.jl")

@variables t
D = Differential(t)

function resource_system(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @parameters RPUE = params[:RPUE] [description = "The Revenue Per Unit Extraction"]
    @variables CAPI(t)
    @variables RESO(t) = inits[:RESO] [description = "The RESOurce stock which is non-renewable, as it can only be consumed."]
    @variables EXTR(t) [description = "The EXTRaction rate depends on the amount of available capital, which is multiplied by the extraction efficiency per unit of capital."]
    @variables EEPUC(t) [description = "The Extraction Efficiency Per Unit Cost is related to the resource level."]
    @variables TORE(t) [description = "The TOtal REvenue is the amount extracted times revenue per unit extracted."]
    eqs = [
        D(RESO) ~ -EXTR
        EXTR ~ CAPI * EEPUC
        EEPUC ~ interpolate(RESO, tables[:EEPUC], ranges[:EEPUC])
        TORE ~ RPUE * EXTR
    ]
    ODESystem(eqs, t; name)
end
```

The `tables.jl` file of the resource system is the following.

```
_tables = Dict{Symbol,Tuple{Vararg{Float64}}}(
    :EEPUC => (0.0, 0.25, 0.45, 0.63, 0.75, 0.85, 0.92, 0.96, 0.98, 0.99, 1.0),
)
_ranges = Dict{Symbol,Tuple{Float64,Float64}}(
    :EEPUC => (0.0, 1000.0),
)
gettables() = copy(_tables)
getranges() = copy(_ranges)
```

#### Creating the entire model

The two systems are integrated into a unique model by the following function defined in the `scenarios.jl` file within the `duggan` folder.

```
function duggan(; kwargs...)
    @named cap = Capital.capital_system(; kwargs...)
    @named res = Resource.resource_system(; kwargs...)
    systems = [cap, res,]
    connection_eqs = variable_connections(systems)
    return WorldDynamics.compose(systems, connection_eqs)
end
```

#### Solving the model

The solution of the model is computed by the function `duggan_solution` defined in the `solutions.jl` file included in the `duggan` folder.

```
using ModelingToolkit
using DifferentialEquations

function duggan_solution(; default_solver=Euler(), default_dt=0.015625, default_dtmax=0.015625)
    return WorldDynamics.solve(duggan(), (0, 200), solver=Tsit5(), dt=0.015625, dtmax=0.015625)
end
```

#### Plotting the solution

Finally, the solution is plotted by the function `fig_3_9` defined in the `plots.jl` file included in the `duggan` folder.

```
using ModelingToolkit
using DifferentialEquations

@variables t

function _variables()
    @named cap = Capital.capital_system()
    @named res = Resource.resource_system()
    variables = [
        (cap.CAPI, 0, 30, "Capital"),
        (res.EXTR, 0, 15, "Extraction"),
        (cap.INVE, 0, 2, "Investment"),
        (cap.DEPR, 0, 2, "Investment"),
        (res.RESO, 0, 1000, "Resource"),
    ]
    return variables
end

fig_3_9(; kwargs...) = plotvariables(duggan_solution(), (t, 0, 200), _variables(); title="Simulation output showing stocks and flows", showaxis=false, showlegend=true, kwargs...)
```

#### Putting all together

The module `Duggan` is defined in the following code included in the `Duggan.jl` file.

```
module Duggan

using ModelingToolkit
using WorldDynamics

include("functions.jl")
include("solvesystems.jl")

include("Capital.jl")
include("Resource.jl")

include("duggan/scenarios.jl")
include("duggan/solutions.jl")
include("duggan/plots.jl")

end
```
By executing the following code, the same image as the one reported in the tutorial should be produced.

```
include("src/Duggan.jl")
Duggan.fig_3_9()
```

### Generating the HTML pages

The generation of the HTMl pages requires that in the `functions.jl` file the function `systems` and the function `sector_names` return the array of the systems of the model and the array of the names of the folder containing their code. In our example these two functions are defined as follows.

```
function systems()
   r = []
   @named cap = Duggan.Capital.capital_system()
   @named res = Duggan.Resource.resource_system()
   append!(r, [cap, res])
   return r
end

function sector_names()
   return ["capital", "resource"]
end
```

Once appropriately modified the above two functions, the HTML pages can be generated by executing the following code.

```
include("src/Duggan.jl")
Duggan.write_html();
```

The HTML pages are generated in the folder `html` within the folder `output`.