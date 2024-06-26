@variables t
D = Differential(t)

function population(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @parameters gc = params[:gc]
    @parameters pop2 = params[:pop2]
    @parameters popi = params[:popi]
    @parameters zpgt = params[:zpgt]

    @variables pop(t), pop1(t)

    eqs = [
        pop ~ clip(pop2, pop1, t, zpgt)
        pop1 ~ popi * exp(gc * (t - 1900))
    ]

    ODESystem(eqs, t; name)
end

function industrial_output(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @parameters icor = params[:icor]

    @variables ic(t) fcaor(t) pop(t)
    @variables io(t) iopc(t)

    eqs = [
        io ~ ic * (1 - fcaor) / icor
        iopc ~ io / pop
    ]

    ODESystem(eqs, t; name)
end

function industrial_capital(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @parameters fioaa = params[:fioaa]
    @parameters fioas = params[:fioas]
    @parameters fioac = params[:fioac]
    @parameters alic = params[:alic]

    @variables io(t)
    @variables ic(t) = inits[:ic]
    @variables icir(t) icdr(t)

    eqs = [
        D(ic) ~ icir - icdr
        icir ~ io * (1 - fioaa - fioas - fioac)
        icdr ~ ic / alic
    ]

    ODESystem(eqs, t; name)
end

function non_renewable(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @parameters nri = params[:nri] # Line 129.1 Appendix A
    @parameters nruf1 = params[:nruf1]
    @parameters nruf2 = params[:nruf2]
    @parameters pyear = params[:pyear]

    @variables pop(t) iopc(t)
    @variables nr(t) = params[:nri]
    @variables nrur(t) nruf(t) pcrum(t) nrfr(t) fcaor(t) fcaor1(t) fcaor2(t)

    eqs = [
        D(nr) ~ -nrur # Line 129 Appendix A
        nrur ~ pop * pcrum * nruf # Line 130 Appendix A
        nruf ~ clip(nruf2, nruf1, t, pyear) # Line 131 Appendix A
        pcrum ~ interpolate(iopc, tables[:pcrum], ranges[:pcrum]) # Line 132 Appendix A
        nrfr ~ nr / nri # Line 133 Appendix A
        fcaor ~ clip(fcaor2, fcaor1, t, pyear) # Line 134 Appendix A
        fcaor1 ~ interpolate(nrfr, tables[:fcaor1], ranges[:fcaor1]) # Line 135 Appendix A
        fcaor2 ~ interpolate(nrfr, tables[:fcaor2], ranges[:fcaor2]) # Line 136 Appendix A
    ]

    ODESystem(eqs, t; name)
end
