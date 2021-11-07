function dehspc(ehspc, p, t::Float64)
    (hsapc(t) - ehspc) / hsid
end

function dpop(pop, p, t::Float64)::Float64
    (b(t) - r(t)) * pop
end
