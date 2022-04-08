# FOUR-LEVEL POPULATION
global p10 = 65e7
global p20 = 70e7
global p30 = 19e7
global p40 = 6e7
global pop0 = p10 + p20 + p30 + p40
# POPULATION SECTOR
global sopc0 = 1.5e11 / pop0 # lines 76-82 page 168
global hsapc0 = interpolate(sopc0, hsapct, hsapcts) # lines 11-12 page 167
global ehspc0 = hsapc0 # lines 13-14 page 167
global fpc0 = 4e11 / pop0 # lines 83-89 page 168
global lmf0 = interpolate(fpc0 / sfpcv, lmft, lmfts) # lines 8-10 page 167
global lmhs0 = interpolate(ehspc0, lmhs1t, lmhs1ts) # lines 15-20 page 167
global ppolx0 = 1.0 # lines 73-75 page 168
global lmp0 = interpolate(ppolx0, lmpt, lmpts) # lines 26-27 page 167
global iopc0 = 0.7e11 / pop0 # lines 64-72 page 168
global cmi0 = interpolate(iopc0, cmit, cmits) # lines 23-24 page 167
global fpu0 = interpolate(pop0, fput, fputs) # lines 21-22 page 167
global lmc0 = 1 - cmi0 * fpu0 # line 25 page 167
global le0 = lenv * lmf0 * lmhs0 * lmp0 * lmc0 # lines 6-7 page 167
global fm0 = interpolate(le0, fmt, fmts) # lines 36-37 page 168
global mtf0 = mtfnv * fm0 # lines 34-35 page 168
global frsn0 = 0.82 # lines 50-52 page 168
global sfsn0 = interpolate(iopc0, sfsnt, sfsnts)  # lines 46-49 page 168
global dcfs0 = dcfsnv * frsn0 * sfsn0 # lines 43-45 page 168
global ple0 = le0 # lines 41-42 page 168
global ple10 = le0
global ple20 = le0
global diopc0 = iopc0
global diopc10 = iopc0
global diopc20 = iopc0
global aiopc0 = iopc0
global cmple0 = interpolate(ple0, cmplet, cmplets) # lines 39-40 page 168
global dtf0 = dcfs0 * cmple0 # line 38 page 168
global nfc0 = mtf0 / dtf0 - 1.0 # line 56 page 168
global fsafc0 = interpolate(nfc0, fsafct, fsafcts) # lines 62-63 page 168
global fcapc0 = fsafc0 * sopc0 # line 61 page 168
# TODO: see which ones of the following are necessary 
global fcfpc0 = fcapc0 # line 60 page 168
global fcfpc10 = fcapc0
global fcfpc20 = fcapc0
global fce0 = interpolate(fcfpc0, fcet, fcets) # lines 57-59 page 168
global tf0 = min(mtf0, mtf0 * (1 - fce0) + dtf0 * fce0) # line 33 page 168
global br0 = tf0 * pop0 * ffwv / rltv # lines 28-31 page 168
global cbr0 = 1000 * br0 / pop0 # line 32 page 168
# CAPITAL SECTOR
global ic0 = 2.1e11
global sc0 = 1.44e11
global cuf0 = 1
global lufd0 = 1.0
# AGRICULTURAL SECTOR
global al0 = 9e8
global pal0 = 2.3e9
global ai0 = 5e9
global uil0 = 8.2e6
global lfert0 = 600
global pfr0 = 1
# NONRENEWABLE SECTOR
global nr0 = 1e12
global ic0 = 2.1e11
# POLLUTION SECTOR
global pcrum0 = interpolate(t0, pcrumt, pcrumts) * 1e-2
global pop0 = interpolate(t0, popt, popts) * 1e8
global ppgio0 = pcrum0 * pop0 * frpmv * imefv * imtiv
global aiph0 = interpolate(t0, aipht, aiphts)
global al0 = interpolate(t0, alt, alts) * 1e8
global ppgao0 = aiph0 * al0 * fipmv * amtiv
global ppgr0 = (ppgio0 + ppgao0) * ppgf1v
global ppapr30 = pptdv * ppgr0 / 3
global ppapr20 = ppapr30
global ppapr10 = ppapr30
global ppol0 = 2.5e7
global pcti0 = 1