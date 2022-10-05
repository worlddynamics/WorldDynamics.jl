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
    @variables ic(t) = inits[:ic] # Line 52.1 Appendix A
    @variables iopc(t) io(t) icor(t) icdr(t) alic(t) icir(t) fioai(t) fioac(t) fioacc(t) fioacv(t)

    eqs = [
        iopc ~ io / pop # Line 49 Appendix A
        io ~ ic * (1 - fcaor) * cuf / icor # Line 50 Appendix A
        icor ~ clip(icor2, icor1, t, pyear) # Line 51 Appendix A
        D(ic) ~ icir - icdr # Line 52 Appendix A
        icdr ~ ic / alic # Line 53 Appendix A
        alic ~ clip(alic2, alic1, t, pyear) # Line 54 Appendix A
        icir ~ io * fioai # Line 55 Appendix A
        fioai ~ 1 - fioaa - fioas - fioac # Line 56 Appendix A
        fioac ~ clip(fioacv, fioacc, t, iet) # Line 57 Appendix A
        fioacc ~ clip(fioac2, fioac1, t, pyear) # Line 58 Appendix A
        fioacv ~ interpolate(iopc / iopcd, tables[:fioacv], ranges[:fioacv]) # Line 59 Appendix A
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
    @variables sc(t) = inits[:sc] # Line 67.1 Appendix A
    @variables isopc(t) isopc1(t) isopc2(t) fioas(t) fioas1(t) fioas2(t) scir(t) scdr(t) alsc(t) so(t) sopc(t) scor(t)

    eqs = [
        isopc ~ clip(isopc2, isopc1, t, pyear) # Line 60 Appendix A
        isopc1 ~ interpolate(iopc, tables[:isopc1], ranges[:isopc1]) # Line 61 Appendix A
        isopc2 ~ interpolate(iopc, tables[:isopc2], ranges[:isopc2]) # Line 62 Appendix A
        fioas ~ clip(fioas2, fioas1, t, pyear) # Line 63 Appendix A
        fioas1 ~ interpolate(sopc / isopc, tables[:fioas1], ranges[:fioas1]) # Line 64 Appendix A
        fioas2 ~ interpolate(sopc / isopc, tables[:fioas2], ranges[:fioas2]) # Line 65 Appendix A
        scir ~ io * fioas # Line 66 Appendix A
        D(sc) ~ scir - scdr # Line 67 Appendix A
        scdr ~ sc / alsc # Line 68 Appendix A
        alsc ~ clip(alsc2, alsc1, t, pyear) # Line 69 Appendix A
        so ~ sc * cuf / scor # Line 70 Appendix A
        sopc ~ so / pop # Line 71 Appendix A
        scor ~ clip(scor2, scor1, t, pyear) # Line 72 Appendix A
    ]

    ODESystem(eqs; name)
end

function job_subsector(; name, params=params, inits=inits, tables=tables, ranges=ranges)
    @parameters lfpf = params[:lfpf]
    @parameters lufdt = params[:lufdt]

    @variables ic(t) iopc(t) sc(t) sopc(t) al(t) aiph(t) p2(t) p3(t)
    @variables lufd(t) = inits[:lufd] # Line 82 Appendix A
    @variables cuf(t) = inits[:cuf] # Line 83.1 Appendix A
    @variables j(t) pjis(t) jpicu(t) pjss(t) jpscu(t) pjas(t) jph(t) lf(t) luf(t)

    eqs = [
        j ~ pjis + pjas + pjss # Line 73 Appendix A
        pjis ~ ic * jpicu # Line 74 Appendix A
        jpicu ~ interpolate(iopc, tables[:jpicu], ranges[:jpicu]) * (1e-3) # Line 75 Appendix A
        pjss ~ sc * jpscu # Line 76 Appendix A
        jpscu ~ interpolate(sopc, tables[:jpscu], ranges[:jpscu]) * (1e-3) # Line 77 Appendix A
        pjas ~ jph * al # Line 78 Appendix A
        jph ~ interpolate(aiph, tables[:jph], ranges[:jph]) # Line 79 Appendix A
        lf ~ (p2 + p3) * lfpf # Line 80 Appendix A
        luf ~ j / lf # Line 81 Appendix A
        D(lufd) ~ (luf - lufd) / lufdt # Line 82 Appendix A
        cuf ~ interpolate(lufd, tables[:cuf], ranges[:cuf]) # Line 83 Appendix A
    ]

    ODESystem(eqs; name)
end
