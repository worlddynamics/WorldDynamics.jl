module NewEquations


using ModelingToolkit
using WorldDynamics

@variables t

function human_welfare_index(; name,
    params=Dict([:oy => 1, :gdpu => 1, :rlgdp => 24, :rhgdp => 9508]),
    inits=Dict(),
    tables=Dict([
        :lei => (0.0, 0.16, 0.33, 0.5, 0.67, 0.84, 1.0),
        :ei => (0.0, 0.81, 0.88, 0.92, 0.95, 0.98, 0.99, 1.0),
        :gdppc => (120.0, 600.0, 1200.0, 1800.0, 2500.0, 3200.0),
    ]),
    ranges=Dict([
        :lei => (25.0, 85.0),
        :ei => (0.0, 7000.0),
        :gdppc => (0.0, 1000.0),
    ]),
)
    @parameters oy = params[:oy]
    @parameters gdpu = params[:gdpu]
    @parameters rlgdp = params[:rlgdp]
    @parameters rhgdp = params[:rhgdp]

    @variables le(t) iopc(t)
    @variables hwi(t) lei(t) ei(t) gdpi(t) gdppc(t)

    eqs = [
        hwi ~ (lei + ei + gdpi) / 3
        lei ~ interpolate(le / oy, tables[:lei], ranges[:lei])
        ei ~ interpolate(gdppc / gdpu, tables[:ei], ranges[:ei])
        gdpi ~ log(10, gdppc / rlgdp) / log(10, rhgdp / rlgdp)
        gdppc ~ interpolate(iopc / gdpu, tables[:gdppc], ranges[:gdppc])
    ]

    return ODESystem(eqs, t; name)
end

function human_ecological_footprint(; name,
    params=Dict([:tl => 1.91, :hup => 4, :hgha => 1e9, :uagi => 1, :up => 1]),
    inits=Dict(),
    tables=Dict(),
    ranges=Dict(),
)
    @parameters tl = params[:tl]
    @parameters hup = params[:hup]
    @parameters hgha = params[:hgha]
    @parameters uagi = params[:uagi]
    @parameters up = params[:up]

    @variables ppgr(t) al(t) uil(t)
    @variables hef(t) algha(t) alggha(t) ulgha(t)

    eqs = [
        hef ~ (alggha + ulgha + algha) / tl
        algha ~ ppgr * hup / hgha
        alggha ~ al / hgha
        ulgha ~ uil / hgha
    ]

    return ODESystem(eqs, t; name)
end


end
