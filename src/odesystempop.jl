using Interpolations, ModelingToolkit, OrdinaryDiffEq
using Plots

include("functions.jl")
include("tablespop.jl")
include("parameters.jl")
include("initialisations.jl")

# Parameter declarations
@parameters len sfpc hsid iphst ffw rlt pet mtfn lpd zpgt dcfsn sad ieat fcest lt lt2 cio cso cfood
# Function declarations
@variables t pop(t) br(t) dr(t) cdr(t) le(t) lmf(t) hsapc(t) ehspc(t) lmhs(t) lmhs1(t) lmhs2(t) fpu(t) cmi(t) lmc(t) lmp(t) cbr(t) tf(t) mtf(t) fm(t) dtf(t) cmple(t) ple(t) ple2(t) ple1(t) dcfs(t) sfsn(t) diopc(t) diopc2(t) diopc1(t) frsn(t) fie(t) aiopc(t) nfc(t) fce(t) fcfpc(t) fcfpc2(t) fcfpc1(t) fcapc(t) fsafc(t) iopc(t) ppolx(t) sopc(t) fpc(t)
D = Differential(t)
# Registered functions used in equations
@register interpolate(x, xs::AbstractVector, y::AbstractVector)
@register clip(f1, f2, va, th)
@register min(v1, v2)
# Equations
eqs = [
    # POPULATION LEVEL EQUATIONS
    D(pop) ~ br - dr, # line 1 page 167
    # DEATH RATE EQUATIONS
    dr ~ pop / le, # line 4 page 167
    cdr ~ 1000.0 * dr / pop, # line 5 page 167
    le ~ len * lmf * lmhs * lmp * lmc, # line 6 page 167
    lmf ~ interpolate(fpc / sfpc, lmft, lmfts), # line 8 page 167
    hsapc ~ interpolate(sopc, hsapct, hsapcts), # line 11 page 167
    D(ehspc) ~ (hsapc - ehspc) / hsid, # line 13 page 167
    lmhs ~ clip(lmhs2, lmhs1, t, iphst), # line 15 page 167
    lmhs1 ~ interpolate(ehspc, lmhs1t, lmhs1ts), # line 17 page 167
    lmhs2 ~ interpolate(ehspc, lmhs2t, lmhs2ts), # line 19 page 167
    fpu ~ interpolate(pop, fput, fputs), # line 21 page 167
    cmi ~ interpolate(iopc, cmit, cmits), # line 23 page 167
    lmc ~ 1 - (cmi * fpu),  # line 25 page 167
    lmp ~ interpolate(ppolx, lmpt, lmpts), # line 26 page 167
    # BIRTH RATE EQUATIONS
    br ~ clip(dr, lmhs1, tf * pop * ffw / rlt, pet), # line 28 page 168
    cbr ~ 1000.0 * br / pop, # line 32 page 168
    tf ~ min(mtf, mtf * (1 - fce) + dtf * fce), # line 33 page 168
    mtf ~ mtfn * fm, # line 34 page 168
    fm ~ interpolate(le, fmt, fmts), # line 36 page 168
    dtf ~ dcfs * cmple, # line 38 page 168
    cmple ~ interpolate(ple, cmplet, cmplets), # line 39 page 168
    D(ple) ~ 3 * (ple2 - ple) / lpd, # line 41 page 168
    D(ple2) ~ 3 * (ple1 - ple2) / lpd, # line 41 page 168
    D(ple1) ~ 3 * (le - ple1) / lpd, # line 41 page 168
    dcfs ~ clip(2, dcfsn * frsn * sfsn, t, zpgt), # line 43 page 168
    sfsn ~ interpolate(diopc, sfsnt, sfsnts), # line 46 page 168
    D(diopc) ~ 3 * (diopc2 - diopc) / sad, # line 48 page 168
     D(diopc2) ~ 3 * (diopc1 - diopc2) / sad, # line 48 page 168
    D(diopc1) ~ 3 * (iopc - diopc1) / sad, # line 48 page 168
    frsn ~ interpolate(fie, frsnt, frsnts), # line 50 page 168
    fie ~ (iopc - aiopc) / aiopc, # line 53 page 168
    D(aiopc) ~ (iopc - aiopc) / ieat, # line 54 page 168
    nfc ~ (mtf / dtf) - 1, # line 56 page 168
    fce ~ clip(1.0, interpolate(fcfpc, fcet, fcets), t, fcest), # line 57 page 168
    D(fcfpc) ~ 3 * (fcfpc2 - fcfpc) / hsid, # line 60 page 168
    D(fcfpc2) ~ 3 * (fcfpc1 - fcfpc2) / hsid, # line 60 page 168
    D(fcfpc1) ~ 3 * (fcapc - fcfpc1) / hsid, # line 60 page 168
    fcapc ~ fsafc * sopc, # line 61 page 168
    fsafc ~ interpolate(nfc, fsafct, fsafcts), # line 62 page 168
    # EXOGENOUS INPUTS TO THE POPULATION SECTOR
    # INDUSTRIAL OUTPUT
    # io ~ clip(io2, io1, t, lt), # line 64 page 168
    # io1 ~ clip(io12, io11, t, lt2), # line 66 page 168
    # io11 ~ 0.7e11 * exp(t * 0.037), # line 68 page 168
    # io12 ~ pop * cio, # line 69 page 168
    # io2 ~ 0.7e11 * exp(lt * 0.037), # line 71 page 168
    iopc ~ (0.7e11 * exp(lt * 0.037)) / pop, # line 72 page 168
    # INDEX OF PERSISTENT POLLUTION
    ppolx ~ t / t, # line 73,74,75 page 168
    # SERVICE OUTPUT
    # so ~ clip(so2, so1, t, lt), # line 76 page 168
    # so1 ~ clip(so12, so11, t, lt2), # line 77 page 168
    # so11 ~ 1.5e11 * exp(t * 0.030), # line 78 page 168
    # so12 ~ pop * cso, # line 79 page 168
    # so2 ~ 1.5e11 * exp(lt * 0.030), # line 81 page 168
    sopc ~ (1.5e11 * exp(lt * 0.030)) / pop, # line 82 page 168
    # FOOD
    # f ~ clip(f2, f1, t, lt), # line 86 page 168
    # f1 ~ clip(f12, f11, t, lt2), # line 87 page 168
    # f11 ~ 4e11 * exp(t * 0.020), # line 88 page 168
    # f12 ~ pop * cfood, # line 89 page 168
    # f2 ~ 4e11 * exp(lt * 0.020), # line 91 page 168
    fpc ~ (4e11 * exp(lt * 0.020)) / pop # line 92 page 168
    ]
