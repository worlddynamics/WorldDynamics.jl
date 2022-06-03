using Interpolations, ModelingToolkit, DifferentialEquations

include("../functions.jl")
include("tables.jl")
include("parameters.jl")
include("initialisations.jl")


@register interpolate(x, y::NTuple, xs::Tuple)
@register clip(f1, f2, va, th)
@register min(v1, v2)
@register step(t, hght, sttm)

@variables t
D = Differential(t)


function Population(; name)
    @variables pop(t) p2(t) p3(t)

    eqs = [
        pop ~ interpolate(t, popt, popts) * (1e9)
        p2 ~ 0.25 * pop
        p3 ~ 0.25 * pop
    ]

    ODESystem(eqs; name)
end

function Agriculture(; name)
    @variables aiph(t) al(t) fioaa(t) 

    eqs = [
        aiph ~ interpolate(t, aipht, aiphts)
        al ~ interpolate(t, alt, alts) * (1e8)
        fioaa ~ interpolate(t, fioaat, fioaats)
    ]

    ODESystem(eqs; name)
end

function Non_Renewable(; name)
    @variables fcaor(t)

    eqs = [
        fcaor ~ interpolate(t, fcaort, fcaorts)
    ]

    ODESystem(eqs; name)
end

function Industrial_Subsector(; name)
    @parameters pyear = pyearv icor1 = icor1v icor2 = icor2v alic1 = alic1v alic2 = alic2v iet = ietv iopcd = iopcdv fioac1 = fioac1v fioac2 = fioac2v

    @variables pop(t) fcaor(t) cuf(t) fioaa(t) fioas(t)
    @variables ic(t) = ic0
    @variables iopc(t) io(t) icor(t) icdr(t) alic(t) icir(t) fioai(t) fioac(t) fioacc(t) fioacv(t) 
    
    eqs = [
        iopc ~ io / pop
        io ~ ic * (1 - fcaor) * cuf / icor
        icor ~ clip(icor2, icor1, t, pyear)
        D(ic) ~ icir - icdr
        icdr ~ ic / alic
        alic ~ clip(alic2, alic1, t, pyear)
        icir ~ io * fioai
        fioai ~ 1 - fioaa - fioas - fioac
        fioac ~ clip(fioacv, fioacc, t, iet)
        fioacc ~ clip(fioac2, fioac1, t, pyear)
        fioacv ~ interpolate(iopc / iopcd, fioacvt, fioacvts)
    ]

    ODESystem(eqs; name)
end

function Service_Subsector(; name)
    @parameters pyear = pyearv alsc1 = alsc1v alsc2 = alsc2v scor1 = scor1v scor2 = scor2v

    @variables iopc(t) io(t) cuf(t) pop(t) 
    @variables sc(t) = sc0 
    @variables isopc(t) isopc1(t) isopc2(t) fioas(t) fioas1(t) fioas2(t) scir(t) scdr(t) alsc(t) so(t) sopc(t) scor(t)

    eqs = [
        isopc ~ clip(isopc2, isopc1, t, pyear)
        isopc1 ~ interpolate(iopc, isopc1t, isopc1ts)
        isopc2 ~ interpolate(iopc, isopc2t, isopc2ts)
        fioas ~ clip(fioas2, fioas1, t, pyear)
        fioas1 ~ interpolate(sopc / isopc, fioas1t, fioas1ts)
        fioas2 ~ interpolate(sopc / isopc, fioas2t, fioas2ts)
        scir ~ io * fioas
        D(sc) ~ scir - scdr
        scdr ~ sc / alsc
        alsc ~ clip(alsc2, alsc1, t, pyear)
        so ~ sc * cuf / scor
        sopc ~ so / pop
        scor ~ clip(scor2, scor1, t, pyear)
    ]

    ODESystem(eqs; name)
end

