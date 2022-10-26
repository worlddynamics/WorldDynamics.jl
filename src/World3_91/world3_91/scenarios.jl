function scenario1(; kwargs...)
    agr_params = World3.Agriculture.getparameters()
    agr_params[:alln] = 1000

    pop_params = World3.Pop4.getparameters()
    pop_params[:dcfsn] = 3.8

    pop_tables = World3.Pop4.gettables()
    pop_tables[:lmf] = (0.0, 1.0, 1.43, 1.5, 1.5, 1.5)
    pop_tables[:lmhs2] = (1.0, 1.5, 1.9, 2.0, 2.0, 2.0)
    pop_tables[:fm] = (0.0, 0.2, 0.4, 0.6, 0.7, 0.75, 0.79, 0.84, 0.87)

    agr_tables = World3.Agriculture.gettables()
    agr_tables[:lymc] = (1.0, 3.0, 4.5, 5.0, 5.3, 5.6, 5.9, 6.1, 6.35, 6.6, 6.9, 7.2, 7.4, 7.6, 7.8, 8.0, 8.2, 8.4, 8.6, 8.8, 9.0, 9.2, 9.4, 9.6, 9.8, 10.0)

    nr_tables = World3.NonRenewable.gettables()
    nr_tables[:pcrum] = (0.0, 0.85, 2.6, 3.4, 3.8, 4.1, 4.4, 4.7, 5.0)

    system = World3.historicalrun(;
        pop_params=pop_params,
        agriculture_params=agr_params,
        pop_tables=pop_tables,
        agriculture_tables=agr_tables,
        nonrenewable_tables=nr_tables,
        kwargs...
    )

    return system
end
