include("../../src/plotvariables.jl")
include("../solutions/solveworld3.jl")


sol = solveworld3()


@named pop = Pop4.population()
@named br = Pop4.birth_rate()
@named dr = Pop4.death_rate()
@named is = Capital.industrial_subsector()
@named ld = Agriculture.land_development()
@named nr = NonRenewable.non_renewable()
@named pp = Pollution.persistent_pollution()


@variables t


fig_7_2_variables = [
    (pop.pop, 0,    4e9,  "pop"),
    (br.cbr,  0,    50,   "cbr"),
    (dr.cdr,  0,    50,   "cdr"),
    (dr.le,   0,    60,   "le"),
    (dr.lmf,  0.75, 1.75, "lmf"),
    (dr.lmp,  0.75, 1.75, "lmp"),
    (dr.lmhs, 0.75, 1.75, "lmhs"),
    (dr.lmc,  0.75, 1.75, "lmc"),
    (br.tf,   0,    8,    "tf"),
    (br.dtf,  0,    8,    "dtf"),
]

plotvariables(sol, (t, 1900.0, 1970.0), fig_7_2_variables, name="Fig. 7.2", showlegend=true, showaxis=true, colored=true)


fig_7_7_variables = [
    (nr.nrfr,  0, 1,    "nrfr"),
    (is.iopc,  0, 1000, "iopc"),
    (ld.fpc,   0, 1000, "fpc"),
    (pop.pop,  0, 16e9, "pop"),
    (pp.ppolx, 0, 32,   "ppolx"),
    (br.cbr,   0, 50,   "cbr"),
    (dr.cdr,   0, 50,   "cdr")
]

plotvariables(sol, (t, 1900.0, 2100.0), fig_7_7_variables, name="Fig. 7.7", showlegend=true, showaxis=true, colored=true)
