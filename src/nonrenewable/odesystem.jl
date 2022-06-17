using ModelingToolkit, DifferentialEquations

include("NonRenewable.jl")


function solvenonrenewable()
    @named pop = NonRenewable.population()
    @named io = NonRenewable.industrial_output()
    @named ic = NonRenewable.industrial_capital()
    @named nr = NonRenewable.non_renewable()

    connection_eqs = [
        nr.pop ~ pop.pop
        nr.iopc ~ io.iopc
        io.ic ~ ic.ic
        io.fcaor ~ nr.fcaor
        io.pop ~ pop.pop
        ic.io ~ io.io
    ]

    @variables t

    @named _nr_model = ODESystem(connection_eqs, t)
    @named nr_model = compose(_nr_model, [nr, pop, io, ic])

    nr_sys = structural_simplify(nr_model)

    prob = ODEProblem(nr_sys, [], (1900, 2100.0))
    sol = solve(prob, Tsit5())
    
    return sol
end
