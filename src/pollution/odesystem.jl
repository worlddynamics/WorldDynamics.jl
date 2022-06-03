using Interpolations, ModelingToolkit, DifferentialEquations

# this was necessary because t0 is needed in initialisations.jl
global t0 = 1900

include("../functions.jl")
include("tables.jl")
include("parameters.jl")
include("initialisations.jl")


@register interpolate(x, y::NTuple, xs::Tuple)
@register clip(f1, f2, va, th)
@register min(v1, v2)
@register max(v1, v2)
@register step(t, hght, sttm)
@register switch(v1, v2, z)

@variables t
D = Differential(t)


function Population(; name)
    @variables pop(t) = pop0
    
    eqs = [
        pop ~ interpolate(t, popt, popts) * 1e8
    ]
    
    ODESystem(eqs; name)
end

function Non_Renewable(; name)
    @variables pcrum(t) = pcrum0
    
    eqs = [
        pcrum ~ interpolate(t, pcrumt, pcrumts) * 1e-2
    ]
    
    ODESystem(eqs; name)
end

function Agriculture(; name)
    @variables aiph(t) = aiph0 al(t) = al0
    
    eqs = [
        aiph ~ interpolate(t, aipht, aiphts)
        al ~ interpolate(t, alt, alts) * 1e8        
    ]

    ODESystem(eqs; name)
end

function Pollution_Damage(; name)
    @parameters pyear = pyearv
    
    @variables ppolx(t) 
    @variables lmp(t) = lmp0 lmp1(t) = lmp10 lmp2(t) = lmp20 lfdr(t) lfdr1(t) lfdr2(t)
    
    eqs = [
        lmp ~ clip(lmp2, lmp1, t, pyear)
        lmp1 ~ interpolate(ppolx, lmp1t, lmp1ts)
        lmp2 ~ interpolate(ppolx, lmp2t, lmp2ts)
        lfdr ~ clip(lfdr2, lfdr1, t, pyear)
        lfdr1 ~ interpolate(ppolx, lfdr1t, lfdr1ts)
        lfdr2 ~ interpolate(ppolx, lfdr2t, lfdr2ts)
    ]

    ODESystem(eqs; name)
end

function Adaptive_Technological_Control_Cards(; name)
    @parameters pyear = pyearv tdd = tddv pd = pdv

    @variables lmp(t)
    @variables ppgf22(t) = ppgf220 ppgf222(t) = ppgf220 ppgf221(t) = ppgf220 pcti(t) = pcti0 plmp(t) = plmp0 plmp2(t) = plmp0 plmp1(t) = plmp0
    @variables pctir(t) pctcm(t)

    eqs = [
        D(ppgf22) ~ 3 * (ppgf222 - ppgf22) / tdd
        D(ppgf222) ~ 3 * (ppgf221 - ppgf222) / tdd
        D(ppgf221) ~ 3 * (pcti - ppgf221) / tdd
        D(pcti) ~ pctir
        pctir ~ clip(pcti * pctcm, 0, t, pyear)
        pctcm ~ interpolate(1 - plmp, pctcmt, pctcmts)
        D(plmp) ~ 3 * (plmp2 - plmp) / pd
        D(plmp2) ~ 3 * (plmp1 - plmp2) / pd
        D(plmp1) ~ 3 * (lmp - plmp1) / pd
    ]

    ODESystem(eqs; name)
end

function Persistent_Pollution(; name)
    @parameters pyear = pyearv ppgf1 = ppgf1v ppgf21 = ppgf21v swat = swatv frpm = frpmv imef = imefv imti = imtiv fipm = fipmv amti = amtiv pptd1 = pptd1v pptd2 = pptd2v ppol70 = ppol70v ahl70 = ahl70v

    @variables ppgf22(t) pcrum(t) pop(t) aiph(t) al(t)
    @variables ppapr3(t) = ppapr30 ppapr2(t) = ppapr30 ppapr1(t) = ppapr30 ppol(t) = ppol0
    @variables ppgr(t) = ppgr0 ppgf(t) ppgf2(t) ppgio(t) = ppgio0 ppgao(t) = ppgao0 ppapr(t) pptd(t) = pptd0 ppolx(t) = ppolx0 ppasr(t) ahlm(t) ahl(t)

    eqs = [
        ppgr ~ (ppgio + ppgao) * ppgf
        ppgf ~ clip(ppgf2, ppgf1, t, pyear)
        ppgf2 ~ switch(ppgf21, ppgf22, swat)
        ppgio ~ pcrum * pop * frpm * imef * imti
        ppgao ~ aiph * al * fipm * amti
        ppapr ~ 3 * ppapr3 / pptd
        D(ppapr3) ~ (3 * ppapr2 / pptd) - ppapr
        D(ppapr2) ~ 3 * (ppapr1 - ppapr2) / pptd
        D(ppapr1) ~ ppgr - (3 * ppapr1 / pptd)
        pptd ~ clip(pptd2, pptd1, t, pyear)
        D(ppol) ~ ppapr - ppasr
        ppolx ~ ppol / ppol70
        ppasr ~ ppol / (1.4 * ahl)
        ahlm ~ interpolate(ppolx, ahlmt, ahlmts)
        ahl ~ ahl70 * ahlm
    ]

    ODESystem(eqs; name)
