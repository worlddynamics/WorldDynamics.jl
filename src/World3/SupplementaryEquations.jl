module SupplementaryEquations


using ModelingToolkit

@variables t
D = Differential(t)

function supplementary_equations(; name)
    @variables f(t) so(t) io(t)
    @variables foa(t) foi(t) fos(t)

    eqs = [
        foa ~ (0.22) * f / (0.22 * f + so + io) # Line 147 Appendix A
        foi ~ io / (0.22 * f + so + io) # Line 148 Appendix A
        fos ~ so / (0.22 * f + so + io) # Line 149 Appendix A
    ]

    ODESystem(eqs; name)
end


end
