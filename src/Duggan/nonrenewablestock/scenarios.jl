function nrs_run(; kwargs...)
    @named nrs = non_renewable_stock(; kwargs...)
    return nrs
end
