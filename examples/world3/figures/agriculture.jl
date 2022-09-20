using WorldDynamics

include("../scenarios/agriculture_historicalrun.jl")


system = agriculture_historicalrun()
sol = WorldDynamics.solve(system, (1900, 2100))


@named ld = World3.Agriculture.land_development()
@named ai = World3.Agriculture.agricultural_inputs()
@named lfd = World3.Agriculture.land_fertility_degradation()
@named leuiu = World3.Agriculture.land_erosion_urban_industrial_use()
@named iad = World3.Agriculture.investment_allocation_decision()
@named dlm = World3.Agriculture.discontinung_land_maintenance()
@named lfr = World3.Agriculture.land_fertility_regeneration()

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
    (ld.dcph,    0, 10000, "dcph"),
]

fig_4_69c_variables = [
    (ld.tai, 0, 2e13, "tai"),
    (iad.fiald, 0, 0.4, "fiald"),
    (iad.mpai, 0, 100, "mpai"),
    (iad.mpld, 0, 100, "mpld"),
]

fig_4_69d_variables = [
    (dlm.fr, 0, 4, "fr"),
    (dlm.falm, 0, 0.1, "falm"),
    (lfd.lfert, 0, 600, "lfert"),
    (lfd.lfd, 0, 80, "lfd"),
    (lfr.lfr, 0, 80, "lfr"),
    (lfr.lfrt, 0, 20, "lfrt"),
]

