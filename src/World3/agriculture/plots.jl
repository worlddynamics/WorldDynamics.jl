include("../../plotvariables.jl")


function variables_a()
    @named ld = land_development()
    @named ai = agricultural_inputs()
    @named lfd = land_fertility_degradation()

    variables = [
        (ld.f,      0, 12e12, "f"),
        (ld.fpc,    0, 1000,  "fpc"),
        (ai.ly,     0, 8000,  "ly"),
        (lfd.lfert, 0, 600,   "lfert"),
        (ai.aiph,   0, 1000,  "aiph"),
    ]

    return variables
end

function variables_b()
    @named ld = land_development()
    @named leuiu = land_erosion_urban_industrial_use()

    variables = [
        (ld.al,      0, 4e9,   "al"),
        (ld.pal,     0, 4e9,   "pal"),
        (leuiu.ler,  0, 40e6,  "ler"),
        (ld.ldr,     0, 40e6,  "ldr"),
        (leuiu.lrui, 0, 40e6,  "lrui"),
        (ld.dcph,    0, 10000, "dcph"),
    ]

    return variables
end

function variables_c()
    @named ld = land_development()
    @named iad = investment_allocation_decision()

    variables = [
        (ld.tai,    0, 2e13, "tai"),
        (iad.fiald, 0, 0.4,  "fiald"),
        (iad.mpai,  0, 100,  "mpai"),
        (iad.mpld,  0, 100,  "mpld"),
    ]

    return variables
end

function variables_d()
    @named lfd = land_fertility_degradation()
    @named dlm = discontinung_land_maintenance()
    @named lfr = land_fertility_regeneration()

    variables = [
        (dlm.fr,    0, 4,   "fr"),
        (dlm.falm,  0, 0.1, "falm"),
        (lfd.lfert, 0, 600, "lfert"),
        (lfd.lfd,   0, 80,  "lfd"),
        (lfr.lfr,   0, 80,  "lfr"),
        (lfr.lfrt,  0, 20,  "lfrt"),
    ]

    return variables
end


function historicalrunsolution()
    isdefined(@__MODULE__, :_solution_historicalrun) && return _solution_historicalrun
    global _solution_historicalrun = solve(historicalrun(), (1900, 2100))
    return _solution_historicalrun
end

fig_69a(; kwargs...) = plotvariables(historicalrunsolution(), (t, 1900, 1970), variables_a(); title="Fig. 4.69a", kwargs...)
fig_69b(; kwargs...) = plotvariables(historicalrunsolution(), (t, 1900, 1970), variables_b(); title="Fig. 4.69b", kwargs...)
fig_69c(; kwargs...) = plotvariables(historicalrunsolution(), (t, 1900, 1970), variables_c(); title="Fig. 4.69c", kwargs...)
fig_69d(; kwargs...) = plotvariables(historicalrunsolution(), (t, 1900, 1970), variables_d(); title="Fig. 4.69d", kwargs...)

fig_70a(; kwargs...) = plotvariables(historicalrunsolution(), (t, 1900, 2100), variables_a(); title="Fig. 4.70a", kwargs...)
fig_70b(; kwargs...) = plotvariables(historicalrunsolution(), (t, 1900, 2100), variables_b(); title="Fig. 4.70b", kwargs...)
fig_70c(; kwargs...) = plotvariables(historicalrunsolution(), (t, 1900, 2100), variables_c(); title="Fig. 4.70c", kwargs...)
fig_70d(; kwargs...) = plotvariables(historicalrunsolution(), (t, 1900, 2100), variables_d(); title="Fig. 4.70d", kwargs...)


function fig72solution()
    isdefined(@__MODULE__, :_solution_4_72) && return _solution_4_72

    tables_4_72 = gettables()
    tables_4_72[:lymc] = (1.0, 3, 3.8, 6, 7, 8, 8.4, 8.8, 9.2, 9.6, 10, 10.4, 10.8, 11.2, 11.6, 12, 12.4, 12.8, 13.2, 13.6, 14, 14.2, 14.4, 14.6, 14.8, 15)

    system = historicalrun(tables=tables_4_72)
    global _solution_4_72 = solve(system, (1900, 2100))

    return _solution_4_72
end

fig_72a(; kwargs...) = plotvariables(fig72solution(), (t, 1900, 2100), variables_a(); title="Fig. 4.72a", kwargs...)
fig_72b(; kwargs...) = plotvariables(fig72solution(), (t, 1900, 2100), variables_b(); title="Fig. 4.72b", kwargs...)


