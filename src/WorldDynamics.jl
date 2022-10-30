module WorldDynamics

include("plotvariables.jl")
include("solvesystems.jl")
include("functions.jl")

export plotvariables
export solve
export interpolate, clip, switch

using ModelingToolkit

@register interpolate(x, y::Tuple{Vararg{Float64}}, xs::Tuple{Float64, Float64})
@register clip(f1, f2, va, th)
@register switch(v1, v2, z)
@register WorldDynamics.step(t, hght, sttm)

include("World1/World1.jl")
include("World1A/World1A.jl")
include("World2/World2.jl")
include("World3/World3.jl")
include("World3_91/World3_91.jl")
include("World3_03/World3_03.jl")

export World1
export World1A
export World2
export World3
export World3_91
export World3_03

end
