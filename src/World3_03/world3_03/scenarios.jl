function scenario1(; kwargs...)
    pop_tables = World3.Pop4.gettables()
    pop_tables[:sfsn] = (1.25, 0.94, 0.715, 0.59, 0.5)

    system = World3_91.scenario1(; pop_tables=pop_tables, kwargs...)

    @named dr = World3.Pop4.death_rate()
    @named is = World3.Capital.industrial_subsector()
    @named pp = World3.Pollution.persistent_pollution()
    @named ld = World3.Agriculture.land_development()
    @named leuiu = World3.Agriculture.land_erosion_urban_industrial_use()
    @named hwi = NewEquations.human_welfare_index()
    @named hef = NewEquations.human_ecological_footprint()

    connection_eqs = [
        hwi.le ~ dr.le
        hwi.iopc ~ is.iopc
        hef.ppgr ~ pp.ppgr
        hef.al ~ ld.al
        hef.uil ~ leuiu.uil
    ]

    @named _new_system = ODESystem(vcat(equations(system), connection_eqs), t)
    @named new_system = ModelingToolkit.compose(_new_system, hwi, hef)

    return new_system
end
