using WorldDynamics

include("../scenarios/agriculture_historicalrun.jl")


sol = agriculture_historicalrun()


@named ld = WorldDynamics.World3.Agriculture.land_development()
@named leuiu = WorldDynamics.World3.Agriculture.land_erosion_urban_industrial_use()

@variables t


fig_4_69_variables = [
    (ld.al,      0, 4e9,   "al"),
    (ld.pal,     0, 4e9,   "pal"),
    (leuiu.ler,  0, 40e6,  "ler"),
    (ld.ldr,     0, 40e6,  "ldr"),
    (leuiu.lrui, 0, 40e6,  "lrui"),
    (ld.dcph,    0, 10000, "dcph")
]

plotvariables(sol, (t, 1900.0, 1970.0), fig_4_69_variables, name="Fig. 4.69", showlegend=true, showaxis=true, colored=true)