function fig73solution()
    isdefined(@__MODULE__, :_solution_4_73) && return _solution_4_73

    tables_4_73 = gettables()
    tables_4_73[:lymc] = (1.0, 3.0, 3.8, 4.4, 4.9, 5.4, 5.6, 5.7, 5.8, 5.9, 6.0, 6.1, 6.2, 6.3, 6.4, 6.5, 6.6, 6.7, 6.8, 6.8, 7.0, 7.1, 7.2, 7.3, 7.4, 7.5)

    system = historicalrun(tables=tables_4_73)
    global _solution_4_73 = solve(system, (1900, 2100))

    return _solution_4_73
end

fig_73a(; kwargs...) = plotvariables(fig73solution(), (t, 1900, 2100), variables_a(); title="Fig. 4.73a", kwargs...)
fig_73b(; kwargs...) = plotvariables(fig73solution(), (t, 1900, 2100), variables_b(); title="Fig. 4.73b", kwargs...)


function fig74solution()
    isdefined(@__MODULE__, :_solution_4_74) && return _solution_4_74

    parameters_4_74 = getparameters()
    parameters_4_74[:palt] = 4.35e9

    initialisations_4_74 = getinitialisations()
    initialisations_4_74[:pal] = 3.45e9

    system = historicalrun(params=parameters_4_74, inits=initialisations_4_74)
    global _solution_4_74 = solve(system, (1900, 2100))

    return _solution_4_74
end

fig_74a(; kwargs...) = plotvariables(fig74solution(), (t, 1900, 2100), variables_a(); title="Fig. 4.74a", kwargs...)
fig_74b(; kwargs...) = plotvariables(fig74solution(), (t, 1900, 2100), variables_b(); title="Fig. 4.74b", kwargs...)


function fig75solution()
    isdefined(@__MODULE__, :_solution_4_75) && return _solution_4_75

    parameters_4_75 = getparameters()
    parameters_4_75[:palt] = 2.4e9

    initialisations_4_75 = getinitialisations()
    initialisations_4_75[:pal] = 1.5e9

    system = historicalrun(params=parameters_4_75, inits=initialisations_4_75)
    global _solution_4_75 = solve(system, (1900, 2100))

    return _solution_4_75
end

fig_75a(; kwargs...) = plotvariables(fig75solution(), (t, 1900, 2100), variables_a(); title="Fig. 4.75a", kwargs...)
fig_75b(; kwargs...) = plotvariables(fig75solution(), (t, 1900, 2100), variables_b(); title="Fig. 4.75b", kwargs...)


function fig76solution()
    isdefined(@__MODULE__, :_solution_4_76) && return _solution_4_76

    parameters_4_76 = getparameters()
    parameters_4_76[:palt] = 4.35e9

    initialisations_4_76 = getinitialisations()
    initialisations_4_76[:pal] = 3.45e9

    tables_4_76 = gettables()
    tables_4_76[:dcph] = (3e5, 1e5, 7400, 5200, 3500, 2400, 1500, 750, 300, 150, 75)

    system = historicalrun(params=parameters_4_76, inits=initialisations_4_76, tables=tables_4_76)
    global _solution_4_76 = solve(system, (1900, 2100))

    return _solution_4_76
end

fig_76a(; kwargs...) = plotvariables(fig76solution(), (t, 1900, 2100), variables_a(); title="Fig. 4.76a", kwargs...)
fig_76b(; kwargs...) = plotvariables(fig76solution(), (t, 1900, 2100), variables_b(); title="Fig. 4.76b", kwargs...)


function fig77solution()
    isdefined(@__MODULE__, :_solution_4_77) && return _solution_4_77

    parameters_4_77 = getparameters()
    parameters_4_77[:palt] = 4.35e9

    initialisations_4_77 = getinitialisations()
    initialisations_4_77[:pal] = 3.45e9

    tables_4_77 = gettables()
    tables_4_77[:lymc] = (1.0, 3.0, 3.8, 6.0, 7.0, 8.0, 8.4, 8.8, 9.2, 9.6, 10.0, 10.4, 10.8, 11.2, 11.6, 12.0, 12.4, 12.8, 13.2, 13.6, 14.0, 14.2, 14.4, 14.6, 14.8, 15.0)

    system = historicalrun(params=parameters_4_77, inits=initialisations_4_77, tables=tables_4_77)
    global _solution_4_77 = solve(system, (1900, 2100))

    return _solution_4_77
end

fig_77a(; kwargs...) = plotvariables(fig77solution(), (t, 1900, 2100), variables_a(); title="Fig. 4.77a", kwargs...)
fig_77b(; kwargs...) = plotvariables(fig77solution(), (t, 1900, 2100), variables_b(); title="Fig. 4.77b", kwargs...)


