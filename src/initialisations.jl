global pop0 = 1.61e9 # lines 1-3 page 167
global sopc0 = (1.5e11 * exp(ltv * 0.030)) / pop0 # lines 76-82 page 168
global hsapc0 = interpolate(sopc0, hsapct, hsapcts) # lines 11-12 page 167
global ehspc0 = hsapc0 # lines 13-14 page 167
global fpc0 = (4e11 * exp(ltv * 0.020)) / pop0 # lines 83-89 page 168
global lmf0 = interpolate(fpc0 / sfpcv, lmft, lmfts) # lines 8-10 page 167
global lmhs0 = interpolate(ehspc0, lmhs2t, lmhs2ts) # lines 15-20 page 167
global ppolx0 = 1.0 # lines 73-75 page 168
global lmp0 = interpolate(ppolx0, lmpt, lmpts) # lines 26-27 page 167
global iopc0 = (0.7e11 * exp(ltv * 0.037)) / pop0 # lines 64-72 page 168
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
global cmple0 = interpolate(ple0, cmplet, cmplets) # lines 39-40 page 168
global dtf0 = dcfs0 * cmple0 # line 38 page 168
global nfc0 = 0.0 # mtf0 / dtf0 - 1.0 # line 56 page 168
global fsafc0 = interpolate(nfc0, fsafct, fsafcts) # lines 62-63 page 168
global fcapc0 = fsafc0 * sopc0 # line 61 page 168