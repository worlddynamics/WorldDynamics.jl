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

min(v1::Float64, v2::Float64) = v1 < v2 ? v1 : v2
max(v1::Float64, v2::Float64) = v1 > v2 ? v1 : v2
clip(f1::Float64, f2::Float64, va::Float64, th::Float64) = va >= th ? f1 : f2
step(t::Float64, hght::Float64, sttm::Float64) = t < sttm ? zero(hght) : hght
switch(v1::Float64, v2::Float64, z::Float64) = isapprox(z, zero(z); atol=1e-16) ? v1 : v2