function Job_Subsector(; name)
    @parameters lfpf = lfpfv lufdt = lufdtv

    @variables ic(t) iopc(t) sc(t) sopc(t) al(t) aiph(t) p2(t) p3(t)
    @variables lufd(t) = lufd0
    @variables j(t) pjis(t) jpicu(t) pjss(t) jpscu(t) pjas(t) jph(t) lf(t) luf(t) cuf(t) 

    eqs = [
        j ~ pjis + pjas + pjss
        pjis ~ ic * jpicu
        jpicu ~ interpolate(iopc, jpicut, jpicuts) * (1e-3)
        pjss ~ sc * jpscu
        jpscu ~ interpolate(sopc, jpscut, jpscuts) * (1e-3)
        pjas ~ jph * al
        jph ~ interpolate(aiph, jpht, jphts)
        lf ~ (p2 + p3) * lfpf
        luf ~ j / lf
        D(lufd) ~ (luf - lufd) / lufdt
        cuf ~ interpolate(lufd, cuft, cufts)
    ]

    ODESystem(eqs; name)
end


@named pop = Population()
@named nr = Non_Renewable()
@named ag = Agriculture()
@named is = Industrial_Subsector()
@named ss = Service_Subsector()
@named js = Job_Subsector()

connection_eqs = [
    is.pop ~ pop.pop
    is.fcaor ~ nr.fcaor
    is.cuf ~ js.cuf
    is.fioaa ~ ag.fioaa
    is.fioas ~ ss.fioas
    ss.iopc ~ is.iopc
    ss.io ~ is.io
    ss.cuf ~ js.cuf
    ss.pop ~ pop.pop
    js.ic ~ is.ic
    js.iopc ~ is.iopc
    js.sc ~ ss.sc
    js.sopc ~ ss.sopc
    js.al ~ ag.al
    js.aiph ~ ag.aiph
    js.p2 ~ pop.p2
    js.p3 ~ pop.p3
]

@named _cap_model = ODESystem(connection_eqs, t)
@named cap_model = compose(_cap_model, [pop, nr, ag, is, ss, js])

cap_sys = structural_simplify(cap_model)

prob = ODEProblem(cap_sys, [], (1900, 2000.0))
sol = solve(prob, Tsit5())


using PlotlyJS

function plot_sol_3_36(sol)
    traces = GenericTrace[]
    push!(traces, scatter(x=sol[t], y=sol[pop.pop],  name="pop",   yaxis="y1"))
    push!(traces, scatter(x=sol[t], y=sol[ag.al],    name="al",    yaxis="y2"))
    push!(traces, scatter(x=sol[t], y=sol[ag.fioaa], name="fioaa", yaxis="y3"))
    push!(traces, scatter(x=sol[t], y=sol[nr.fcaor], name="fcaor", yaxis="y4"))
    push!(traces, scatter(x=sol[t], y=sol[ag.aiph],  name="aiph",  yaxis="y5"))
    plot(traces,
        Layout(xaxis_domain=[0.3, 0.7],
            yaxis  = attr(title="pop", range=[0, 5e9]),
            yaxis2 = attr(title="al",    overlaying="y", side="right", position=0.70, range=[0, 1.5e9]),
            yaxis3 = attr(title="fioaa", overlaying="y", side="right", position=0.74, range=[0, 0.5]),
            yaxis4 = attr(title="fcaor", overlaying="y", side="right", position=0.78, range=[0, 0.25]),
            yaxis5 = attr(title="aiph",  overlaying="y", side="right", position=0.82, range=[0, 50])
        )
    )
end

function plot_sol_3_37(sol)
    traces = GenericTrace[]
    push!(traces, scatter(x=sol[t], y=sol[is.iopc],  name="iopc",  yaxis="y1"))
    push!(traces, scatter(x=sol[t], y=sol[ss.sopc],  name="sopc",  yaxis="y2"))
    push!(traces, scatter(x=sol[t], y=sol[is.io],    name="io",    yaxis="y3"))
    push!(traces, scatter(x=sol[t], y=sol[ss.fioas], name="fioas", yaxis="y4"))
    push!(traces, scatter(x=sol[t], y=sol[js.cuf],   name="cuf",   yaxis="y5"))
    plot(traces,
        Layout(xaxis_domain=[0.3, 0.7],
            yaxis  = attr(title="iopc", range=[0, 1000]),
            yaxis2 = attr(title="sopc",  overlaying="y", side="right", position=0.70, range=[0, 1000]),
            yaxis3 = attr(title="io",    overlaying="y", side="right", position=0.74, range=[0, 4e12]),
            yaxis4 = attr(title="fioas", overlaying="y", side="right", position=0.78, range=[0, 0.4]),
            yaxis5 = attr(title="cuf",   overlaying="y", side="right", position=0.82, range=[0, 1])
        )
    )
end
