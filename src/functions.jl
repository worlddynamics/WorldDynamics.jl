using IfElse

interpolate(x, x₁, xₙ, y₁, yₙ) = y₁ + (x - x₁) * ((yₙ - y₁) / (xₙ - x₁))
function interpolate(x::Float64, yvalues::Tuple{Vararg{Float64}}, xrange::Tuple{Float64, Float64})::Float64
    xvalues = LinRange(xrange[1], xrange[2], length(yvalues))

    # y gets the min y value if less than the min x range
    #   or the max y value if greater than the max x range
    y = (x < xrange[1]) * yvalues[1] + (x > xrange[2]) * yvalues[end]

    # in case x is inside the range, y gets the interpolated value
    for i ∈ 1:length(yvalues)-1
        y += (x ≥ xvalues[i]) * (x ≤ xvalues[i+1]) * interpolate(x, xvalues[i], xvalues[i+1], yvalues[i], yvalues[i+1])
    end

    return y
end

clip(returnifgte::Float64, returniflt::Float64, inputvalue::Float64, threshold::Float64) = IfElse.ifelse(inputvalue ≥ threshold, returnifgte, returniflt)
step(inputvalue::Float64, returnifgte::Float64, threshold::Float64) = clip(returnifgte, zero(returnifgte), inputvalue, threshold)
switch(returnifzero::Float64, returnifnotzero::Float64, inputvalue::Float64) = IfElse.ifelse(isapprox(inputvalue, zero(inputvalue); atol=1e-16), returnifzero, returnifnotzero)
