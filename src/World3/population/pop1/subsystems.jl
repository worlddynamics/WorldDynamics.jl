birth_rate = CommonPop.birth_rate
death_rate = CommonPop.death_rate
service_output = CommonPop.service_output
industrial_output = CommonPop.industrial_output
persistent_pollution = CommonPop.persistent_pollution
food = CommonPop.food

@variables t
D = Differential(t)

function population(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @parameters ffw = params[:ffw]
    @parameters rlt = params[:rlt]
    @parameters pet = params[:pet]

    @variables le(t) tf(t)
    @variables pop(t) = inits[:pop]
    @variables dr(t) br(t)

    eqs = [
        D(pop) ~ br - dr
        dr ~ pop / le
        br ~ clip(dr, tf * pop * ffw / rlt, t, pet)
    ]

    ODESystem(eqs; name)
end
