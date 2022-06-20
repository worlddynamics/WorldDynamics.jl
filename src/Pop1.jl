module Pop1


using Interpolations, ModelingToolkit

include("functions.jl")

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


function population(; name)
    @parameters ffw = ffwv rlt = rltv pet = petv

    @variables le(t) tf(t)
    @variables pop(t) = pop0
    @variables dr(t) br(t)

    eqs = [
        D(pop) ~ br - dr,
        dr ~ pop / le,
        br ~ clip(dr, tf * pop * ffw / rlt, t, pet)
    ]

    ODESystem(eqs; name)
end


end # module
