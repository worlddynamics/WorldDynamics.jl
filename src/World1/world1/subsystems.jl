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