function fig78solution()
    isdefined(@__MODULE__, :_solution_4_78) && return _solution_4_78

    parameters_4_78 = getparameters()
    parameters_4_78[:palt] = 2.4e9

    initialisations_4_78 = getinitialisations()
    initialisations_4_78[:pal] = 1.5e9

    tables_4_78 = gettables()
    tables_4_78[:lymc] = (1.0, 3.0, 3.8, 4.4, 4.9, 5.4, 5.6, 5.7, 5.8, 5.9, 6.0, 6.1, 6.2, 6.3, 6.4, 6.5, 6.6, 6.7, 6.8, 6.8, 7.0, 7.1, 7.2, 7.3, 7.4, 7.5)

    system = historicalrun(params=parameters_4_78, inits=initialisations_4_78, tables=tables_4_78)
    global _solution_4_78 = solve(system, (1900, 2100))

    return _solution_4_78
end

fig_78a(; kwargs...) = plotvariables(fig78solution(), (t, 1900, 2100), variables_a(); title="Fig. 4.78a", kwargs...)
fig_78b(; kwargs...) = plotvariables(fig78solution(), (t, 1900, 2100), variables_b(); title="Fig. 4.78b", kwargs...)


function fig82solution()
    isdefined(@__MODULE__, :_solution_4_82) && return _solution_4_82

    tables_4_82 = gettables()
    tables_4_82[:dcph] = (1e5, 5200, 2400, 750, 300, 150, 100, 60, 40, 30, 25)
    tables_4_82[:llmy1] = (1.2, 1.0, 0.9, 0.8, 0.7, 0.5, 0.4, 0.3, 0.25, 0.2)
    tables_4_82[:llmy2] = (1.2, 1.0, 0.9, 0.8, 0.7, 0.5, 0.4, 0.3, 0.25, 0.2)
    tables_4_82[:lymap1] = (1.0, 1.0, 1.0, 1.0)
    tables_4_82[:lymap2] = (1.0, 1.0, 1.0, 1.0)

    system = historicalrun(tables=tables_4_82)
    global _solution_4_82 = solve(system, (1900, 2100))

    return _solution_4_82
end

fig_82a(; kwargs...) = plotvariables(fig82solution(), (t, 1900, 2100), variables_a(); title="Fig. 4.82a", kwargs...)
fig_82b(; kwargs...) = plotvariables(fig82solution(), (t, 1900, 2100), variables_b(); title="Fig. 4.82b", kwargs...)


function fig83solution()
    isdefined(@__MODULE__, :_solution_4_83) && return _solution_4_83

    tables_4_83 = gettables()
    tables_4_83[:dcph] = (3e5, 1e5, 7400, 5200, 3500, 2400, 1500, 750, 300, 150, 75)
    tables_4_83[:llmy1] = (1.2, 1.0, 0.5, 0.2, 0.1, 0.05, 0.025, 0.01, 0.005, 0.001)
    tables_4_83[:llmy2] = (1.2, 1.0, 0.5, 0.2, 0.1, 0.05, 0.025, 0.01, 0.005, 0.001)
    tables_4_83[:lymap1] = (1.0, 0.5, 0.1, 0.1)
    tables_4_83[:lymap2] = (1.0, 0.5, 0.1, 0.1)

    system = historicalrun(tables=tables_4_83)
    global _solution_4_83 = solve(system, (1900, 2100))

    return _solution_4_83
end

fig_83a(; kwargs...) = plotvariables(fig83solution(), (t, 1900, 2100), variables_a(); title="Fig. 4.83a", kwargs...)
fig_83b(; kwargs...) = plotvariables(fig83solution(), (t, 1900, 2100), variables_b(); title="Fig. 4.83b", kwargs...)


function fig84solution()
    isdefined(@__MODULE__, :_solution_4_84) && return _solution_4_84

    tables_4_84 = gettables()
    tables_4_84[:lfdr] = (0.0, 0.0, 0.0, 0.0)

    system = historicalrun(tables=tables_4_84)
    global _solution_4_84 = solve(system, (1900, 2100))

    return _solution_4_84
end

fig_84a(; kwargs...) = plotvariables(fig84solution(), (t, 1900, 2100), variables_a(); title="Fig. 4.84a", kwargs...)
fig_84b(; kwargs...) = plotvariables(fig84solution(), (t, 1900, 2100), variables_b(); title="Fig. 4.84b", kwargs...)


