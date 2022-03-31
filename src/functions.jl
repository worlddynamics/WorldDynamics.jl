function interpolate(x, y, xs)
    xs = LinRange(xs[1], xs[2], xs[3])
    if (x < xs[1])
        return y[1]
    end
    if (x > xs[length(xs)])
        return y[length(xs)]
    end
    li = LinearInterpolation(xs, collect(y))
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
function step(t, hght, sttm)
    if (t < sttm)
        return 0
    else
        return hght
    end
end
