using ModelingToolkit, DifferentialEquations

include("Capital.jl")


function solvecapital()
    @named pop = Capital.population()
    @named nr = Capital.non_renewable()
    @named ag = Capital.agriculture()
    @named is = Capital.industrial_subsector()
    @named ss = Capital.service_subsector()
    @named js = Capital.job_subsector()

    connection_eqs = [
        is.pop ~ pop.pop
        is.fcaor ~ nr.fcaor
        is.cuf ~ js.cuf
        is.fioaa ~ ag.fioaa
        is.fioas ~ ss.fioas
        ss.iopc ~ is.iopc
        ss.io ~ is.io
        ss.cuf ~ js.cuf
        ss.pop ~ pop.pop
        js.ic ~ is.ic
        js.iopc ~ is.iopc
        js.sc ~ ss.sc
        js.sopc ~ ss.sopc
        js.al ~ ag.al
        js.aiph ~ ag.aiph
        js.p2 ~ pop.p2
        js.p3 ~ pop.p3
    ]

    @variables t

    @named _cap_model = ODESystem(connection_eqs, t)
    @named cap_model = compose(_cap_model, [pop, nr, ag, is, ss, js])

    cap_sys = structural_simplify(cap_model)

    prob = ODEProblem(cap_sys, [], (1900, 1970.0))
    sol = solve(prob, Tsit5())

    return sol
end