end


@named pop = Population()
@named nr = Non_Renewable()
@named ag = Agriculture()
@named pd = Pollution_Damage()
@named atcc = Adaptive_Technological_Control_Cards()
@named pp = Persistent_Pollution()

connection_eqs = [
    pd.ppolx ~ pp.ppolx
    atcc.lmp ~ pd.lmp
    pp.ppgf22 ~ atcc.ppgf22
    pp.pcrum ~ nr.pcrum
    pp.pop ~ pop.pop
    pp.aiph ~ ag.aiph
    pp.al ~ ag.al
]

@named _pp_model = ODESystem(connection_eqs, t)
@named pp_model = compose(_pp_model, [pop, nr, ag, pd, atcc, pp])

pp_sys = structural_simplify(pp_model)

prob = ODEProblem(pp_sys, [], (t0, 1970.0))
sol = solve(prob, Tsit5())


using PlotlyJS

function plot_sol_6_28(sol)
    traces = GenericTrace[]
    push!(traces, scatter(x=sol[t], y=sol[nr.pcrum], name="pcrum", yaxis="y1"))
    push!(traces, scatter(x=sol[t], y=sol[pop.pop],  name="pop",   yaxis="y2"))
    push!(traces, scatter(x=sol[t], y=sol[ag.al],    name="al",    yaxis="y3"))
    push!(traces, scatter(x=sol[t], y=sol[ag.aiph],  name="aiph",  yaxis="y4"))
    push!(traces, scatter(x=sol[t], y=sol[pp.ppgr],  name="ppgr",  yaxis="y5"))
    plot(traces,
        Layout(xaxis_domain=[0.1, 0.7],
            yaxis  = attr(title="pcrum", range=[0, 1]),
            yaxis2 = attr(title="pop",  overlaying="y", side="right", position=0.70, range=[0, 4e9]),
            yaxis3 = attr(title="al",   overlaying="y", side="right", position=0.74, range=[0, 2e9]),
            yaxis4 = attr(title="aiph", overlaying="y", side="right", position=0.78, range=[0, 50]),
            yaxis5 = attr(title="ppgr", overlaying="y", side="right", position=0.82, range=[0, 2e8]),
        )
    )
end

function plot_sol_6_29(sol)
    traces = GenericTrace[]
    push!(traces, scatter(x=sol[t], y=sol[pp.ppgr],  name="ppgr",  yaxis="y1"))
    push!(traces, scatter(x=sol[t], y=sol[pp.ppapr], name="ppapr", yaxis="y2"))
    push!(traces, scatter(x=sol[t], y=sol[pp.ppasr], name="ppasr", yaxis="y3"))
    push!(traces, scatter(x=sol[t], y=sol[pp.ppolx], name="ppolx", yaxis="y4"))
    push!(traces, scatter(x=sol[t], y=sol[pp.ahl],   name="ahl",   yaxis="y5"))
    push!(traces, scatter(x=sol[t], y=sol[pd.lmp],   name="lmp",   yaxis="y6"))
    push!(traces, scatter(x=sol[t], y=sol[pd.lfdr],  name="lfdr",  yaxis="y7"))
    plot(traces,
        Layout(xaxis_domain=[0.1, 0.7],
            yaxis  = attr(title="ppgr", range=[0, 2e8]),
            yaxis2 = attr(title="ppapr", overlaying="y", side="right", position=0.70, range=[0, 2e8]),
            yaxis3 = attr(title="ppasr", overlaying="y", side="right", position=0.74, range=[0, 2e8]),
            yaxis4 = attr(title="ppolx", overlaying="y", side="right", position=0.78, range=[0, 1]),
            yaxis5 = attr(title="ahl",   overlaying="y", side="right", position=0.82, range=[0, 2]),
            yaxis6 = attr(title="lmp",   overlaying="y", side="right", position=0.86, range=[0, 1]),
            yaxis7 = attr(title="lfdr",  overlaying="y", side="right", position=0.90, range=[0, 0.5]),
        )
    )
end
