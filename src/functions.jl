function interpolate(x, y, xs)
    expanded_xs = LinRange(xs[1], xs[2], xs[3])
    if (x < expanded_xs[1])
        return y[1]
    end
    if (x > expanded_xs[length(expanded_xs)])
        return y[length(expanded_xs)]
    end
    li = LinearInterpolation(expanded_xs, collect(y))
    return li(x)
end

function clip(f1, f2, va, th)
    if (va >= th)
        return f1
    else
        return f2
    end
end

function min(v1, v2)
    if (v1 < v2)
        return v1
    else
        return v2
    end
end

function max(v1, v2)
    if (v1 > v2)
        return v1
    else
        return v2
    end
end

function step(t, hght, sttm)
    if (t < sttm)
        return 0
    else
        return hght
    end
end

function switch(v1, v2, z)
    # TODO: this atol value is arbitrary, we should compute a proper value
    if isapprox(z, 0.0; atol=1e-16)
        return v1
    else
        return v2
    end
end