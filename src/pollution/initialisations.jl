# NONRENEWABLE SECTOR
global pcrum0 = interpolate(t0, pcrumt, pcrumts) * 1e-2
global pop0 = interpolate(t0, popt, popts) * 1e8
global ppgio0 = pcrum0 * pop0 * frpmv * imefv * imtiv
global aiph0 = interpolate(t0, aipht, aiphts)
global al0 = interpolate(t0, alt, alts) * 1e8
global ppgao0 = aiph0 * al0 * fipmv * amtiv
global ppgr0 = (ppgio0 + ppgao0) * ppgf1v
global pptd0 = clip(pptd2v, pptd1v, t0, pyearv)
global ppapr30 = pptd0 * ppgr0 / 3
global ppol0 = 2.5e7
global pcti0 = 1
global ppgf220 = pcti0
global ppolx0 = ppol0 / ppol70v
global lmp10 = interpolate(ppolx0, lmp1t, lmp1ts)
global lmp20 = interpolate(ppolx0, lmp2t, lmp2ts)
global lmp0 = clip(lmp20, lmp10, t0, pyearv)
global plmp0 = lmp0