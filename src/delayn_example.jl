using ModelingToolkit, DifferentialEquations, Plots

@variables t
D = Differential(t)

@variables lv1(t) = 0
@variables lv2(t) = 0
@variables lv3(t) = 0
@variables lv4(t) = 0
@variables lv5(t) = 0
@variables lv6(t) = 0
@variables lv7(t) = 0
@variables lv8(t) = 0
@variables lv9(t) = 0
@variables lv10(t) = 0
@variables rt1(t)
@variables rt2(t)
@variables rt3(t)
@variables rt4(t)
@variables rt5(t)
@variables rt6(t)
@variables rt7(t)
@variables rt8(t)
@variables rt9(t)
@variables delay10(t)
@variables dl(t)
@variables f(t) = 0
@variables delay_time(t)

# Implement Vensim function Delay N(input=1, delay, initial=0, order=3)
# Documentation for DELAY N: https://www.vensim.com/documentation/fn_delay_n.html
## For constant delay, it is equivalent to DELAY3I(input,delay, initial)
## Documentation for DELAY3I: https://www.vensim.com/documentation/fn_delay3.html
eqs = [
    D(f) ~ 1,
    delay_time ~ 10,
    delay10 ~ lv10 / dl,
    D(lv10) ~ (rt9 - delay10),
    rt9 ~ lv9 / dl,
    D(lv9) ~ (rt8 - rt9),
    rt8 ~ lv8 / dl,
    D(lv8) ~ (rt7 - rt8),
    rt7 ~ lv7 / dl,
    D(lv7) ~ (rt6 - rt7),
    rt6 ~ lv6 / dl,
    D(lv6) ~ (rt5 - rt6),
    rt5 ~ lv5 / dl,
    D(lv5) ~ (rt4 - rt5),
    rt4 ~ lv4 / dl,
    D(lv4) ~ (rt3 - rt4),
    rt3 ~ lv3 / dl,
    D(lv3) ~ (rt2 - rt3),
    rt2 ~ lv2 / dl,
    D(lv2) ~ (rt1 - rt2),
    rt1 ~ lv1 / dl,
    D(lv1) ~ (f - rt1),
    dl ~ delay_time / 10
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
