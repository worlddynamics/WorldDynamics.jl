using Interpolations

"""
   `interpolate(x, y, xs)`

Return the value of a function with input `x`, by linearly interpolating the function itself through the table `y` and the range `xs`. If `x` is out of the range, the value at the corresponding extremity is returned.
"""
function interpolate(x, y, xs)
    expanded_xs = LinRange(xs[1], xs[2], length(y))
    if (x < expanded_xs[1])
        return y[1]
    end
    if (x > expanded_xs[length(expanded_xs)])
        return y[length(expanded_xs)]
    end
    li = LinearInterpolation(expanded_xs, collect(y))
    return li(x)
end

"""
   `clip(f1, f2, va, th)`

Return `f1` if the value `v` is greater than the threshold `th`, `f2` otherwise.
"""
function clip(f1, f2, va, th)
    if (va >= th)
        return f1
    else
        return f2
    end
end

"""
   `min(v1, v2)`

Return the minimum between `v1` and `v2`.
"""
function min(v1, v2)
    if (v1 < v2)
        return v1
    else
        return v2
    end
end

"""
   `max(v1, v2)`

Return the maximum between `v1` and `v2`.
"""
function max(v1, v2)
    if (v1 > v2)
        return v1
    else
        return v2
    end
end

"""
   `step(t, hght, sttm)`

Return `0` if the value `t` is smaller than the threshold `sttm`, `hght` otherwise.
"""
function step(t, hght, sttm)
    if (t < sttm)
        return 0
    else
        return hght
    end
end

"""
   `switch(v1, v2, z)`

Return `v1` if the value `z` is approximately `0` with tolerance `1e-16`, `v2` otherwise.
"""
function switch(v1, v2, z)
    # TODO: this atol value is arbitrary, we should compute a proper value
    if isapprox(z, 0.0; atol=1e-16)
        return v1
    else
        return v2
    end
end
