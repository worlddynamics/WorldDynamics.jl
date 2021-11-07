using Interpolations, ModelingToolkit, OrdinaryDiffEq
using Plots

include("tablespop.jl")

@parameters len sfpc hsid iphst ffw rlt pet mtfn lpd zpgt dcfsn sad ieat fcest
@parameters lt lt2 cio cso cfood

@variables t pop(t) br(t) dr(t) cdr(t) le(t) lmf(t) hsapc(t) ehspc(t) 
@variables lmhs(t) lmhs1(t) lmhs2(t) fpu(t) cmi(t) lmc(t) lmp(t) cbr(t) tf(t) 
@variables mtf(t) fm(t) dtf(t) cmple(t) ple(t) ple2(t) ple1(t) dcfs(t) sfsn(t)
@variables diopc(t) diopc2(t) diopc1(t) frsn(t) fie(t) aiopc(t) nfc(t) fce(t)
@variables fcfpc(t) fcfpc2(t) fcfpc1(t) fcapc(t) fsafc(t)
# @variables io(t) io1(t) io11(t) io12(t) io2(t) iopc(t)
@variables iopc(t)
@variables ppolx(t)
# @variables so(t) so1(t) so11(t) so12(t) so2(t) sopc(t)
@variables sopc(t)
# @variables f(t) f1(t) f11(t) f12(t) f2(t) fpc(t)
@variables fpc(t)
D = Differential(t)

function interpolate(x, y, xs)
    li = LinearInterpolation(y, xs)
    return li(x)
end
@register interpolate(x, y::AbstractVector, xs::AbstractVector)
function clip(f1, f2, va, th)
    if (va >= th)
        return f1
    else
        return f2
    end
end
@register clip(f1, f2, va, th)
function min(v1, v2)
    if (v1 < v2)
        return v1
    else
        return v2
    end
end
@register min(v1, v2)

