include("../functions.jl")
@register ramp(x, slope, startx, endx)

@variables t
D = Differential(t)

function public_ECTA(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @parameters xETAC2022 = params[:xETAC2022] [description = "xExtra TA cost in 2022 (share of GDP)"]
    @parameters xETAC2100 = params[:xETAC2100] [description = "xExtra TA cost in 2100 (share of GDP)"]

    @variables xECTAGDP(t) [description = "xExtra cost of TAs as share of GDP"]
   
    eqs = []

    add_equation!(eqs, xECTAGDP ~ xETAC2022 + ramp(t, (xETAC2100 - xETAC2022) / 78, 2022, 2022 + 78)) 
   
    return ODESystem(eqs; name=name)
end


function public_GDP(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @variables GS(t)
    @variables GDP(t)
    @variables POP(t)
  
    @variables GSSGDP(t) [description = "Government spending as share of GDP"]
    @variables PSP(t) [description = "Public spending per person kDollar/p/k"]
   
    eqs = []

    add_equation!(eqs, GSSGDP ~ GS / GDP) 
    add_equation!(eqs, PSP ~ GS / POP)
   
    return ODESystem(eqs; name=name)
end


function public_GDP_support(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @variables GDP(t) [description = "GDP GDollar/y"] 
    @variables GS(t) [description = "Government spending GDollar/y"]
    @variables POP(t) [description = "Population Mp"]

  
    eqs = []
    
    add_equation!(eqs, GDP ~ interpolate(t, tables[:GDP], ranges[:GDP]))
    add_equation!(eqs, GS ~ interpolate(t, tables[:GS], ranges[:GS]))    
    add_equation!(eqs, POP ~ interpolate(t, tables[:POP], ranges[:POP]))   
     
    return ODESystem(eqs; name=name)
end

function public(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @variables CTA(t)
    @variables GDP(t)
    @variables CTPIS(t)
    @variables IPT(t) 
    @variables OW2022(t)
    @variables OW(t)
    @variables GP(t) 
    @variables CPUS(t) 
    @variables GDP(t)  
    @variables POP(t)     
    @variables GDPP(t)
    @variables II(t)

    @parameters CTA2022 = params[:CTA2022] [description = "Cost of TAs in 2022 GDollar/y"]
    @parameters FUATA = params[:FUATA] [description = "Fraction unprofitable activity in TAs"]
    @parameters sOWTFP = params[:sOWTFP] [description = "sOWeoTFP<0"]
    @parameters IPR1980 = params[:IPR1980] [description = "Infrastructure purchases ratio in 1980 y"]
    @parameters IPRVPSS = params[:IPRVPSS] [description = "sIPReoVPSS>0"]
    @parameters EDROTA2022 = params[:EDROTA2022] [description = "Extra domestic ROTA in 2022 1/y"]
    @parameters DROTA1980 = params[:DROTA1980] [description = "Domestic ROTA in 1980 1/y"]
    @parameters SC1980 = params[:SC1980] [description = "State capacity in 1980 (fraction of GDP)"]
    @parameters SCROTA = params[:SCROTA] [description = "sSCReoROTA>0"]
    @parameters MIROTA2022 = params[:MIROTA2022] [description = "Maximum imported ROTA from 2022 1/y"]
    @parameters GDPTL = params[:GDPTL] [description = "GDPpp of technology leader kDollar/p/k"]
    @parameters IIEEROTA = params[:IIEEROTA] [description = "sIIEEReoROTA<0"]

    @variables ECTAF2022(t) [description = "Extra cost of TAs from 2022 GDollar/y"]
    @variables ECTAGDP(t) [description = "Extra cost of TAs as share of GDP"]
    @variables PLUA(t) [description = "Productivity loss from unprofitable activity"]
    @variables RTFPUA(t) = inits[:RTFPUA] [description = "Reduction in TFP from unprofitable activity"]
    @variables TFPEE5TA(t) = inits[:TFPEE5TA] [description = "TFP excluding effect of 5TAs"]
    @variables TFPIE5TA(t) [description = "TFP including effect of 5TAs"]
    @variables OWTFP(t) [description = "OWeoTFP"]
    @variables ITFP(t) [description = "Indicated TFP"]
    @variables IPR(t) [description = "Infrastructure purchases ratio y"]
    @variables PPP(t) [description = "Productivity of public purchases"]
    @variables VPSS(t) [description = "Value of public services supplied GDollar/y"]
    @variables PSEP(t) [description = "Public SErvices per person kDollar/p/k"]
    @variables SC(t) [description = "State capacity (fraction of GDP)"]
    @variables DRTA(t) [description = "Domestic rate of technological advance 1/y"]
    @variables IROTA(t) [description = "Imported ROTA 1/y"]
    @variables RROTAI(t) [description = "Reduction in ROTA from inequality 1/y"]
    @variables RTA(t) [description = "Rate of technological advance 1/y"]
    @variables CTFP(t) [description = "Change in TFP 1/y"]

    eqs= []

    add_equation!(eqs, ECTAF2022 ~ max(0, CTA-CTA2022))
    add_equation!(eqs, ECTAGDP ~ ECTAF2022 / GDP)
    add_equation!(eqs, PLUA ~ ECTAGDP * FUATA)
    add_equation!(eqs, D(TFPEE5TA) ~ CTFP)
    add_equation!(eqs, TFPIE5TA ~ TFPEE5TA * (1 - RTFPUA))
    add_equation!(eqs, OWTFP ~ IfElse.ifelse(t > 2022, 1+ sOWTFP * (OW / OW2022 - 1), 1))
    add_equation!(eqs, ITFP ~ TFPEE5TA * OWTFP)
    add_equation!(eqs, IPR ~ CPUS / GP)
    add_equation!(eqs, PPP ~ max(0, 1 + IPRVPSS * log(IPR/IPR1980)))
    add_equation!(eqs, VPSS ~ GP * PPP)
    add_equation!(eqs, PSEP ~ VPSS / POP)
    add_equation!(eqs, SC ~ VPSS / GDP)
    add_equation!(eqs, DRTA ~ (DROTA1980 + IfElse.ifelse(t > 2022, EDROTA2022, 0) * (1 + SCROTA * (SC / SC1980)-1)))
    add_equation!(eqs, IROTA ~ IfElse.ifelse(t > 2022, max(0, MIROTA2022 * (1 - 1 * (GDPP / GDPTL - 1))), 0))
    add_equation!(eqs, RROTAI ~ min(1, 1 + IIEEROTA * (II / 1 - 1)))
    add_equation!(eqs, RTA ~ DRTA * RROTAI + IROTA  )
    add_equation!(eqs, CTFP ~ RTA * TFPEE5TA)

    smooth!(eqs, RTFPUA, PLUA, IPT + CTPIS)

    return ODESystem(eqs; name=name)
end

function public_support(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @variables CTA(t) [description = "Cost of TAs GDollar/y"]
    @variables GDP(t) [description = "GDP GDollar/y"] 
    @variables CTPIS(t) [description = "Construction time PIS y"]
    @variables IPT(t) [description = "Investment planning time y"]
    @variables OW2022(t)  [description = "Observed warming in 2022 deg C"]
    @variables OW(t)  [description = "Observed warming deg C"]
    @variables GP(t)  [description = "Government purchases GDollar/y"]
    @variables CPUS(t)  [description = "Capacity PUS Geu"]
    @variables POP(t) [description = "Population Mp"]
    @variables GDPP(t) [description = "GDP per person kDollar/p/k"]
    @variables II(t) [description = "Inequality index"]
    
    eqs = []

    add_equation!(eqs, CTA ~ interpolate(t, tables[:CTA], ranges[:CTA]))   
    add_equation!(eqs, GDP ~ interpolate(t, tables[:GDP], ranges[:GDP]))
    add_equation!(eqs, CTPIS ~ interpolate(t, tables[:CTPIS], ranges[:CTPIS]))   
    add_equation!(eqs, IPT ~ interpolate(t, tables[:IPT], ranges[:IPT]))
    add_equation!(eqs, OW2022 ~ interpolate(t, tables[:OW2022] , ranges[:OW2022]))
    add_equation!(eqs, OW ~ interpolate(t, tables[:OW], ranges[:OW]))  
    add_equation!(eqs, GP ~ interpolate(t, tables[:GP], ranges[:GP]))  
    add_equation!(eqs, CPUS ~ interpolate(t, tables[:CPUS], ranges[:CPUS]))  
    add_equation!(eqs, POP ~ interpolate(t, tables[:POP], ranges[:POP]))   
    add_equation!(eqs, GDPP ~ interpolate(t, tables[:GDPP], ranges[:GDPP]))   
    add_equation!(eqs, II ~ interpolate(t, tables[:II], ranges[:II]))   
    
    return ODESystem(eqs; name=name)
end