function fig85solution()
    isdefined(@__MODULE__, :_solution_4_85) && return _solution_4_85

    tables_4_85 = gettables()
    tables_4_85[:lfdr] = (0.0, 0.0, 0.0, 0.0)
    tables_4_85[:lymap2] = (1.0, 1.0, 1.0, 1.0)

    system = historicalrun(tables=tables_4_85)
    global _solution_4_85 = solve(system, (1900, 2100))

    return _solution_4_85
end

fig_85a(; kwargs...) = plotvariables(fig85solution(), (t, 1900, 2100), variables_a(); title="Fig. 4.85a", kwargs...)
fig_85b(; kwargs...) = plotvariables(fig85solution(), (t, 1900, 2100), variables_b(); title="Fig. 4.85b", kwargs...)


function fig86solution()
    isdefined(@__MODULE__, :_solution_4_86) && return _solution_4_86

    tables_4_86 = gettables()
    tables_4_86[:lfdr] = (0.0, 0.0, 0.0, 0.0)
    tables_4_86[:lymap2] = (1.0, 1.0, 1.0, 1.0)
    tables_4_86[:llmy2] = (1.2, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0)

    system = historicalrun(tables=tables_4_86)
    global _solution_4_86 = solve(system, (1900, 2100))

    return _solution_4_86
end

fig_86a(; kwargs...) = plotvariables(fig86solution(), (t, 1900, 2100), variables_a(); title="Fig. 4.86a", kwargs...)
fig_86b(; kwargs...) = plotvariables(fig86solution(), (t, 1900, 2100), variables_b(); title="Fig. 4.86b", kwargs...)


function fig87solution()
    isdefined(@__MODULE__, :_solution_4_87) && return _solution_4_87

    tables_4_87 = gettables()
    tables_4_87[:lfdr] = (0.0, 0.0, 0.0, 0.0)
    tables_4_87[:lymap2] = (1.0, 1.0, 1.0, 1.0)
    tables_4_87[:llmy2] = (1.2, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0)

    system = historicalrun(tables=tables_4_87)

    @named leuiu = land_erosion_urban_industrial_use()

    new_equations = equations(system)
    new_equations[74] = leuiu.uilr ~ leuiu.pop * leuiu.uilpc * 0.25

    @named new_system = ODESystem(new_equations)
    global _solution_4_87 = solve(new_system, (1900, 2100))

    return _solution_4_87
end

fig_87a(; kwargs...) = plotvariables(fig87solution(), (t, 1900, 2100), variables_a(); title="Fig. 4.87a", kwargs...)
fig_87b(; kwargs...) = plotvariables(fig87solution(), (t, 1900, 2100), variables_b(); title="Fig. 4.87b", kwargs...)


function fig88solution()
    isdefined(@__MODULE__, :_solution_4_88) && return _solution_4_88

    parameters_4_88 = getparameters()
    parameters_4_88[:eyear] = 2050

    system = historicalrun(params=parameters_4_88)
    global _solution_4_88 = solve(system, (1900, 2100))

    return _solution_4_88
end

fig_88a(; kwargs...) = plotvariables(fig88solution(), (t, 1900, 2100), variables_a(); title="Fig. 4.88a", kwargs...)
fig_88b(; kwargs...) = plotvariables(fig88solution(), (t, 1900, 2100), variables_b(); title="Fig. 4.88b", kwargs...)


function fig89solution()
    isdefined(@__MODULE__, :_solution_4_89) && return _solution_4_89

    parameters_4_89 = getparameters()
    parameters_4_89[:eyear] = 2025

    system = historicalrun(params=parameters_4_89)
    global _solution_4_89 = solve(system, (1900, 2100))

    return _solution_4_89
end

fig_89a(; kwargs...) = plotvariables(fig89solution(), (t, 1900, 2100), variables_a(); title="Fig. 4.89a", kwargs...)
fig_89b(; kwargs...) = plotvariables(fig89solution(), (t, 1900, 2100), variables_b(); title="Fig. 4.89b", kwargs...)


function fig90solution()
    isdefined(@__MODULE__, :_solution_4_90) && return _solution_4_90

    parameters_4_90 = getparameters()
    parameters_4_90[:eyear] = 2000

    system = historicalrun(params=parameters_4_90)
    global _solution_4_90 = solve(system, (1900, 2100))

    return _solution_4_90
end

fig_90a(; kwargs...) = plotvariables(fig90solution(), (t, 1900, 2100), variables_a(); title="Fig. 4.90a", kwargs...)
fig_90b(; kwargs...) = plotvariables(fig90solution(), (t, 1900, 2100), variables_b(); title="Fig. 4.90b", kwargs...)
