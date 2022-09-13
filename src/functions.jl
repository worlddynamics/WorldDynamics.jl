using Interpolations

function interpolate(x::Float64, y::Tuple{Vararg{Float64}}, xs::Tuple{Float64, Float64})::Float64
    expanded_xs = LinRange(xs[1], xs[2], length(y))
    if (x <= xs[1])
        return y[1]
    end
    if (x >= xs[2])
        return y[end]
    end
    li = LinearInterpolation(expanded_xs, collect(y))
    return li(x)
end

function clip(f1::Float64, f2::Float64, va::Float64, th::Float64)
    if (va >= th)
        return f1
    else
        return f2
    end
end

function min(v1::Float64, v2::Float64)
    if (v1 < v2)
        return v1
    else
        return v2
    end
end

function max(v1::Float64, v2::Float64)
    if (v1 > v2)
        return v1
    else
        return v2
    end
end

function step(t::Float64, hght::Float64, sttm::Float64)
    if (t < sttm)
        return 0.0
    else
        return hght
    end
end

function switch(v1::Float64, v2::Float64, z::Float64)
    # TODO: this atol value is arbitrary, we should compute a proper value
    if isapprox(z, 0.0; atol=1e-16)
        return v1
    else
        return v2
    end
end
