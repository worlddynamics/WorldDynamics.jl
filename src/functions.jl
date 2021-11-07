function fpu(t::Float64)
    return tabhl(fput, pop(t), 0.0, 16.0e9, 2.0e9)
end

function hsapc(t::Float64)
    return tabhl(hsapct, sopc(t), 0.0, 2000.0, 250.0)
end

function lmf(t::Float64)
    return tabhl(lmft, fpc(t) / sfpc(t), 0.0, 5.0, 1.0)
end

function lmhs(t::Float64)
    if (t < 1940)
        return lmhs1(t)
    else
        return lmhs2(t)
    end
end

function lmhs1(t::Float64)
    return tabhl(lmhs1t, ehspc(t), 0.0, 100.0, 20.0)
end

function lmhs2(t::Float64)
    return tabhl(lmhs2t, ehspc(t), 0.0, 100.0, 20.0)
end
