function public_run(; kwargs...)
    @named pub = public(; kwargs...)
    @named pub_sup = public_support(; kwargs...)

    systems = [
        pub, pub_sup
    ]

    connection_eqs = [
         pub.CTA ~ pub_sup.CTA
         pub.GDP ~ pub_sup.GDP
         pub.CTPIS ~ pub_sup.CTPIS
         pub.IPT ~ pub_sup.IPT
         pub.OW2022 ~ pub_sup.OW2022
         pub.OW ~ pub_sup.OW
         pub.GP ~ pub_sup.GP
         pub.CPUS ~ pub_sup.CPUS
         pub.GDP  ~ pub_sup.GDP
         pub.POP ~ pub_sup.POP
         pub.GDPP ~ pub_sup.GDPP
         pub.II ~ pub_sup.II
    ]

    return WorldDynamics.compose(systems, connection_eqs)
end
