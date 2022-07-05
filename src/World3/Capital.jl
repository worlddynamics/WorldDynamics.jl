module Capital


using ModelingToolkit

include("../functions.jl")
include("capital/tables.jl")
include("capital/parameters.jl")
include("capital/initialisations.jl")


@register interpolate(x, y::NTuple, xs::Tuple)
@register clip(f1, f2, va, th)

@variables t
D = Differential(t)


function population(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @variables pop(t) p2(t) p3(t)

    eqs = [
        pop ~ interpolate(t, tables[:pop], ranges[:pop]) * (1e9)
        p2 ~ 0.25 * pop
        p3 ~ 0.25 * pop
    ]

    ODESystem(eqs; name)
end

function agriculture(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @variables aiph(t) al(t) fioaa(t)

    eqs = [
        aiph ~ interpolate(t, tables[:aiph], ranges[:aiph])
        al ~ interpolate(t, tables[:al], ranges[:al]) * (1e8)
        fioaa ~ interpolate(t, tables[:fioaa], ranges[:fioaa])
    ]

    ODESystem(eqs; name)
end

function non_renewable(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @variables fcaor(t)

    eqs = [
        fcaor ~ interpolate(t, tables[:fcaor], ranges[:fcaor])
    ]

    ODESystem(eqs; name)
end

function industrial_subsector(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @parameters pyear = params[:pyear]
    @parameters icor1 = params[:icor1]
    @parameters icor2 = params[:icor2]
    @parameters alic1 = params[:alic1]
    @parameters alic2 = params[:alic2]
    @parameters iet = params[:iet]
    @parameters iopcd = params[:iopcd]
    @parameters fioac1 = params[:fioac1]
    @parameters fioac2 = params[:fioac2]

    @variables pop(t) fcaor(t) cuf(t) fioaa(t) fioas(t)
    @variables ic(t) = inits[:ic0]
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
        fioacv ~ interpolate(iopc / iopcd, tables[:fioacv], ranges[:fioacv])
    ]

    ODESystem(eqs; name)
end

function service_subsector(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @parameters pyear = params[:pyear]
    @parameters alsc1 = params[:alsc1]
    @parameters alsc2 = params[:alsc2]
    @parameters scor1 = params[:scor1]
    @parameters scor2 = params[:scor2]

    @variables iopc(t) io(t) cuf(t) pop(t)
    @variables sc(t) = inits[:sc0]
    @variables isopc(t) isopc1(t) isopc2(t) fioas(t) fioas1(t) fioas2(t) scir(t) scdr(t) alsc(t) so(t) sopc(t) scor(t)

    eqs = [
        isopc ~ clip(isopc2, isopc1, t, pyear)
        isopc1 ~ interpolate(iopc, tables[:isopc1], ranges[:isopc1])
        isopc2 ~ interpolate(iopc, tables[:isopc2], ranges[:isopc2])
        fioas ~ clip(fioas2, fioas1, t, pyear)
        fioas1 ~ interpolate(sopc / isopc, tables[:fioas1], ranges[:fioas1])
        fioas2 ~ interpolate(sopc / isopc, tables[:fioas2], ranges[:fioas2])
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

function job_subsector(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @parameters lfpf = params[:lfpf]
    @parameters lufdt = params[:lufdt]

    @variables ic(t) iopc(t) sc(t) sopc(t) al(t) aiph(t) p2(t) p3(t)
    @variables lufd(t) = inits[:lufd0]
    @variables j(t) pjis(t) jpicu(t) pjss(t) jpscu(t) pjas(t) jph(t) lf(t) luf(t) cuf(t)

    eqs = [
        j ~ pjis + pjas + pjss
        pjis ~ ic * jpicu
        jpicu ~ interpolate(iopc, tables[:jpicu], ranges[:jpicu]) * (1e-3)
        pjss ~ sc * jpscu
        jpscu ~ interpolate(sopc, tables[:jpscu], ranges[:jpscu]) * (1e-3)
        pjas ~ jph * al
        jph ~ interpolate(aiph, tables[:jph], ranges[:jph])
        lf ~ (p2 + p3) * lfpf
        luf ~ j / lf
        D(lufd) ~ (luf - lufd) / lufdt
        cuf ~ interpolate(lufd, tables[:cuf], ranges[:cuf])
    ]

    ODESystem(eqs; name)
end


end # module
