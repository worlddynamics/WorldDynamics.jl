using IfElse


interpolate(x, x₁, xₙ, y₁, yₙ) = y₁ + (x - x₁) * ((yₙ - y₁) / (xₙ - x₁))

"""
   `interpolate(x, y, xs)`

Return the value of a function with input `x`, by linearly interpolating the function itself through the table `y` and the range `xs`. If `x` is out of the range, the value at the corresponding extremity is returned.
"""
function interpolate(x, yvalues::Tuple{Vararg{Float64}}, xrange::Tuple{Float64, Float64})
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

"""
   `clip(f1, f2, va, th)`

Return `f1` if the value `v` is greater than the threshold `th`, `f2` otherwise.
"""
clip(returnifgte, returniflt, inputvalue, threshold) = IfElse.ifelse(inputvalue ≥ threshold, returnifgte, returniflt)

"""
   `step(t, hght, sttm)`

Return `0` if the value `t` is smaller than the threshold `sttm`, `hght` otherwise.
"""
step(inputvalue, returnifgte, threshold) = clip(returnifgte, zero(returnifgte), inputvalue, threshold)

"""
   `switch(v1, v2, z)`

Return `v1` if the value `z` is approximately `0` with tolerance `1e-16`, `v2` otherwise.
"""
switch(returnifzero, returnifnotzero, inputvalue) = IfElse.ifelse(isapprox(inputvalue, zero(inputvalue); atol=1e-16), returnifzero, returnifnotzero)
