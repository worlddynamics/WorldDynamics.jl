using ModelingToolkit, DifferentialEquations, Plots

@variables t
D = Differential(t)

@parameters delay = 20
@parameters p1 = 10
@parameters p2 = 20
@parameters p3 = 30

@variables lv1_2(t) = 20 * 5
@variables lv2_2(t) = 20 * 5
@variables lv3_2(t) = 20 * 5
@variables lv4_2(t) = 20 * 5
# @variables lv5_2(t) = 20 * 5
# @variables lv6_2(t) = 20 * 5
# @variables lv7_2(t) = 20 * 5
# @variables lv8_2(t) = 20 * 5
# @variables lv9_2(t) = 20 * 5
# @variables lv10_2(t) = 20 * 5
@variables rt1_2(t)
@variables rt2_2(t)
@variables rt3_2(t)
# @variables rt4_2(t)
# @variables rt5_2(t)
# @variables rt6_2(t)
# @variables rt7_2(t)
# @variables rt8_2(t)
# @variables rt9_2(t)
@variables lv1_3(t) = 30 * 5
@variables lv2_3(t) = 30 * 5
@variables lv3_3(t) = 30 * 5
@variables lv4_3(t) = 30 * 5
@variables rt1_3(t)
@variables rt2_3(t)
@variables rt3_3(t)
@variables dl(t)
@variables f1(t)
@variables f2(t) = 20 * 5
@variables f3(t) = 30 * 5
@variables g1(t)
@variables g2(t)

# Implement Vensim function Delay N(input=1, delay, initial=0, order=3)
# Documentation for DELAY N: https://www.vensim.com/documentation/fn_delay_n.html
## For constant delay, it is equivalent to DELAY3I(input,delay, initial)
## Documentation for DELAY3I: https://www.vensim.com/documentation/fn_delay3.html
eqs = [
    dl ~ delay / 4,
    f1 ~ p1 * g2,
    g1 ~ f1 - f2,
    # delay10 ~ lv10 / dl,
    # D(lv10) ~ (rt9 - delay10),
    # rt9 ~ lv9 / dl,
    # D(lv9) ~ (rt8 - rt9),
    # rt8 ~ lv8 / dl,
    # D(lv8) ~ (rt7 - rt8),
    # rt7 ~ lv7 / dl,
    # D(lv7) ~ (rt6 - rt7),
    # rt6 ~ lv6 / dl,
    # D(lv6) ~ (rt5 - rt6),
    # rt5 ~ lv5 / dl,
    # D(lv5) ~ (rt4 - rt5),
    # rt4 ~ lv4 / dl,
    f2 ~ lv4_2 / dl,
    D(lv4_2) ~ (rt3_2 - f2),
    rt3_2 ~ lv3_2 / dl,
    D(lv3_2) ~ (rt2_2 - rt3_2),
    rt2_2 ~ lv2_2 / dl,
    D(lv2_2) ~ (rt1_2 - rt2_2),
    rt1_2 ~ lv1_2 / dl,
    D(lv1_2) ~ (f1 - rt1_2),
    g2 ~ f2 - f3,
    f3 ~ lv4_3 / dl,
    D(lv4_3) ~ (rt3_3 - f3),
    rt3_3 ~ lv3_3 / dl,
    D(lv3_3) ~ (rt2_3 - rt3_3),
    rt2_3 ~ lv2_3 / dl,
    D(lv2_3) ~ (rt1_3 - rt2_3),
    rt1_3 ~ lv1_3 / dl,
    D(lv1_3) ~ (f2 - rt1_3),
]

@named sys = ODESystem(eqs)
sys = structural_simplify(sys)
prob = ODEProblem(sys, [], (0.0, 100.0))
sol = solve(prob, Euler(), dt=1.0)
# sol = solve(prob)
# plot(sol, idxs = z)
# Expected output from Vensim
## When delay ~ 9: z(20) = 0.967392
## When delay ~ 3*(3+t): z(20) = 0.09707
