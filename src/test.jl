using DifferentialEquations
using Plots

include("constants.jl")
include("functions.jl")
include("ode.jl")
include("utilities.jl")

function test_tabhl(t::Float64)::Float64
    tab = [-20.0,0,10,16,20,24,30]
    xlow = -3.0
    xhigh = 3.0
    xincr = 1.0
    return tabhl(tab, t, xlow, xhigh, xincr)
end