module World3


using Interpolations, ModelingToolkit


@variables t
D = Differential(t)

function supplementary_eqs(; name)
    @variables f(t) so(t) io(t)
    @variables foa(t) foi(t) fos(t)

    eqs = [
        foa ~ (0.22) * f / (0.22 * f + so + io)
        foi ~ io / (0.22 * f + so + io)
        fos ~ so / (0.22 * f + so + io)
    ]

    ODESystem(eqs; name)
end


end # module 
