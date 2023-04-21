include("../functions.jl")
@register ramp(x, slope, startx, endx)

@variables t
D = Differential(t)

function population(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @parameters CMFR = params[:CMFR] [description = "Cost of Max Fertility Reduction (share of GDP)"]
    @parameters DNC80 = params[:DNC80] [description = "DNC in 1980"]
    @parameters DNCA = params[:DNCA] [description = "DNCalfa<0"]
    @parameters DNCG = params[:DNCG] [description = "DNCgamma"]
    @parameters DNCM = params[:DNCM] [description = "DNCmin"]
    @parameters EIP = params[:EIP] [description = "Exogenous Introduction Period y"]
    @parameters EIPF = params[:EIPF] [description = "Exogenous Introduction Period Flag"]
    @parameters FADFS = params[:FADFS] [description = "Fraction Achieving Desired Family Size"]
    @parameters FP = params[:FP] [description = "Fertile Period"]
    @parameters FW = params[:FW] [description = "Fraction Women"]
    @parameters GEFR = params[:GEFR] [description = "Goal for Extra Fertility Reduction"]
    @parameters GEPA = params[:GEPA] [description = "Goal for Extra Pension Age y"]
    @parameters LEA = params[:LEA] [description = "LEalfa"]
    @parameters LEEPA = params[:LEEPA] [description = "sLEeoPa>0: Life Expectancy Effect on Pension Age"]
    @parameters LEG = params[:LEG] [description = "LEgamma"]
    @parameters LEMAX = params[:LEMAX] [description = "LEmax"]
    @parameters MFM = params[:MFM] [description = "Max Fertility Multiplier"]
    @parameters MLEM = params[:MLEM] [description = "Max Life Expectancy Multiplier"]
    @parameters OW2022 = params[:OW2022] [description = "Observed Warming in 2022 deg C"]
    @parameters OWELE = params[:OWELE] [description = "sOWeoLE<0: Observed Warming Effect on Life Expectancy"]
    @parameters SSP2FA2022F = params[:SSP2FA2022F] [description = "SSP2 Family Action from 2022 Flag"]
    @parameters TAHI = params[:TAHI] [description = "Time to adapt to higher income y"]

    ORDER = Int64(params[:ORDER])

    @variables A0020(t) = inits[:A0020] [description = "Aged 0-20 years Mp"]
    @variables A2040(t) = inits[:A2040] [description = "Aged 20-40 years Mp"]
    @variables A20PA(t) [description = "Aged 20-Pension Age Mp"]
    @variables A4060(t) = inits[:A4060] [description = "Aged 40-60 years Mp"]
    @variables A60PL(t) = inits[:A60PL] [description = "Aged 60+ in 1980 Mp"]
    @variables BIRTHR(t) [description = "Birth Rate 1/y"]
    @variables BIRTHS(t) [description = "Births Mp/y"]
    @variables CEFR(t) [description = "Cost of Extra Fertility Reduction (share of GDP)"]
    @variables DEATHR(t) [description = "Death Rate 1/y"]
    @variables DEATHS(t) [description = "Deaths Mp/y"]
    @variables DNC(t) [description = "Desired No of Children"]
    @variables DR(t) [description = "Dependency Ratio p/p"]
    @variables EFR(t) [description = "Extra Fertility Reduction"]
    @variables EGDPP(t) = inits[:EGDPP] [description = "Effective GDP per Person kDollar/p/y"]
    @variables EPA(t) = inits[:EPA] [description = "Extra Pension Age y"]
    @variables FM(t) [description = "Fertility Multiplier"]
    @variables GDPP(t) [description = "GDP per Person kDollar/p/y"]
    @variables LE(t) = inits[:LE] [description = "Life Expectancy y"]
    @variables LE60(t) [description = "LE at 60 y"]
    @variables LEM(t) [description = "Life Expectancy Multiplier"]
    @variables (LV_DEATHS(t))[1:ORDER] = fill(inits[:DEATHS] * (inits[:LE] - 60) / ORDER, ORDER) [description = "LV functions for deaths Mp/y"]
    @variables (LV_PASS20(t))[1:ORDER] = fill(inits[:PASS20] * 20 / ORDER, ORDER) [description = "LV functions for passing 20 Mp/y"]
    @variables (LV_PASS40(t))[1:ORDER] = fill(inits[:PASS40] * 20 / ORDER, ORDER) [description = "LV functions for passing 40 Mp/y"]
    @variables (LV_PASS60(t))[1:ORDER] = fill(inits[:PASS60] * 20 / ORDER, ORDER) [description = "LV functions for passing 60 Mp/y"]
    @variables OF(t) [description = "Observed Fertility"]
    @variables OP(t) [description = "On Pension Mp"]
    @variables PA(t) = inits[:PA] [description = "Pension Age y"]
    @variables PASS20(t) [description = "Passing 20 Mp/y"]
    @variables PASS40(t) = inits[:PASS40] [description = "Passing 40 Mp/y"]
    @variables PASS60(t) = inits[:PASS60] [description = "Passing 60 Mp/y"]
    @variables PGR(t) [description = "Population Growth Rate Mp"]
    @variables POP(t) [description = "Population Mp"]
    @variables PW(t) [description = "Pensioners per Worker p/p"]
    @variables (RT_DEATHS(t))[1:ORDER] = fill(inits[:DEATHS] * (inits[:LE] - 60) / ORDER, ORDER) [description = "RT functions for deaths Mp/y"]
    @variables (RT_PASS20(t))[1:ORDER] = fill(inits[:PASS20] * 20 / ORDER, ORDER) [description = "RT functions for passing 20 Mp/y"]
    @variables (RT_PASS40(t))[1:ORDER] = fill(inits[:PASS40] * 20 / ORDER, ORDER) [description = "RT functions for passing 40 Mp/y"]
    @variables (RT_PASS60(t))[1:ORDER] = fill(inits[:PASS60] * 20 / ORDER, ORDER) [description = "RT functions for passing 60 Mp/y"]
    @variables WELE(t) [description = "Warming Effect on Life Expectancy"]

    @variables GDP(t)
    @variables IPP(t)
    @variables OW(t)

    eqs = []

    add_equation!(eqs, D(A0020) ~ BIRTHS - PASS20)
    add_equation!(eqs, D(A2040) ~ PASS20 - PASS40)
    add_equation!(eqs, A20PA ~ A2040 + A4060 + A60PL - OP)
    add_equation!(eqs, D(A4060) ~ PASS40 - PASS60)
    add_equation!(eqs, D(A60PL) ~ PASS60 - DEATHS)
    add_equation!(eqs, BIRTHR ~ BIRTHS / POP)
    add_equation!(eqs, BIRTHS ~ A2040 * FW * (OF / FP))
    add_equation!(eqs, CEFR ~ CMFR * GEFR)
    add_equation!(eqs, DEATHR ~ DEATHS / POP)
    add_equation!(eqs, DEATHS ~ RT_DEATHS[ORDER])
    add_equation!(eqs, DNC ~ ((DNCM + (DNC80 - DNCM) * exp(-DNCG * (EGDPP - inits[:EGDPP]))) * (1 + DNCA * (EGDPP - inits[:EGDPP]))) * (1 - EFR) * FM)
    add_equation!(eqs, DR ~ (A0020 + A60PL) / (A2040 + A4060))
    add_equation!(eqs, EFR ~ ramp(t, GEFR / IPP, 2022, 2022 + IPP))
    add_equation!(eqs, EPA ~ ramp(t, (GEPA - inits[:EPA]) / IPP, 2022, 2022 + IPP))
    add_equation!(eqs, D(EGDPP) ~ (GDPP - EGDPP) / TAHI)
    add_equation!(eqs, FM ~ IfElse.ifelse(SSP2FA2022F > 0, IfElse.ifelse(t > 2022, 1 + ramp(t, (MFM - 1) / 78, 2022, 2100), 1), 1))
    add_equation!(eqs, GDPP ~ GDP / POP)
    add_equation!(eqs, LE ~ ((LEMAX - (LEMAX - inits[:LE]) * exp(-LEG * (EGDPP - inits[:EGDPP]))) * (1 + LEA * (EGDPP - inits[:EGDPP]))) * WELE * LEM)
    add_equation!(eqs, LE60 ~ LE - 60)
    add_equation!(eqs, LEM ~ IfElse.ifelse(SSP2FA2022F > 0, IfElse.ifelse(t > 2022, 1 + ramp(t, (MLEM - 1) / 78, 2022, 2100), 1), 1))
    add_equation!(eqs, OF ~ DNC * FADFS)
    add_equation!(eqs, OP ~ A60PL * (LE - PA) / (LE - 60))
    add_equation!(eqs, PA ~ IfElse.ifelse(LE < inits[:LE], inits[:PA], inits[:PA] + LEEPA * (LE + EPA - inits[:LE])))
    add_equation!(eqs, PASS20 ~ RT_PASS20[ORDER])
    add_equation!(eqs, PASS40 ~ RT_PASS40[ORDER])
    add_equation!(eqs, PASS60 ~ RT_PASS60[ORDER])
    add_equation!(eqs, PGR ~ BIRTHR - DEATHR)
    add_equation!(eqs, POP ~ A0020 + A2040 + A4060 + A60PL)
    add_equation!(eqs, PW ~ OP / A20PA)
    add_equation!(eqs, WELE ~ IfElse.ifelse(t > 2022, max(0, 1 + OWELE * (OW / OW2022 - 1)), 1))

    delay_n!(eqs, BIRTHS, RT_PASS20, LV_PASS20, 20, ORDER)
    delay_n!(eqs, PASS20, RT_PASS40, LV_PASS40, 20, ORDER)
    delay_n!(eqs, PASS40, RT_PASS60, LV_PASS60, 20, ORDER)
    delay_n!(eqs, PASS60, RT_DEATHS, LV_DEATHS, LE60, ORDER)

    return ODESystem(eqs; name=name)
end

function population_support(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @variables GDP(t) [description = "GDP GDollar/y"]
    @variables IPP(t) [description = "Introduction period for policy y"]
    @variables OW(t) [description = "Observed warming deg C"]

    eqs = []

    add_equation!(eqs, GDP ~ interpolate(t, tables[:GDP], ranges[:GDP]))
    add_equation!(eqs, IPP ~ interpolate(t, tables[:IPP], ranges[:IPP]))
    add_equation!(eqs, OW ~ interpolate(t, tables[:OW], ranges[:OW]))

    return ODESystem(eqs; name=name)
end
