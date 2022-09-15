inits = Dict{Symbol, Float64}(
    :t0 => 1900,
    :ppol => 2.5e7,
    :pcti => 1,
)

inits[:pcrum] = interpolate(inits[:t0], tables[:pcrum], ranges[:pcrum]) * 1e-2
inits[:pop] = interpolate(inits[:t0], tables[:pop], ranges[:pop]) * 1e8
inits[:ppgio] = inits[:pcrum] * inits[:pop] * params[:frpm] * params[:imef] * params[:imti]
inits[:aiph] = interpolate(inits[:t0], tables[:aiph], ranges[:aiph])
inits[:al] = interpolate(inits[:t0], tables[:al], ranges[:al]) * 1e8
inits[:ppgao] = inits[:aiph] * inits[:al] * params[:fipm] * params[:amti]
inits[:ppgr] = (inits[:ppgio] + inits[:ppgao]) * params[:ppgf1]
inits[:pptd] = clip(params[:pptd2], params[:pptd1], inits[:t0], params[:pyear])
inits[:ppapr3] = inits[:pptd] * inits[:ppgr] / 3
inits[:ppgf22] = inits[:pcti]
inits[:ppolx] = inits[:ppol] / params[:ppol70]
inits[:lmp1] = interpolate(inits[:ppolx], tables[:lmp1], ranges[:lmp1])
inits[:lmp2] = interpolate(inits[:ppolx], tables[:lmp2], ranges[:lmp2])
inits[:lmp] = clip(inits[:lmp2], inits[:lmp1], inits[:t0], params[:pyear])
inits[:plmp] = inits[:lmp]
