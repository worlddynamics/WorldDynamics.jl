using Interpolations

function interpolate(x::Float64, yvalues::Tuple{Vararg{Float64}}, xrange::Tuple{Float64, Float64})::Float64
    expanded_xrange = LinRange(xrange[1], xrange[2], length(yvalues))
    if (x <= xrange[1])
        return yvalues[1]
    end
    if (x >= xrange[2])
        return yvalues[end]
    end
    li = LinearInterpolation(expanded_xrange, collect(yvalues))
    return li(x)
end

clip(returnifgte::Float64, returniflt::Float64, inputvalue::Float64, threshold::Float64) = inputvalue >= threshold ? returnifgte : returniflt
step(inputvalue::Float64, returnifgte::Float64, threshold::Float64) = clip(returnifgte, zero(returnifgte), inputvalue, threshold)
switch(returnifzero::Float64, returnifnotzero::Float64, inputvalue::Float64) = isapprox(inputvalue, zero(inputvalue); atol=1e-16) ? returnifzero : returnifnotzero
