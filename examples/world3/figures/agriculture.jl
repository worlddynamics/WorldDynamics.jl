using WorldDynamics

include("../scenarios/agriculture_historicalrun.jl")


system = agriculture_historicalrun()
sol = WorldDynamics.solve(system, (1900, 2100))


@named ld = World3.Agriculture.land_development()
@named ai = World3.Agriculture.agricultural_inputs()
@named lfd = World3.Agriculture.land_fertility_degradation()
@named leuiu = World3.Agriculture.land_erosion_urban_industrial_use()

@variables t


fig_4_69a_variables = [
    (ld.f,      0, 12e12, "f"),
    (ld.fpc,    0, 1000,  "fpc"),
    (ai.ly,     0, 8000,  "ly"),
    (lfd.lfert, 0, 600,   "lfert"),
    (ai.aiph,   0, 1000,  "aiph"),
]

fig_4_69b_variables = [
    (ld.al,      0, 4e9,   "al"),
    (ld.pal,     0, 4e9,   "pal"),
    (leuiu.ler,  0, 40e6,  "ler"),
    (ld.ldr,     0, 40e6,  "ldr"),
    (leuiu.lrui, 0, 40e6,  "lrui"),
    (ld.dcph,    0, 10000, "dcph")
]

plotvariables(sol, (t, 1900, 1970), fig_4_69a_variables, name="Fig. 4.69a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol, (t, 1900, 1970), fig_4_69b_variables, name="Fig. 4.69b", showlegend=true, showaxis=true, colored=true)


parameters_4_74 = World3.Agriculture.getparameters()
parameters_4_74[:palt] = 4.35e9

initialisations_4_74 = World3.Agriculture.getinitialisations()
initialisations_4_74[:pal] = 3.45e9

system = agriculture_historicalrun(params=parameters_4_74, inits=initialisations_4_74)
sol_4_74 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_4_74, (t, 1900, 2100), fig_4_69a_variables, name="Fig. 4.74a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_4_74, (t, 1900, 2100), fig_4_69b_variables, name="Fig. 4.74b", showlegend=true, showaxis=true, colored=true)


tables_4_84 = World3.Agriculture.gettables()
tables_4_84[:lfdr] = (0.0, 0.0, 0.0, 0.0)

system = agriculture_historicalrun(tables=tables_4_84)
sol_4_84 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_4_84, (t, 1900, 2100), fig_4_69a_variables, name="Fig. 4.84a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_4_84, (t, 1900, 2100), fig_4_69b_variables, name="Fig. 4.84b", showlegend=true, showaxis=true, colored=true)