# ODE system creation and simplification
@named sys = ODESystem(eqs)
sys = structural_simplify(sys)
# Initialisations
u0 = [pop => pop0, # lines 2-3 page 167
ehspc => ehspc0, # smooth at lines 13-14 page 167
ple => le0, # dlinf3 at line 41 page 168
ple1 => le0, # dlinf3 at line 41 page 168
ple2 => le0, # dlinf3 at line 41 page 168
diopc => iopc0, # dlinf3 at line 48 page 168
diopc1 => iopc0, # dlinf3 at line 48 page 168
diopc2 => iopc0, # dlinf3 at line 48 page 168
frsn => 0.82, # line 52 page 168
aiopc => iopc0, # smooth at line 54 page 168
fcfpc => fcapc0, # dlinf3 at line 60 page 168
fcfpc1 => fcapc0, # dlinf3 at line 60 page 168
fcfpc2 => fcapc0 # dlinf3 at line 60 page 168
]
# Parameters
p = [len => lenv, sfpc => sfpcv, hsid => hsidv, iphst => iphstv, # line 7,10,14,16 page 167
ffw => ffwv, rlt => rltv, pet => petv, mtfn => mtfnv, lpd => lpdv, # line 29,30,31,35,42 page 168
zpgt => zpgtv, dcfsn => dcfsnv, sad => sadv, ieat => ieatv, fcest => fcestv, # line 44,45,49,55,58 page 168
lt => ltv, lt2 => lt2v, cio => ciov, cso => csov, cfood => cfoodv] # line 65,67,70,80,90 page 168
# Time interval
tspan = (1930.0, 1975.0)
# ODE solution
prob = ODEProblem(sys, u0, tspan, p, jac=true)
sol = solve(prob, Tsit5())
plot(sol, vars=[(0, pop), (0, cdr), (0, cbr)])
    