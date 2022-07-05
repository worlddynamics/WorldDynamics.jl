module Pop1


using ModelingToolkit

include("../functions.jl")

include("population/common_pop/tables.jl")
include("population/common_pop/parameters.jl")
include("population/common_pop/initialisations.jl")
include("population/CommonPop.jl")


@register clip(f1, f2, va, th)

@variables t
D = Differential(t)


birth_rate = CommonPop.birth_rate
death_rate = CommonPop.death_rate
service_output = CommonPop.service_output
industrial_output = CommonPop.industrial_output
persistent_pollution = CommonPop.persistent_pollution
food = CommonPop.food

params = CommonPop.params
inits = CommonPop.inits
tables = CommonPop.tables
ranges = CommonPop.ranges


function population(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @parameters ffw = params[:ffw]
    @parameters rlt = params[:rlt]
    @parameters pet = params[:pet]

    @variables le(t) tf(t)
    @variables pop(t) = inits[:pop0]
    @variables dr(t) br(t)

    eqs = [
        D(pop) ~ br - dr,
        dr ~ pop / le,
        br ~ clip(dr, tf * pop * ffw / rlt, t, pet)
    ]

    ODESystem(eqs; name)
end


end # module
