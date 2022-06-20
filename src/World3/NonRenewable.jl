module NonRenewable


using Interpolations, ModelingToolkit

include("../functions.jl")
include("nonrenewable/tables.jl")
include("nonrenewable/parameters.jl")
include("nonrenewable/initialisations.jl")


@register interpolate(x, y::NTuple, xs::Tuple)
@register clip(f1, f2, va, th)

@variables t
D = Differential(t)


function population(; name)
    @parameters gc = gcv pop2 = pop2v popi = popiv zpgt = zpgtv

    @variables pop(t), pop1(t)
    
    eqs = [
        pop ~ clip(pop2, pop1, t, zpgt)
        pop1 ~ popi * exp(gc * (t - 1900))
    ]
    
    ODESystem(eqs; name)
end

function industrial_output(; name)
    @parameters icor = icorv
    
    @variables ic(t) fcaor(t) pop(t)
    @variables io(t) iopc(t)
    
    eqs = [
        io ~ ic * (1 - fcaor) / icor
        iopc ~ io / pop
    ]
    
    ODESystem(eqs; name)
end

function industrial_capital(; name)
    @parameters fioaa = fioaav fioas = fioasv fioac = fioacv alic = alicv

    @variables io(t)
    @variables ic(t) = ic0 
    @variables icir(t) icdr(t)
    
    eqs = [
        D(ic) ~ icir - icdr
        icir ~ io * (1 - fioaa - fioas - fioac)
        icdr ~ ic / alic
    ]
    
    ODESystem(eqs; name)
end

function non_renewable(; name)
    @parameters nri = nriv nruf1 = nruf1v nruf2 = nruf2v pyear = pyearv

    @variables pop(t) iopc(t)
    @variables nr(t) = nr0
    @variables nrur(t) nruf(t) pcrum(t) nrfr(t) fcaor(t) fcaor1(t) fcaor2(t) 
    
    eqs = [
        D(nr) ~ -nrur
        nrur ~ pop * pcrum * nruf
        nruf ~ clip(nruf2, nruf1, t, pyear)
        pcrum ~ interpolate(iopc, pcrumt, pcrumts)
        nrfr ~ nr / nri
        fcaor ~ clip(fcaor2, fcaor1, t, pyear)
        fcaor1 ~ interpolate(nrfr, fcaor1t, fcaor1ts)
        fcaor2 ~ interpolate(nrfr, fcaor2t, fcaor2ts)
    ]
    
    ODESystem(eqs; name)
end

    
end # module