eqs = [
    # POPULATION LEVEL EQUATIONS
    D(pop) ~ br - dr, # line 1 page 167
    # DEATH RATE EQUATIONS
    dr ~ pop / le, # line 4 page 167
    cdr ~ 1000.0 * dr / pop, # line 5 page 167
    le ~ len * lmf * lmhs * lmp * lmc, # line 6 page 167
    lmf ~ interpolate(fpc / sfpc, lmft, lmfts), # line 8 page 167
    hsapc ~ interpolate(sopc, hsapct, hsapcts), # line 11 page 167
    D(ehspc) ~ (hsapc - ehspc) / hsid, # line 12 page 167
    lmhs ~ clip(lmhs2, lmhs1, t, iphst), # line 14 page 167
    lmhs1 ~ interpolate(ehspc, lmhs1t, lmhs1ts), # line 16 page 167
    lmhs2 ~ interpolate(ehspc, lmhs2t, lmhs2ts), # line 18 page 167
    fpu ~ interpolate(pop, fput, fputs), # line 20 page 167
    cmi ~ interpolate(iopc, cmit, cmits), # line 22 page 167
    lmc ~ 1 - (cmi * fpu),  # line 24 page 167
    lmp ~ interpolate(ppolx, lmpt, lmpts), # line 25 page 167
    # BIRTH RATE EQUATIONS
    br ~ clip(dr, lmhs1, tf * pop * ffw / rlt, pet), # line 27 page 168
    cbr ~ 1000.0 * br / pop, # line 31 page 168
    tf ~ min(mtf, mtf * (1 - fce) + dtf * fce), # line 32 page 168
    mtf ~ mtfn * fm, # line 33 page 168
    fm ~ interpolate(le, fmt, fmts), # line 35 page 168
    dtf ~ dcfs * cmple, # line 37 page 168
    cmple ~ interpolate(ple, cmplet, cmplets), # line 38 page 168
    D(ple) ~ 3 * (ple2 - ple) / lpd, # line 40 page 168
    ple ~ le, # line 40 page 168
    D(ple2) ~ 3 * (ple1 - ple2) / lpd, # line 40 page 168
    ple2 ~ le, # line 40 page 168
    D(ple1) ~ 3 * (le - ple1) / lpd, # line 40 page 168
    ple1 ~ le, # line 40 page 168
    dcfs ~ clip(2, dcfsn * frsn * sfsn, t, zpgt), # line 42 page 168
    sfsn ~ interpolate(diopc, sfsnt, sfsnts), # line 45 page 168
    D(diopc) ~ 3 * (diopc2 - diopc) / sad, # line 47 page 168
    diopc ~ iopc, # line 47 page 168
    D(diopc2) ~ 3 * (diopc1 - diopc2) / sad, # line 47 page 168
    diopc2 ~ iopc, # line 47 page 168
    D(diopc1) ~ 3 * (iopc - diopc1) / sad, # line 47 page 168
    diopc1 ~ iopc, # line 47 page 168
    frsn ~ interpolate(fie, frsnt, frsnts), # line 49 page 168
    fie ~ (iopc - aiopc) / aiopc, # line 52 page 168
    D(aiopc) ~ (iopc - aiopc) / ieat, # line 53 page 168
    nfc ~ (mtf / dtf) - 1, # line 55 page 168
    fce ~ clip(1.0, interpolate(fcfpc, fcet, fcets), t, fcest), # line 56 page 168
    D(fcfpc) ~ 3 * (fcfpc2 - fcfpc) / hsid, # line 59 page 168
    fcfpc ~ fcapc, # line 59 page 168
    D(fcfpc2) ~ 3 * (fcfpc1 - fcfpc2) / hsid, # line 59 page 168
    fcfpc2 ~ fcapc, # line 59 page 168
    D(fcfpc1) ~ 3 * (fcapc - fcfpc1) / hsid, # line 59 page 168
    fcfpc1 ~ fcapc, # line 59 page 168
    fcapc ~ fsafc * sopc, # line 60 page 168
    fsafc ~ interpolate(nfc, fsafct, fsafcts), # line 61 page 168
    # EXOGENOUS INPUTS TO THE POPULATION SECTOR
    # INDUSTRIAL OUTPUT
    # io ~ clip(io2, io1, t, lt), # line 63 page 168
    # io1 ~ clip(io12, io11, t, lt2), # line 65 page 168
    # io11 ~ 0.7e11 * exp(t * 0.037), # line 67 page 168
    # io12 ~ pop * cio, # line 68 page 168
    # io2 ~ 0.7e11 * exp(lt * 0.037), # line 70 page 168
    iopc ~ (0.7e11 * exp(lt * 0.037)) / pop, # line 71 page 168
    # INDEX OF PERSISTENT POLLUTION
    ppolx ~ t / t, # line 72,73,74 page 168
    # SERVICE OUTPUT
    # so ~ clip(so2, so1, t, lt), # line 75 page 168
    # so1 ~ clip(so12, so11, t, lt2), # line 76 page 168
    # so11 ~ 1.5e11 * exp(t * 0.030), # line 77 page 168
    # so12 ~ pop * cso, # line 78 page 168
    # so2 ~ 1.5e11 * exp(lt * 0.030), # line 80 page 168
    sopc ~ (1.5e11 * exp(lt * 0.030)) / pop, # line 81 page 168
    # FOOD
    # f ~ clip(f2, f1, t, lt), # line 85 page 168
    # f1 ~ clip(f12, f11, t, lt2), # line 86 page 168
    # f11 ~ 4e11 * exp(t * 0.020), # line 87 page 168
    # f12 ~ pop * cfood, # line 88 page 168
    # f2 ~ 4e11 * exp(lt * 0.020), # line 90 page 168
    fpc ~ (4e11 * exp(lt * 0.020)) / pop # line 91 page 168
    ]

@named sys = ODESystem(eqs)
sys = structural_simplify(sys)
    
u0 = [pop => 1.61e9, # line 3 page 167
frsn => 0.82] # line 51 page 168

p = [len => 28.0, sfpc => 230.0, hsid => 20.0, iphst => 40.0, # line 7,10,13,15 page 167
ffw => 0.21, rlt => 30, pet => 4000, mtfn => 12, lpd => 20, # line 28,29,30,34,41 page 168
zpgt => 4000, dcfsn => 4, sad => 20, ieat => 3, fcest => 4000, # line 43,44,48,54,57 page 168
lt => 500, lt2 => 500, cio => 100, cso => 150, cfood => 250] # line 64,66,69,79,89 page 168

tspan = (1930.0, 1975.0)
prob = ODEProblem(sys, u0, tspan, p, jac=true)
sol = solve(prob, Tsit5())
plot(sol,vars=[(0, pop), (0, cdr), (0, cbr)])
