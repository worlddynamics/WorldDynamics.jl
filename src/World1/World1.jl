module World1

using WorldDynamics
using ModelingToolkit


_inits = Dict{Symbol, Float64}(
    :pop => 1.65e9,
    :nr => 900e9,
    :ci => 0.4e9,
    :pol => 0.2e9,
    :ciaf => 0.5,
)

_params = Dict{Symbol, Float64}(
    :brn => 0.045,
    :brms => 1.0,
    :msln => 1.0,
    :nrun => 1.0,
    :drn => 0.025,
    :drms => 1.0,
    :la => 135e6,
    :pdn => 265,
    :cigc => 1.0,
    :cidn => 0.025,
    :pols => 3.6e9,
    :poln => 1.0,
    :ciaft => 30.0,
    :qls => 1.0,
)

_tables = Dict{Symbol, Tuple{Vararg{Float64}}}(
    :brmm => (0.7, 1.5, 2.1, 2.2, 1.8, 1.1, 0.8),
    :nrem => (0.0, 0.15, 0.50, 0.85, 1.0),
    :drmm => (2.0, 1.4, 1.0, 0.8, 0.7, 0.6, 0.53, 0.5, 0.5, 0.5, 0.5),
    :drpm => (1.0, 1.1, 1.3, 1.6, 2.2, 3.4, 6.0),
    :drfm => (30.0, 2.4, 1.5, 1.2, 1.0, 0.9, 0.8, 0.73, 0.7), #30.0
    :drcm => (1.0, 1.1, 1.3, 1.6, 2.1, 3.0),
    :brcm => (1.0, 0.95, 0.8, 0.7, 0.65, 0.65),
    :brfm => (0.0, 0.4, 1.0, 1.8, 3.0),
    :brpm => (1.0, 0.98, 0.95, 0.9, 0.8, 0.65, 0.5),
    :fcm => (2.4, 1.0, 0.6, 0.4, 0.3, 0.2),
    :fpci => (0.5, 1.0, 1.4, 1.7, 1.9, 2.05, 2.2),
    :cipc => (0.02, 0.05, 0.15, 0.3, 0.5, 0.75),
    :fpm => (1.0, 0.95, 0.8, 0.6, 0.4, 0.25, 0.15),
    :polcm => (0.05, 1.0, 3.0, 6.0, 10.0, 15.0),
    :polat => (0.5, 1.0, 2.4, 4.4, 6.8, 9.6, 11.4),
    :cfifr => (1.0, 0.8, 0.5, 0.2, 0.1),
    :qlm => (0.2, 1.0, 2.2, 4.0, 6.0, 8.0),
    :qlc => (2.0, 1.3, 1.0, 0.75, 0.55, 0.45, 0.38, 0.3, 0.25, 0.22, 0.2),
    :qlf => (0.0, 0.2, 1.0, 2.2, 4.0),
    :qlp => (1.5, 1.0, 0.7, 0.5, 0.35, 0.25, 0.2),
)

_ranges = Dict{Symbol, Tuple{Float64, Float64}}(
    :brmm => (0.0, 15.0),
    :nrem => (0.0, 1.0),
    :drmm => (0.0, 5.0),
    :drpm => (0.0, 6.0),
    :drfm => (0.0, 2.0),
    :drcm => (0.0, 5.0),
    :brcm => (0.0, 5.0),
    :brfm => (0.0, 2.0),
    :brpm => (0.0, 6.0),
    :fcm => (0.0, 5.0),
    :fpci => (0.0, 6.0),
    :cipc => (0.0, 5.0),
    :fpm => (0.0, 6.0),
    :polcm => (0.0, 5.0),
    :polat => (0.0, 6.0),
    :cfifr => (0.0, 2.0),
    :qlm => (0.0, 5.0),
    :qlc => (0.0, 5.0),
    :qlf => (0.0, 2.0),
    :qlp => (0.0, 6.0),
)


@variables t
D = Differential(t)

