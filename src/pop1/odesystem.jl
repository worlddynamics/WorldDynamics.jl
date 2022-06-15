module Pop1


using Interpolations, ModelingToolkit

include("../functions.jl")

include("../common_pop/tables.jl")
include("../common_pop/parameters.jl")
include("../common_pop/initialisations.jl")


@register clip(f1, f2, va, th)

@variables t
D = Differential(t)


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
