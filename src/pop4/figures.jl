include("../plotvariables.jl")
include("../common_pop/CommonPop.jl")
include("Pop4.jl")
include("odesystem.jl")


sol = solvepop4()


@named pop = Pop4.population()
@named br = CommonPop.birth_rate()
@named dr = CommonPop.death_rate()
@named so = CommonPop.service_output()
@named io = CommonPop.industrial_output()
@named f = CommonPop.food()

@variables t


fig_2_84_variables = [
    (pop.pop, 0, 1.6e10),
    (br.cbr, 0, 50),
    (dr.cdr, 0, 50),
    (so.sopc, 0, 1000),
    (dr.fpu, 0, 1),
    (f.fpc, 0, 1000),
    (dr.le, 0, 80),
    (br.fce, 0.5, 1),
    (io.iopc, 0, 1000)
]

plotvariables(sol, t, fig_2_84_variables, name="Fig. 2.84", showlegend=true, showaxis=true, colored=true)
