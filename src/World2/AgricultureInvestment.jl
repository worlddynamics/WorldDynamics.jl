module AgricultureInvestment


using ModelingToolkit

include("../functions.jl")
include("agricultureinvestment/tables.jl")
include("agricultureinvestment/parameters.jl")
include("agricultureinvestment/initialisations.jl")


getinitialisations() = copy(inits)
getparameters() = copy(params)
gettables() = copy(tables)
getranges() = copy(ranges)


@register interpolate(x, y::NTuple, xs::Tuple)
@register clip(f1, f2, va, th)

@variables t
D = Differential(t)


function agriculture_investment(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @parameters fc = params[:fc]
    @parameters fc1 = params[:fc1]
    @parameters swt7 = params[:swt7]
    @parameters fn = params[:fn]
    @parameters ciaft = params[:ciaft]

    @variables fr(t)
    @variables fpci(t)
    @variables fcm(t)
    @variables fpm(t)
    @variables ciaf(t) = inits[:ciaf]
    @variables cfifr(t)
    @variables ciqr(t)

    @variables cr(t)
    @variables cira(t)
    @variables polr(t)
    @variables qlm(t)
    @variables qlf(t)

    eqs = [
        fr ~ fpci * fcm * fpm * clip(fc, fc1, swt7, t) / fn
        fcm ~ interpolate(cr, tables[:fcm], ranges[:fcm])
        fpci ~ interpolate(cira, tables[:fpci], ranges[:fpci])
        fpm ~ interpolate(polr, tables[:fpm], ranges[:fpm])
        D(ciaf) ~ (cfifr * ciqr - ciaf) / ciaft
        cfifr ~ interpolate(fr, tables[:cfifr], ranges[:cfifr])
        ciqr ~ interpolate(qlm / qlf, tables[:ciqr], ranges[:ciqr])
    ]

    ODESystem(eqs; name)
end


end
