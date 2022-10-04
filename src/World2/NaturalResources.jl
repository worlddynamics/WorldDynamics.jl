module NaturalResources


using ModelingToolkit
using WorldDynamics

include("naturalresources/tables.jl")
include("naturalresources/parameters.jl")
include("naturalresources/initialisations.jl")


getinitialisations() = copy(inits)
getparameters() = copy(params)
gettables() = copy(tables)
getranges() = copy(ranges)

@variables t
D = Differential(t)


function natural_resources(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @variables nrem(t)
    @variables nrfr(t)
    @variables nr(t) = inits[:nr]

    @variables nrur(t)

    eqs = [
        nrem ~ interpolate(nrfr, tables[:nrem], ranges[:nrem])
        nrfr ~ nr / inits[:nr]
        D(nr) ~ -nrur
    ]

    ODESystem(eqs; name)
end

function natural_resources_usage_rate(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @parameters nrun = params[:nrun]
    @parameters nrun1 = params[:nrun1]
    @parameters swt2 = params[:swt2]

    @variables nrur(t)
    @variables nrmm(t)

    @variables p(t)
    @variables msl(t)

    eqs = [
        nrur ~ p * clip(nrun, nrun1, swt2, t) * nrmm
        nrmm ~ interpolate(msl, tables[:nrmm], ranges[:nrmm])
    ]

    ODESystem(eqs; name)
end


end
