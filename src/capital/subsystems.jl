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