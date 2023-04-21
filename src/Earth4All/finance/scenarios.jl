function finance_run(; kwargs...)
    @named fin = finance(; kwargs...)
    @named fin_sup = finance_support(; kwargs...)

    systems = [
        fin, fin_sup
    ]

    connection_eqs = [
        fin.OGR ~ fin_sup.OGR
        fin.IR ~ fin_sup.IR
        fin.UR ~  fin_sup.UR
    ]

    return WorldDynamics.compose(systems, connection_eqs)
end
