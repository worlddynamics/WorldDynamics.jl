include("../functions.jl")
@register ramp(x, slope, startx, endx)

@variables t
D = Differential(t)

function wellbeing(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @parameters AI = params[:AI] [description = "Acceptable Inequality"]
    @parameters AP = params[:AP] [description = "Acceptable Progress 1/y"]
    @parameters AWBPD = params[:AWBPD] [description = "Average WellBeing Perception Delay y"]
    @parameters DRDI = params[:DRDI] [description = "Diminishing Return Disposable Income"]
    @parameters DRPS = params[:DRPS] [description = "Diminishing Return Public Spending"]
    @parameters EIP = params[:EIP] [description = "Exogenous Introduction Period y"]
    @parameters EIPF = params[:EIPF] [description = "Exogenous Introduction Period Flag"]
    @parameters GWEAWBGWF = params[:GWEAWBGWF] [description = "sGWeoAW<0: Global Warming Effect on Average WellBeing from Global Warming Flag"]
    @parameters IEAWBIF = params[:IEAWBIF] [description = "sIIeoAW<0: Inequality Effect on Average WellBeing from Inequality Flag"]
    @parameters MWBGW = params[:MWBGW] [description = "Min WellBeing from Global Warming"]
    @parameters NRD = params[:NRD] [description = "Normal Reform Delay y"]
    @parameters PAEAWBF = params[:PAEAWBF] [description = "sLPeoAWP>0: PArtecipation Effect on Average WellBeing Flag"]
    @parameters PREAWBF = params[:PREAWBF] [description = "sROPeoAW>0: PRogress Effect on Average WellBeing Flag"]
    @parameters PESTF = params[:PESTF] [description = "sPPReoSTE<0: Progress Effect on Social Tension Flag"]
    @parameters SPS = params[:SPS] [description = "Satisfactory Public Spending"]
    @parameters STEERDF = params[:STEERDF] [description = "sSTEeoRD>0: Social Tension Effect on Reform Delay Flag"]
    @parameters STRERDF = params[:STRERDF] [description = "sSTReoRD<0: Social Trust Effect on Reform Delay Flag"]
    @parameters TCRD = params[:TCRD] [description = "Time to Change Reform Delay y"]
    @parameters TDI = params[:TDI] [description = "Threshold Disposable Income kdollar/p/y"]
    @parameters TEST = params[:TEST] [description = "Time to Establish Social Trust y"]
    @parameters TI = params[:TI] [description = "Threshold Inequality"]
    @parameters TP = params[:TP] [description = "Threshold Participation"]
    @parameters TPR = params[:TPR] [description = "Threshold Progress Rate 1/y"]
    @parameters TPS = params[:TPS] [description = "Threshold Public Spending kdollar/p/y"]
    @parameters TW = params[:TW] [description = "Threshold Warming deg C"]

    @variables AWBDI(t) [description = "Average WellBeing from Disposable Income"]
    @variables AWBGW(t) [description = "Average WellBeing from Global Warming"]
    @variables AWBI(t) [description = "Awerage WellBeing Index"]
    @variables AWBIN(t) [description = "Average WellBeing from INequality"]
    @variables AWBPS(t) [description = "Average WellBeing from Public Spending"]
    @variables AWBP(t) [description = "Average WellBeing from Progress"]
    @variables IEST(t) [description = "Inequity Effect on Social Trust"]
    @variables IPP(t) [description = "Introduction Period for Policy y"]
    @variables IRD(t) [description = "Indicated Reform Delay y"]
    @variables IST(t) [description = "Indicated Social Trust"]
    @variables ORP(t) = inits[:ORP] [description = "Observed Rate of Progress 1/y"]
    @variables PAWBI(t) = inits[:PAWBI] [description = "Past Average WellBeing Index"]
    @variables PSESTR(t) [description = "Public Spending Effect on Social TRust"]
    @variables PSSGDP(t) [description = "Public Spending as Share of GDP"]
    @variables RD(t) = inits[:RD] [description = "Reform Delay"]
    @variables STR(t) = inits[:STR] [description = "Social Trust"]
    @variables STE(t) = inits[:STE] [description = "Social TEnsion"]
    @variables STEERD(t) [description = "Social TEnsion Effect on Reform Delay"]
    @variables STRERD(t) [description = "Social TRust Effect on Reform Delay"]
    @variables WBEP(t) [description = "WellBeing Effect of Participation"]

    @variables GDPP(t)
    @variables INEQ(t)
    @variables LPR(t)
    @variables PSP(t)
    @variables PW(t)
    @variables WDI(t)

    eqs = []

    add_equation!(eqs, AWBDI ~ exp(DRDI + log(WDI / TDI)))
    add_equation!(eqs, AWBIN ~ 1 + IEAWBIF * (INEQ / TI - 1))
    add_equation!(eqs, AWBGW ~ max(MWBGW, min(1, 1 + GWEAWBGWF * (PW / TW - 1))))
    add_equation!(eqs, AWBI ~ (0.5 * AWBDI + 0.5 * AWBPS) * AWBIN * AWBGW * AWBP)
    add_equation!(eqs, AWBP ~ (1 + PREAWBF * (ORP - TPR)) * WBEP)
    add_equation!(eqs, AWBPS ~ exp(DRPS + log(PSP / TPS)))
    add_equation!(eqs, IEST ~ interpolate(INEQ / AI, tables[:IEST], ranges[:IEST]))
    add_equation!(eqs, IPP ~ IfElse.ifelse(EIPF > 0, EIP, RD))
    add_equation!(eqs, IRD ~ NRD * STRERD * STEERD)
    add_equation!(eqs, IST ~ PSESTR * IEST)
    smooth!(eqs, ORP, ((AWBI - PAWBI) / AWBI) / AWBPD, AWBPD)
    smooth!(eqs, PAWBI, AWBI, AWBPD)
    add_equation!(eqs, PSSGDP ~ PSP / GDPP)
    add_equation!(eqs, PSESTR ~ interpolate(PSSGDP / SPS, tables[:PSESTR], ranges[:PSESTR]))
    smooth!(eqs, RD, IRD, TCRD)
    add_equation!(eqs, STE ~ 1 + PESTF * (ORP - AP))
    add_equation!(eqs, STEERD ~ 1 + STEERDF * (STE / inits[:STE] - 1))
    add_equation!(eqs, STRERD ~ 1 + STRERDF * (STR / inits[:STR] - 1))
    smooth!(eqs, STR, IST, TEST)
    add_equation!(eqs, WBEP ~ 1 + PAEAWBF * (LPR / TP - 1))

    return ODESystem(eqs; name=name)
end

function wellbeing_support(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @variables GDPP(t)
    @variables INEQ(t)
    @variables LPR(t)
    @variables PSP(t) [description = "Public Spending per person kdollar/p/y"]
    @variables PW(t)
    @variables WDI(t)

    eqs = []

    add_equation!(eqs, GDPP ~ interpolate(t, tables[:GDPP], ranges[:GDPP]))
    add_equation!(eqs, INEQ ~ interpolate(t, tables[:INEQ], ranges[:INEQ]))
    add_equation!(eqs, LPR ~ interpolate(t, tables[:LPR], ranges[:LPR]))
    add_equation!(eqs, PSP ~ interpolate(t, tables[:PSP], ranges[:PSP]))
    add_equation!(eqs, PW ~ interpolate(t, tables[:PW], ranges[:PW]))
    add_equation!(eqs, WDI ~ interpolate(t, tables[:WDI], ranges[:WDI]))

    return ODESystem(eqs; name=name)
end
