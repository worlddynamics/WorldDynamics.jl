_inits = Dict{Symbol, Float64}(
    :t0 => 1900,
    :ppol => 2.5e7, # Line 142.1 Appendix A
    :pcti => 1,
)

_inits[:pcrum] = interpolate(_inits[:t0], _tables[:pcrum], _ranges[:pcrum]) * 1e-2
_inits[:pop] = interpolate(_inits[:t0], _tables[:pop], _ranges[:pop]) * 1e8
_inits[:ppgio] = _inits[:pcrum] * _inits[:pop] * _params[:frpm] * _params[:imef] * _params[:imti]
_inits[:aiph] = interpolate(_inits[:t0], _tables[:aiph], _ranges[:aiph])
_inits[:al] = interpolate(_inits[:t0], _tables[:al], _ranges[:al]) * 1e8
_inits[:ppgao] = _inits[:aiph] * _inits[:al] * _params[:fipm] * _params[:amti]
_inits[:ppgr] = (_inits[:ppgio] + _inits[:ppgao]) * _params[:ppgf1]
_inits[:pptd] = clip(_params[:pptd2], _params[:pptd1], _inits[:t0], _params[:pyear])
_inits[:ppapr3] = _inits[:pptd] * _inits[:ppgr] / 3
_inits[:ppgf22] = _inits[:pcti]
_inits[:ppolx] = _inits[:ppol] / _params[:ppol70]
_inits[:lmp1] = interpolate(_inits[:ppolx], _tables[:lmp1], _ranges[:lmp1])
_inits[:lmp2] = interpolate(_inits[:ppolx], _tables[:lmp2], _ranges[:lmp2])
_inits[:lmp] = clip(_inits[:lmp2], _inits[:lmp1], _inits[:t0], _params[:pyear])
_inits[:plmp] = _inits[:lmp]


getinitialisations() = copy(_inits)
