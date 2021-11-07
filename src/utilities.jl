function tabhl(tab::Vector{Float64}, x::Float64, xlow::Float64, xhigh::Float64, xincr::Float64)
    if (x < xlow)
        return tab[1]
    end
    if (x > xhigh)
        return tab[length(tab)]
    end
    if (x == xhigh)
        return tab[length(tab)]
    end
    i::Int64 = 1
    while (x >= (xlow + i * xincr))
        i = i + 1
    end
    return tab[i] + (tab[i + 1] - tab[i]) * (x - (xlow + (i - 1) * xincr)) / ((xlow + i * xincr) - (xlow + (i - 1) * xincr))
end