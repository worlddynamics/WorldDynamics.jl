include("../../src/plotvariables.jl")
include("../solutions/solvepop4.jl")


sol = solvepop4()


@named pop = Pop4.population()
@named br = Pop4.birth_rate()
@named dr = Pop4.death_rate()
@named so = Pop4.service_output()
@named io = Pop4.industrial_output()
@named f = Pop4.food()

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


fig_2_85_variables = [
    (pop.p1 ./ (pop.p1 + pop.p2 + pop.p3 + pop.p4), 0, 1,   "p1"),
    (pop.p2 ./ (pop.p1 + pop.p2 + pop.p3 + pop.p4), 0, 1,   "p2"),
    (pop.p3 ./ (pop.p1 + pop.p2 + pop.p3 + pop.p4), 0, 1,   "p3"),
    (pop.p4 ./ (pop.p1 + pop.p2 + pop.p3 + pop.p4), 0, 1,   "p4"),
    (dr.lmf,                                        0, 2,   "lmf"),
    (dr.lmhs,                                       0, 2,   "lmhs"),
    (dr.lmp,                                        0, 2,   "lmp"),
    (dr.lmc,                                        0, 2,   "lmc"),
    (dr.hsapc,                                      0, 250, "hsapc"),
    (dr.ehspc,                                      0, 250, "ehspc")
]

plotvariables(sol, t, fig_2_85_variables, name="Fig. 2.85", showlegend=true, showaxis=true, colored=true)