function world1(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
    @parameters brn = params[:brn]
    @parameters brms = params[:brms]
    @parameters msln = params[:msln]
    @parameters nri = inits[:nr]
    @parameters nrun = params[:nrun]
    @parameters drn = params[:drn]
    @parameters drms = params[:drms]
    @parameters la = params[:la]
    @parameters pdn = params[:pdn]
    @parameters cigc = params[:cigc]
    @parameters cidn = params[:cidn]
    @parameters pols = params[:pols]
    @parameters poln = params[:poln]
    @parameters ciaft = params[:ciaft]
    @parameters qls = params[:qls]

    @variables pop(t) = inits[:pop]
    @variables br(t)
    @variables brmm(t)
    @variables msl(t)
    @variables ecir(t)
    @variables nrem(t)
    @variables nrfr(t)
    @variables nr(t) = inits[:nr]
    @variables nrur(t)
    @variables dr(t)
    @variables drmm(t)
    @variables drpm(t)
    @variables drfm(t)
    @variables drcm(t)
    @variables cr(t)
    @variables brcm(t)
    @variables brfm(t)
    @variables brpm(t)
    @variables fr(t)
    @variables fcm(t)
    @variables fpci(t)
    @variables cira(t)
    @variables cir(t)
    @variables ci(t) = inits[:ci]
    @variables cig(t)
    @variables cipc(t)
    @variables cid(t)
    @variables fpm(t)
    @variables polr(t)
    @variables pol(t) = inits[:pol]
    @variables polg(t)
    @variables polcm(t)
    @variables pola(t)
    @variables polat(t)
    @variables ciaf(t) = inits[:ciaf]
    @variables cfifr(t)
    @variables ql(t)
    @variables qlm(t)
    @variables qlc(t)
    @variables qlf(t)
    @variables qlp(t)

    eqs = [
        D(pop) ~ br - dr
        br ~ pop * brn * brfm * brmm * brcm * brpm
        brmm ~ interpolate(msl * brms, tables[:brmm], ranges[:brmm])
        msl ~ msln * ecir
        ecir ~ cir * (1.0 - ciaf) * nrem
        nrem ~ interpolate(nrfr, tables[:nrem], ranges[:nrem])
        nrfr ~ nr / nri
        D(nr) ~ -nrur
        nrur ~ pop * nrun * msl
        dr ~ pop * drn * drmm * drpm * drfm * drcm
        drmm ~ interpolate(msl * drms, tables[:drmm], ranges[:drmm])
        drpm ~ interpolate(polr, tables[:drpm], ranges[:drpm])
        drfm ~ interpolate(fr, tables[:drfm], ranges[:drfm])
        drcm ~ interpolate(cr, tables[:drcm], ranges[:drcm])
        cr ~ pop / (la * pdn)
        brcm ~ interpolate(cr, tables[:brcm], ranges[:brcm])
        brfm ~ interpolate(fr, tables[:brfm], ranges[:brfm])
        brpm ~ interpolate(polr, tables[:brpm], ranges[:brpm])
        fr ~ fpci * fcm * fpm
        fcm ~ interpolate(cr, tables[:fcm], ranges[:fcm])
        fpci ~ interpolate(cira, tables[:fpci], ranges[:fpci])
        cira ~ cir * ciaf
        cir ~ ci / pop
        D(ci) ~ cig - cid
        cig ~ pop * cipc * cigc
        cipc ~ interpolate(msl, tables[:cipc], ranges[:cipc])
        cid ~ ci * cidn
        fpm ~ interpolate(polr, tables[:fpm], ranges[:fpm])
        polr ~ pol / pols
        D(pol) ~ polg - pola
        polg ~ pop * poln * polcm
        polcm ~ interpolate(cir, tables[:polcm], ranges[:polcm])
        pola ~ pol / polat
        polat ~ interpolate(polr, tables[:polat], ranges[:polat])
        D(ciaf) ~ (cfifr - ciaf) / ciaft #
        cfifr ~ interpolate(fr, tables[:cfifr], ranges[:cfifr])
        ql ~ qls * qlm * qlc * qlf * qlp
        qlm ~ interpolate(msl, tables[:qlm], ranges[:qlm])
        qlc ~ interpolate(cr, tables[:qlc], ranges[:qlc])
        qlf ~ interpolate(fr, tables[:qlf], ranges[:qlf])
        qlp ~ interpolate(polr, tables[:qlp], ranges[:qlp])
    ]

    ODESystem(eqs; name)
end

function standard_run(; kwargs...)
    @named w1 = world1(; kwargs...)
    return w1
end

function standardrunsolution()
    isdefined(@__MODULE__, :_solution_standardrun) && return _solution_standardrun
    global _solution_standardrun = solve(standard_run(), (1900, 2100))
    return _solution_standardrun
end

function _variables_std()
    @named w1 = world1()

    variables = [
        (w1.pop,  0,     8e9,   "Population"),
        (w1.polr, 0,     40,    "Pollution"),
        (w1.ci,   0,     8e9,   "Capital investment"),
        (w1.fr,   0,     8,     "Food ratio"),
        (w1.cr,   0,     0.2,   "Crowding ratio"),
        (w1.msl,  0,     80,    "Material standard of living"),
        (w1.qlm,  0,     8,     "Quality of life from materials"),
        (w1.ql,   0,     120,   "Quality of life"),
        (w1.ciaf, 0.2,   0.6,   "Capital in agriculture"),
        (w1.nr,   500e9, 900e9, "Natural resources"),
    ]

    return variables
end

function _variables_1()
    @named w1 = world1()

    variables = [
        (w1.pop,  0,     8e9,   "Population"),
        (w1.polr, 0,     1.2,   "Pollution"),
        (w1.ci,   0,     4e9,   "Capital investment"),
        (w1.fr,   1.15,  1.35,  "Food ratio"),
        (w1.cr,   0,     0.2,   "Crowding ratio"),
        (w1.msl,  0,     0.4,   "Material standard of living"),
        (w1.qlm,  0.25,  0.45,  "Quality of life from materials"),
        (w1.ql,   0.9,   1.7,   "Quality of life"),
        (w1.ciaf, 0.15,  0.55,  "Capital in agriculture"),
        (w1.nr,   500e9, 900e9, "Natural resources"),
    ]

    return variables
end

function _variables_2()
    @named w1 = world1()

    variables = [
        (w1.pop,  0,     8e9,   "Population"),
        (w1.polr, 0,     1.2,   "Pollution"),
        (w1.ci,   0,     4e9,   "Capital investment"),
        (w1.fr,   1.16,  1.28,  "Food ratio"),
        (w1.cr,   0,     0.2,   "Crowding ratio"),
        (w1.msl,  0.18,  0.26,  "Material standard of living"),
        (w1.qlm,  0.33,  0.41,  "Quality of life from materials"),
        (w1.ql,   1,     1.8,   "Quality of life"),
        (w1.ciaf, 0.2,   0.4,   "Capital in agriculture"),
        (w1.nr,   500e9, 900e9, "Natural resources"),
    ]

    return variables
end

function _variables_3()
    @named w1 = world1()

    variables = [
        (w1.pop,  0,     8e9,   "Population"),
        (w1.polr, 0,     20,    "Pollution"),
        (w1.ci,   0,     4e9,   "Capital investment"),
        (w1.fr,   0,     4,     "Food ratio"),
        (w1.cr,   0,     0.2,   "Crowding ratio"),
        (w1.msl,  0,     20,    "Material standard of living"),
        (w1.qlm,  0,     8,     "Quality of life from materials"),
        (w1.ql,   0,     20,    "Quality of life"),
        (w1.ciaf, 0,     0.8,   "Capital in agriculture"),
        (w1.nr,   100e9, 900e9, "Natural resources"),
    ]

    return variables
end


fig_std(; kwargs...) = plotvariables(standardrunsolution(), (t, 1900, 2100), _variables_std(); title="STD", showaxis=false, showlegend=false,kwargs...)

function fig_1(; kwargs...)
    new_params = copy(_params)
    new_params[:cigc] = 0.5

    sol = solve(standard_run(params=new_params), (1900, 2100))

    plotvariables(sol, (t, 1900, 2100), _variables_1(); title="W1-7/5-1", showaxis=false, showlegend=false,kwargs...)
end

function fig_2(; kwargs...)
    new_params = copy(_params)
    new_params[:cigc] = 0.5

    new_inits = copy(_inits)
    new_inits[:ciaf] = 0.25

    sol = solve(standard_run(inits=new_inits, params=new_params), (1900, 2100))

    plotvariables(sol, (t, 1900, 2100), _variables_2(); title="W1-7/5-2", showaxis=false, showlegend=false,kwargs...)
end

function fig_3(; kwargs...)
    new_params = copy(_params)
    new_params[:cigc] = 0.5

    new_inits = copy(_inits)
    new_inits[:ciaf] = 0.25

    sol = solve(standard_run(inits=new_inits, params=new_params), (1900, 2400))

    plotvariables(sol, (t, 1900, 2400), _variables_3(); title="W1-7/5-3", showaxis=false, showlegend=false,kwargs...)
end


end
