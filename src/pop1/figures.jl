include("../plotvariables.jl")
include("../common_pop/CommonPop.jl")
include("Pop1.jl")
include("odesystem.jl")


sol = solvepop1()


@named pop = Pop1.population()
@named br = CommonPop.birth_rate()
@named dr = CommonPop.death_rate()
@named so = CommonPop.service_output()
@named io = CommonPop.industrial_output()
@named f = CommonPop.food()

@variables t


fig_2_84_variables = [
    (pop.pop, 0,   1.6e10, "pop"),
    (br.cbr,  0,   50,     "cbr"),
    (dr.cdr,  0,   50,     "cdr"),
    (so.sopc, 0,   1000,   "sopc"),
    (dr.fpu,  0,   1,      "fpu"),
    (f.fpc,   0,   1000,   "fpc"),
    (dr.le,   0,   80,     "le"),
    (br.fce,  0.5, 1,      "fce"),
    (io.iopc, 0,   1000,   "iopc")
]

plotvariables(sol, t, fig_2_84_variables, name="Fig. 2.84", showlegend=true, showaxis=true, colored=true)
