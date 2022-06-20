include("../../src/plotvariables.jl")
include("../solutions/solveagriculture.jl")


sol = solveagriculture()


@named ld = Agriculture.land_development()
@named leuiu = Agriculture.land_erosion_urban_industrial_use()

@variables t


fig_4_69_variables = [
    (ld.al,      0, 4e9,   "al"),
    (ld.pal,     0, 4e9,   "pal"),
    (leuiu.ler,  0, 40e6,  "ler"),
    (ld.ldr,     0, 40e6,  "ldr"),
    (leuiu.lrui, 0, 40e6,  "lrui"),
    (ld.dcph,    0, 10000, "dcph")
]

plotvariables(sol, t, fig_4_69_variables, name="Fig. 4.69", showlegend=true, showaxis=true, colored=true)
