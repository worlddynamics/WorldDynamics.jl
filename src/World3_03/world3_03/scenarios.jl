function scenario1(; kwargs...)
    pop_tables = World3.Pop4.gettables()
    pop_tables[:sfsn] = (1.25, 0.94, 0.715, 0.59, 0.5)

    return World3_91.scenario1(pop_tables=pop_tables)
end
