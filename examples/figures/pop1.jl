include("../../src/plotvariables.jl")
include("../solutions/solvepop1.jl")


sol = solvepop1()


@named pop = Pop1.population()
@named br = Pop1.birth_rate()
@named dr = Pop1.death_rate()
@named so = Pop1.service_output()
@named io = Pop1.industrial_output()
@named f = Pop1.food()

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

plotvariables(sol, (t, 1900.0, 1970.0), fig_2_84_variables, name="Fig. 2.84", showlegend=true, showaxis=true, colored=true)


fig_2_85_variables = [
    (dr.lmf,   0, 2,   "lmf"),
    (dr.lmhs,  0, 2,   "lmhs"),
    (dr.lmp,   0, 2,   "lmp"),
    (dr.lmc,   0, 2,   "lmc"),
    (dr.hsapc, 0, 250, "hsapc"),
    (dr.ehspc, 0, 250, "ehspc")
]

plotvariables(sol, (t, 1900.0, 1970.0), fig_2_85_variables, name="Fig. 2.85", showlegend=true, showaxis=true, colored=true)
