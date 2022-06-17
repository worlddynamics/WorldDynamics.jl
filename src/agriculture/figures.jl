include("../plotvariables.jl")
include("Agriculture.jl")
include("odesystem.jl")


sol = solveagriculture()


@named ld = Agriculture.land_development()
@named leuiu = Agriculture.land_erosion_urban_industrial_use()

@variables t


fig_4_69_variables = [
    (ld.al, 0, 4e9),
    (ld.pal, 0, 4e9),
    (leuiu.ler, 0, 40e6),
    (ld.ldr, 0, 40e6),
    (leuiu.lrui, 0, 40e6),
    (ld.dcph, 0, 10000)
]

plotvariables(sol, t, fig_4_69_variables, name="Fig. 4.69", showlegend=true, showaxis=true, colored=true)