plotvariables(sol, (t, 1900, 1970), fig_4_69a_variables, name="Fig. 4.69a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol, (t, 1900, 1970), fig_4_69b_variables, name="Fig. 4.69b", showlegend=true, showaxis=true, colored=true)
plotvariables(sol, (t, 1900, 1970), fig_4_69c_variables, name="Fig. 4.69c", showlegend=true, showaxis=true, colored=true)
plotvariables(sol, (t, 1900, 1970), fig_4_69d_variables, name="Fig. 4.69d", showlegend=true, showaxis=true, colored=true)

plotvariables(sol, (t, 1900, 2100), fig_4_69a_variables, name="Fig. 4.70a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol, (t, 1900, 2100), fig_4_69b_variables, name="Fig. 4.70b", showlegend=true, showaxis=true, colored=true)
plotvariables(sol, (t, 1900, 2100), fig_4_69c_variables, name="Fig. 4.70c", showlegend=true, showaxis=true, colored=true)
plotvariables(sol, (t, 1900, 2100), fig_4_69d_variables, name="Fig. 4.70d", showlegend=true, showaxis=true, colored=true)


tables_4_72 = World3.Agriculture.gettables()
tables_4_72[:lymc] = (1.0, 3, 3.8, 6, 7, 8, 8.4, 8.8, 9.2, 9.6, 10, 10.4, 10.8, 11.2, 11.6, 12, 12.4, 12.8, 13.2, 13.6, 14, 14.2, 14.4, 14.6, 14.8, 15)

system = agriculture_historicalrun(tables=tables_4_72)
sol_4_72 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_4_72, (t, 1900, 2100), fig_4_69a_variables, name="Fig. 4.72a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_4_72, (t, 1900, 2100), fig_4_69b_variables, name="Fig. 4.72b", showlegend=true, showaxis=true, colored=true)


tables_4_73 = World3.Agriculture.gettables()
tables_4_73[:lymc] = (1.0, 3.0, 3.8, 4.4, 4.9, 5.4, 5.6, 5.7, 5.8, 5.9, 6.0, 6.1, 6.2, 6.3, 6.4, 6.5, 6.6, 6.7, 6.8, 6.8, 7.0, 7.1, 7.2, 7.3, 7.4, 7.5)

system = agriculture_historicalrun(tables=tables_4_73)
sol_4_73 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_4_73, (t, 1900, 2100), fig_4_69a_variables, name="Fig. 4.73a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_4_73, (t, 1900, 2100), fig_4_69b_variables, name="Fig. 4.73b", showlegend=true, showaxis=true, colored=true)


parameters_4_74 = World3.Agriculture.getparameters()
parameters_4_74[:palt] = 4.35e9

initialisations_4_74 = World3.Agriculture.getinitialisations()
initialisations_4_74[:pal] = 3.45e9

system = agriculture_historicalrun(params=parameters_4_74, inits=initialisations_4_74)
sol_4_74 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_4_74, (t, 1900, 2100), fig_4_69a_variables, name="Fig. 4.74a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_4_74, (t, 1900, 2100), fig_4_69b_variables, name="Fig. 4.74b", showlegend=true, showaxis=true, colored=true)


parameters_4_75 = World3.Agriculture.getparameters()
parameters_4_75[:palt] = 2.4e9

initialisations_4_75 = World3.Agriculture.getinitialisations()
initialisations_4_75[:pal] = 1.5e9

system = agriculture_historicalrun(params=parameters_4_75, inits=initialisations_4_75)
sol_4_75 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_4_75, (t, 1900, 2100), fig_4_69a_variables, name="Fig. 4.75a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_4_75, (t, 1900, 2100), fig_4_69b_variables, name="Fig. 4.75b", showlegend=true, showaxis=true, colored=true)


tables_4_76 = World3.Agriculture.gettables()
tables_4_76[:dcph] = (3e5, 1e5, 7400, 5200, 3500, 2400, 1500, 750, 300, 150, 75)

system = agriculture_historicalrun(params=parameters_4_74, inits=initialisations_4_74, tables=tables_4_76)
sol_4_76 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_4_76, (t, 1900, 2100), fig_4_69a_variables, name="Fig. 4.76a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_4_76, (t, 1900, 2100), fig_4_69b_variables, name="Fig. 4.76b", showlegend=true, showaxis=true, colored=true)


tables_4_77 = World3.Agriculture.gettables()
tables_4_77[:lymc] = (1.0, 3.0, 3.8, 6.0, 7.0, 8.0, 8.4, 8.8, 9.2, 9.6, 10.0, 10.4, 10.8, 11.2, 11.6, 12.0, 12.4, 12.8, 13.2, 13.6, 14.0, 14.2, 14.4, 14.6, 14.8, 15.0)

system = agriculture_historicalrun(params=parameters_4_74, inits=initialisations_4_74, tables=tables_4_77)
sol_4_77 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_4_77, (t, 1900, 2100), fig_4_69a_variables, name="Fig. 4.77a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_4_77, (t, 1900, 2100), fig_4_69b_variables, name="Fig. 4.77b", showlegend=true, showaxis=true, colored=true)


system = agriculture_historicalrun(params=parameters_4_75, inits=initialisations_4_75, tables=tables_4_73)
sol_4_78 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_4_78, (t, 1900, 2100), fig_4_69a_variables, name="Fig. 4.78a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_4_78, (t, 1900, 2100), fig_4_69b_variables, name="Fig. 4.78b", showlegend=true, showaxis=true, colored=true)


tables_4_82 = World3.Agriculture.gettables()
tables_4_82[:dcph] = (1e5, 5200, 2400, 750, 300, 150, 100, 60, 40, 30, 25)
tables_4_82[:llmy1] = (1.2, 1.0, 0.9, 0.8, 0.7, 0.5, 0.4, 0.3, 0.25, 0.2)
tables_4_82[:llmy2] = (1.2, 1.0, 0.9, 0.8, 0.7, 0.5, 0.4, 0.3, 0.25, 0.2)
tables_4_82[:lymap1] = (1.0, 1.0, 1.0, 1.0)
tables_4_82[:lymap2] = (1.0, 1.0, 1.0, 1.0)

system = agriculture_historicalrun(tables=tables_4_82)
sol_4_82 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_4_82, (t, 1900, 2100), fig_4_69a_variables, name="Fig. 4.82a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_4_82, (t, 1900, 2100), fig_4_69b_variables, name="Fig. 4.82b", showlegend=true, showaxis=true, colored=true)


tables_4_83 = World3.Agriculture.gettables()
tables_4_83[:dcph] = (3e5, 1e5, 7400, 5200, 3500, 2400, 1500, 750, 300, 150, 75)
tables_4_83[:llmy1] = (1.2, 1.0, 0.5, 0.2, 0.1, 0.05, 0.025, 0.01, 0.005, 0.001)
tables_4_83[:llmy2] = (1.2, 1.0, 0.5, 0.2, 0.1, 0.05, 0.025, 0.01, 0.005, 0.001)
tables_4_83[:lymap1] = (1.0, 0.5, 0.1, 0.1)
tables_4_83[:lymap2] = (1.0, 0.5, 0.1, 0.1)

system = agriculture_historicalrun(tables=tables_4_83)
sol_4_83 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_4_83, (t, 1900, 2100), fig_4_69a_variables, name="Fig. 4.83a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_4_83, (t, 1900, 2100), fig_4_69b_variables, name="Fig. 4.83b", showlegend=true, showaxis=true, colored=true)


tables_4_84 = World3.Agriculture.gettables()
tables_4_84[:lfdr] = (0.0, 0.0, 0.0, 0.0)

system = agriculture_historicalrun(tables=tables_4_84)
sol_4_84 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_4_84, (t, 1900, 2100), fig_4_69a_variables, name="Fig. 4.84a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_4_84, (t, 1900, 2100), fig_4_69b_variables, name="Fig. 4.84b", showlegend=true, showaxis=true, colored=true)

tables_4_85 = World3.Agriculture.gettables()
tables_4_85[:lfdr] = (0.0, 0.0, 0.0, 0.0)
tables_4_85[:lymap2] = (1.0, 1.0, 1.0, 1.0)

system = agriculture_historicalrun(tables=tables_4_85)
sol_4_85 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_4_85, (t, 1900, 2100), fig_4_69a_variables, name="Fig. 4.85a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_4_85, (t, 1900, 2100), fig_4_69b_variables, name="Fig. 4.85b", showlegend=true, showaxis=true, colored=true)


tables_4_86 = World3.Agriculture.gettables()
tables_4_86[:lfdr] = (0.0, 0.0, 0.0, 0.0)
tables_4_86[:lymap2] = (1.0, 1.0, 1.0, 1.0)
tables_4_86[:llmy2] = (1.2, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0)

system = agriculture_historicalrun(tables=tables_4_86)
sol_4_86 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_4_86, (t, 1900, 2100), fig_4_69a_variables, name="Fig. 4.86a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_4_86, (t, 1900, 2100), fig_4_69b_variables, name="Fig. 4.86b", showlegend=true, showaxis=true, colored=true)


new_equations = equations(system)
new_equations[74] = leuiu.uilr ~ leuiu.pop * leuiu.uilpc * 0.25
@named new_system = ODESystem(new_equations)
sol_4_87 = WorldDynamics.solve(new_system, (1900, 2100))

plotvariables(sol_4_87, (t, 1900, 2100), fig_4_69a_variables, name="Fig. 4.87a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_4_87, (t, 1900, 2100), fig_4_69b_variables, name="Fig. 4.87b", showlegend=true, showaxis=true, colored=true)


parameters_4_88 = World3.Agriculture.getparameters()
parameters_4_88[:eyear] = 2050

system = agriculture_historicalrun(params=parameters_4_88)
sol_4_88 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_4_88, (t, 1900, 2100), fig_4_69a_variables, name="Fig. 4.88a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_4_88, (t, 1900, 2100), fig_4_69b_variables, name="Fig. 4.88b", showlegend=true, showaxis=true, colored=true)


parameters_4_89 = World3.Agriculture.getparameters()
parameters_4_89[:eyear] = 2025

system = agriculture_historicalrun(params=parameters_4_89)
sol_4_89 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_4_89, (t, 1900, 2100), fig_4_69a_variables, name="Fig. 4.89a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_4_89, (t, 1900, 2100), fig_4_69b_variables, name="Fig. 4.89b", showlegend=true, showaxis=true, colored=true)


parameters_4_90 = World3.Agriculture.getparameters()
parameters_4_90[:eyear] = 2000

system = agriculture_historicalrun(params=parameters_4_90)
sol_4_90 = WorldDynamics.solve(system, (1900, 2100))

plotvariables(sol_4_90, (t, 1900, 2100), fig_4_69a_variables, name="Fig. 4.90a", showlegend=true, showaxis=true, colored=true)
plotvariables(sol_4_90, (t, 1900, 2100), fig_4_69b_variables, name="Fig. 4.90b", showlegend=true, showaxis=true, colored=true)
