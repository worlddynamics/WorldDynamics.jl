module World1A

using WorldDynamics
using ModelingToolkit


_inits = Dict{Symbol, Float64}(
    :pop => 1.65e9,
    :nr => 900e9,
    :ci => 0.4e9,
    :pol => 0.2e9,
    :ciaf => 0.3,
)

_params = Dict{Symbol, Float64}(
    :brn => 0.045,
    :brms => 1.0,
    :msln => 0.7,
    :nrun => 1.0,
    :drn => 0.025,
    :drms => 1.0,
    :la => 135e6,
    :pdn => 26.5,
    :cigc => 1.0,
    :cidn => 0.05,
    :pols => 3.6e9,
    :poln => 1.0,
    :ciaft => 15.0,
    :qls => 1.0,
)

_tables = Dict{Symbol, Tuple{Vararg{Float64}}}(
    :brmm => (1.5, 1.0, 0.7, 0.6, 0.55, 0.5),
    :nrem => (0.0, 0.15, 0.5, 0.85, 1.0),
    :nrmm => (0.0, 1.0, 1.8, 2.4, 2.9, 3.3, 3.6, 3.8, 3.9, 3.95, 4.0),
    :drmm => (2.0, 1.4, 1.0, 0.8, 0.7, 0.6, 0.53, 0.5, 0.5, 0.5, 0.5),
    :drpm => (0.98, 1.1, 1.3, 1.6, 2.1, 2.8, 4.0),
    :drfm => (30.0, 3.0, 2.0, 1.4, 1.0, 0.7, 0.6, 0.5, 0.5),
    :drcm => (1.0, 1.1, 1.3, 1.6, 2.1, 3.0),
    :brcm => (1.0, 0.95, 0.8, 0.7, 0.65, 0.65),
    :brfm => (0.0, 1.0, 1.6, 1.9, 2.0),
    :brpm => (1.0, 0.97, 0.92, 0.82, 0.72, 0.6, 0.4),
    :fcm => (2.4, 1.0, 0.6, 0.4, 0.3, 0.2),
    :fpci => (0.5, 1.0, 1.4, 1.7, 1.9, 2.05, 2.2),
    :cipc => (0.005, 0.05, 0.09, 0.12, 0.14, 0.15),
    :fpm => (1.0, 0.95, 0.87, 0.77, 0.65, 0.5, 0.32),
    :polcm => (0.05, 1.0, 3.0, 5.4, 7.4, 8.0),
    :polat => (1.0, 1.4, 2.4, 3.6, 5.2, 7.2, 10.0),
    :cfifr => (1.0, 0.8, 0.5, 0.2, 0.1),
    :qlm => (0.2, 1.0, 1.7, 2.3, 2.7, 2.9),
    :qlc => (2.0, 1.3, 1.0, 0.75, 0.55, 0.45, 0.38, 0.3, 0.25, 0.22, 0.2),
    :qlf => (0.0, 1.0, 1.8, 2.4, 2.7),
    :qlp => (1.5, 1.0, 0.7, 0.5, 0.35, 0.25, 0.2),
)

_ranges = Dict{Symbol, Tuple{Float64, Float64}}(
    :brmm => (0.0, 5.0),
    :nrem => (0.0, 1.0),
    :nrmm => (0.0, 10.0),
    :drmm => (0.0, 5.0),
    :drpm => (0.0, 30.0),
    :drfm => (0.0, 2.0),
    :drcm => (0.0, 5.0),
    :brcm => (0.0, 5.0),
    :brfm => (0.0, 4.0),
    :brpm => (0.0, 30.0),
    :fcm => (0.0, 5.0),
    :fpci => (0.0, 6.0),
    :cipc => (0.0, 5.0),
    :fpm => (0.0, 30.0),
    :polcm => (0.0, 5.0),
    :polat => (0.0, 30.0),
    :cfifr => (0.0, 2.0),
    :qlm => (0.0, 5.0),
    :qlc => (0.0, 5.0),
    :qlf => (0.0, 4.0),
    :qlp => (0.0, 6.0),
)

getinits() = copy(_inits)
getparams() = copy(_params)
gettables() = copy(_tables)
getranges() = copy(_ranges)


@variables t
D = Differential(t)

function world1a(; name, params=_params, inits=_inits, tables=_tables, ranges=_ranges)
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
    @variables nrmm(t)
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
        msl ~ ecir / msln
        ecir ~ cir * (1.0 - ciaf) * nrem
        nrem ~ interpolate(nrfr, tables[:nrem], ranges[:nrem])
        nrfr ~ nr / nri
        D(nr) ~ -nrur
        nrur ~ pop * nrun * nrmm
        nrmm ~ interpolate(msl, tables[:nrmm], ranges[:nrmm])
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
        D(ciaf) ~ (cfifr - ciaf) / ciaft
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
    @named w1 = world1a(; kwargs...)
    return w1
end

function standardrunsolution()
    isdefined(@__MODULE__, :_solution_standardrun) && return _solution_standardrun
    global _solution_standardrun = solve(standard_run(), (1900, 2100))
    return _solution_standardrun
end

function _variables_std()
    @named w1 = world1a()

    variables = [
        (w1.pop,  1.3e9, 2.1e9, "Population"),
        (w1.polr, 0,     0.2,   "Pollution"),
        (w1.ci,   370e6, 490e6, "Capital investment"),
        (w1.fr,   0.87,  0.95,  "Food ratio"),
        (w1.cr,   0.4,   0.6,   "Crowding ratio"),
        (w1.msl,  0.05,  0.25,  "Material standard of living"),
        (w1.qlm,  0.28,  0.4,   "Quality of life from materials"),
        (w1.ql,   0.35,  0.75,  "Quality of life"),
        (w1.ciaf, 0.2,   0.6,   "Capital in agriculture"),
        (w1.nr,   820e9, 900e9, "Natural resources"),
    ]

    return variables
end


fig_std(; kwargs...) = plotvariables(standardrunsolution(), (t, 1900, 2100), _variables_std(); title="WRLD1A-STD", showaxis=false, showlegend=false,kwargs...)


end
