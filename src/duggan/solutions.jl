using ModelingToolkit
using DifferentialEquations

function duggan_solution(; default_solver=Euler(), default_dt=0.015625, default_dtmax=0.015625)
    return WorldDynamics.solve(duggan(), (0, 200), solver=Tsit5(), dt=0.015625, dtmax=0.015625)
end