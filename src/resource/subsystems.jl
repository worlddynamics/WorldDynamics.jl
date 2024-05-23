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