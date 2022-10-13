@variables t


function historicalrunsolution()
    isdefined(@__MODULE__, :_solution_historicalrun) && return _solution_historicalrun
    global _solution_historicalrun = solve(historicalrun(), (1900, 2100))
    return _solution_historicalrun
end


function variables_7()
    @named nr = NonRenewable.non_renewable()
    @named is = Capital.industrial_subsector()
    @named ld = Agriculture.land_development()
    @named pop = Pop4.population()
    @named pp = Pollution.persistent_pollution()
    @named br = Pop4.birth_rate()
    @named dr = Pop4.death_rate()

    variables = [
        (nr.nrfr,  0, 1,    "nrfr"),
        (is.iopc,  0, 1000, "iopc"),
        (ld.fpc,   0, 1000, "fpc"),
        (pop.pop,  0, 16e9, "pop"),
        (pp.ppolx, 0, 32,   "ppolx"),
        (br.cbr,   0, 50,   "cbr"),
        (dr.cdr,   0, 50,   "cdr"),
    ]

    return variables
end

function variables_20()
    @named nr = NonRenewable.non_renewable()
    @named is = Capital.industrial_subsector()
    @named ld = Agriculture.land_development()
    @named pop = Pop4.population()
    @named pp = Pollution.persistent_pollution()
    @named br = Pop4.birth_rate()
    @named dr = Pop4.death_rate()

    variables = [
        (nr.nrfr,  0, 1,    "nrfr"),
        (is.iopc,  0, 2000, "iopc"),
        (ld.fpc,   0, 1000, "fpc"),
        (pop.pop,  0, 16e9, "pop"),
        (pp.ppolx, 0, 32,   "ppolx"),
        (br.cbr,   0, 50,   "cbr"),
        (dr.cdr,   0, 50,   "cdr"),
    ]

    return variables
end

"""
    Reproduce Fig 7.2. The original figure is presented in Chapter 7 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 7-1: population sector behavior, 1900-1970.
    Population POP increases over time at an average growth rate of 1.2 percent per year. Both the birth rate CBR and the death rate CDR decrease over the period, the former largely because of a lower desired total
    fertility DTF, and the latter primarily as a result of increased health services LMHS. Both trends occur as a result of industrialization.
"""
function fig_2(; kwargs...)
    @named pop = Pop4.population()
    @named br = Pop4.birth_rate()
    @named dr = Pop4.death_rate()

    variables = [
        (pop.pop, 0,    4e9,  "pop"),
        (br.cbr,  0,    50,   "cbr"),
        (dr.cdr,  0,    50,   "cdr"),
        (dr.le,   0,    60,   "le"),
        (dr.lmf,  0.75, 1.75, "lmf"),
        (dr.lmp,  0.75, 1.75, "lmp"),
        (dr.lmhs, 0.75, 1.75, "lmhs"),
        (dr.lmc,  0.75, 1.75, "lmc"),
        (br.tf,   0,    8,    "tf"),
        (br.dtf,  0,    8,    "dtf"),
    ]

    return plotvariables(historicalrunsolution(), (t, 1900, 1970), variables; title="Fig. 7.2", kwargs...)
end

"""
    Reproduce Fig 7.3. The original figure is presented in Chapter 7 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 7-2: capital sector behavior, 1900-1970.
    Industrial capital IC grows exponentially, causing industrial output IO to
    grow. Since their growth rate is greater than that of population, industrial
    output per capita IOPC also grows over the period, as do service output
    per capita SOPC and food per capita (not graphed). As development proceeds, (1) the fraction of output in agriculture FOA declines, (2) FOA is
    largely replaced by the increasing fraction of output in industry FOI, and
    (3) the fraction of output in services FOS remains relatively constant, near
    50 percent of total output.
"""
function fig_3(; kwargs...)
    @named is = Capital.industrial_subsector()
    @named ss = Capital.service_subsector()
    @named se = SupplementaryEquations.supplementary_equations()

    variables = [
        (is.ic,   0, 4e12, "ic"),
        (is.io,   0, 4e12, "io"),
        (is.iopc, 0, 400,  "iopc"),
        (ss.sopc, 0, 400,  "sopc"),
        (se.foa,  0, 1,    "foa"),
        (se.foi,  0, 1,    "foi"),
        (se.fos,  0, 1,    "fos"),
    ]

    return plotvariables(historicalrunsolution(), (t, 1900, 1970), variables; title="Fig. 7.3", kwargs...)
end

"""
    Reproduce Fig 7.4. The original figure is presented in Chapter 7 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 7-3: agriculture sector behavior, 1900-1970.
    Increases in arable land AL and land yields LY cause a rise in food
    production over the historical period. The increase in land yields is
    primarily attributable to greater agricultural inputs per hectare AIPH (fertilizers, pesticides), for the land fertility LFERT remains nearly constant.
    Food per capita FPC also grows during the 70-year period but at a much
    slower rate than total food F, since the population is also increasing.
"""
function fig_4(; kwargs...)
    @named ld = Agriculture.land_development()
    @named ai = Agriculture.agricultural_inputs()
    @named lfd = Agriculture.land_fertility_degradation()

    variables = [
        (ld.f,      0, 2e12,  "f"),
        (ld.fpc,    0, 800,   "fpc"),
        (ld.al,     0, 1.6e9, "al"),
        (ai.ly,     0, 2000,  "ly"),
        (ai.aiph,   0, 80,    "aiph"),
        (lfd.lfert, 0, 800,   "lfert"),
    ]

    return plotvariables(historicalrunsolution(), (t, 1900, 1970), variables; title="Fig. 7.4", kwargs...)
end

"""
    Reproduce Fig 7.5. The original figure is presented in Chapter 7 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 7-4: nonrenewable resource sector behavior, 1900-1970.
    The rate of usage of nonrenewable resources NRUR grows exponentially
    at 4 percent per year over the historical period. This continuous increase is caused by the growth in both population POP and resource usage per
    capita PCRUM. Per capita resource usage rises as a result of industrial
    development. The increase in resource usage occurs at no additional increase
    in unit costs (see FCAOR in graph), in accordance with historical trends.
    In 1970, over 90 percent of the initial supply of nonrenewable resources
    remains to be used.
"""
function fig_5(; kwargs...)
    @named nr = NonRenewable.non_renewable()

    variables = [
        (nr.nrur,  0, 4e9, "nrur"),
        (nr.nrfr,  0, 1,   "nrfr"),
        (nr.fcaor, 0, 1,   "fcaor"),
        (nr.pcrum, 0, 1,   "pcrum"),
    ]

    return plotvariables(historicalrunsolution(), (t, 1900, 1970), variables; title="Fig. 7.5", kwargs...)
end

"""
    Reproduce Fig 7.6. The original figure is presented in Chapter 7 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 7-5: persistent pollution sector behavior, 1900-1970.
    The rate of generation of persistent pollutants PPGR increases exponentially as its two components, persistent pollutants generated from industrial output PPGIO and persistent pollutants generated from agricultural output PPG AO, rise over the 70-year period. After a 20-year delay, the persistent pollutant appearance rate PPAPR also rises, causing the index of persistent pollutants PPOLX to rise and eventually pass through its normalized value of 1.0 in 1970.
"""
function fig_6(; kwargs...)
    @named pp = Pollution.persistent_pollution()
    @named dr = Pop4.death_rate()

    variables = [
        (pp.ppgio, 0, 2e8, "ppgio"),
        (pp.ppgao, 0, 2e8, "ppgao"),
        (pp.ppgr,  0, 2e8, "ppgr"),
        (pp.ppapr, 0, 2e8, "ppapr"),
        (pp.ppolx, 0, 1,   "ppolx"),
        (pp.ahl,   0, 4,   "ahl"),
        (dr.lmp,   0, 4,   "lmp"),
    ]

    return plotvariables(historicalrunsolution(), (t, 1900, 1970), variables; title="Fig. 7.6", kwargs...)
end


"""
    Reproduce Fig 7.7. The original figure is presented in Chapter 7 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 7-6A: World3 reference run.
    This is the World3 reference run, to be compared with the sensitivity and
    policy tests that follow. Both population POP and industrial output per
    capita IOPC grow beyond sustainable levels and subsequently decline. The
    cause of their decline is traceable to the depletion of nonrenewable resources. Runs 7-6B and 7-6C illustrate the mechanisms that force population POP and industrial output per capita IOPC to decline.
"""
fig_7(; kwargs...) = plotvariables(historicalrunsolution(), (t, 1900, 2100), variables_7(); title="Fig. 7.7", kwargs...)

"""
    Reproduce Fig 7.8. The original figure is presented in Chapter 7 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 7-6B: capital sector variables from the reference run.
    This and the following run depict the mechanisms that forced population POP
    and industrial output per capita IOPC to decline in the preceding reference
    run (Figure 7.7). As resources are depleted, a larger fraction of capital must be allocated to obtaining resources FCAOR after the year 2000. FCAOR
    rises quite steeply because of the high rate of growth of the nonrenewable
    resource usage rate. The increase in FCAOR reduces the amount of capital allocated to producing industrial output so that both industrial output
    10 and industrial output per capita 10PC decrease after the year 2015.
    The lower industrial output 10 causes a reduction in total agricultural
    investment TAI and therefore in the amount of agricultural inputs per
    hectare AIPH allocated to producing food.
"""
function fig_8(; kwargs...)
    @named nr = NonRenewable.non_renewable()
    @named is = Capital.industrial_subsector()
    @named ld = Agriculture.land_development()
    @named ai = Agriculture.agricultural_inputs()

    variables = [
        (nr.fcaor, 0, 1,    "fcaor"),
        (is.io,    0, 4e12, "io"),
        (ld.tai,   0, 4e12, "tai"),
        (ai.aiph,  0, 200,  "aiph"),
        (ld.fioaa, 0, 0.2,  "fioaa"),
    ]

    return plotvariables(historicalrunsolution(), (t, 1900, 2100), variables; title="Fig. 7.8", kwargs...)
end

"""
    Reproduce Fig 7.9. The original figure is presented in Chapter 7 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 7-6C: agriculture sector variables from the reference run.
    As the level of agricultural inputs per hectare AIPH decreases after the
    year 2015 (Run 7-6B), land yield LY begins to fall. The resulting drop in
    food production causes food per capita FPC to decline after 2015. The
    lower food per capita FPC in turn reduces the lifetime multiplier from food
    LMF, which eventually raises the death rate and stops population growth.
"""
function fig_9(; kwargs...)
    @named ai = Agriculture.agricultural_inputs()
    @named ld = Agriculture.land_development()
    @named dr = Pop4.death_rate()
    @named pop = Pop4.population()

    variables = [
        (ai.ly,   0, 4000, "ly"),
        (ld.al,   0, 4e9,  "al"),
        (ld.fpc,  0, 800,  "fpc"),
        (dr.lmf,  0, 1.6,  "lmf"),
        (pop.pop, 0, 16e9, "pop"),
    ]

    return plotvariables(historicalrunsolution(), (t, 1900, 2100), variables; title="Fig. 7.9", kwargs...)
end

"""
    Reproduce Fig 7.10. The original figure is presented in Chapter 7 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 7-7: sensitivity of the initial value of nonrenewable resources to a doubling of NRI.
    To test the sensitivity of the reference run (Figure 7.7) to an error in the estimate of initial nonrenewable resources, NRI is doubled. As a result, industrialization continues for an additional 15 years until growth is again halted by the effects of resource depletion.
"""
function fig_10(; kwargs...)
    nr_parameters_7_10 = NonRenewable.getparameters()
    nr_parameters_7_10[:nri] = 2e12

    system = historicalrun(nonrenewable_params=nr_parameters_7_10)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables_7(); title="Fig. 7.10", kwargs...)
end

"""
    Reproduce Fig 7.11. The original figure is presented in Chapter 7 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 7-8: sensitivity of the initial value of nonrenewable resources to a tenfold increase in NRI.
    The initial value of nonrenewable resources NRI is increased by a factor
    of 10, to a value well outside its most likely range. Under this optimistic
    assumption, the effects of nonrenewable resource depletion are no longer
    a constraint to growth. Note that there is no dynamic difference in this
    run between setting resources at 10 times their reference value or assum¬
    ing an infinite value of resources. However, population and capital con¬
    tinue to grow until constrained by the rising level of pollution.
"""
function fig_11(; kwargs...)
    nr_parameters_7_11 = NonRenewable.getparameters()
    nr_parameters_7_11[:nri] = 1e13

    system = historicalrun(nonrenewable_params=nr_parameters_7_11)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables_7(); title="Fig. 7.11", kwargs...)
end

"""
    Reproduce Fig 7.13. The original figure is presented in Chapter 7 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 7-9: sensitivity of the fraction of industrial output allocated to agriculture.
    The slope of the fraction of industrial output allocated to agriculture
    FIOAA relationship is increased, reducing the time needed to redirect
    industrial output into or out of agricultural investment. This change has
    very little effect on the overall behavior of the model.
"""
function fig_13(; kwargs...)
    agr_tables_7_13 = Agriculture.gettables()
    agr_tables_7_13[:fioaa1] = (0.5, 0.3, 0.1, 0.0, 0.0, 0.0)
    agr_tables_7_13[:fioaa2] = (0.5, 0.3, 0.1, 0.0, 0.0, 0.0)

    system = historicalrun(agriculture_tables=agr_tables_7_13)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables_7(); title="Fig. 7.13", kwargs...)
end

"""
    Reproduce Fig 7.14. The original figure is presented in Chapter 7 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 7-10: sensitivity of the average lifetime of industrial capital.
    The average lifetime of industrial capital ALIC is increased 50 percent
    over its value in the reference run (from 14 years to 21 years), causing
    capital to grow faster than in the reference run. Although the behavior
    mode of the model is unchanged, the model variables do not pass through
    their 1970 historical values. This parameter, as well as the other
    parameters in the capital growth loop, is an important factor in determining the growth rate of capital.
"""
function fig_14(; kwargs...)
    cap_parameters_7_14 = Capital.getparameters()
    cap_parameters_7_14[:alic1] = 21
    cap_parameters_7_14[:alic2] = 21

    system = historicalrun(capital_params=cap_parameters_7_14)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables_7(); title="Fig. 7.14", kwargs...)
end

"""
    Reproduce Fig 7.15. The original figure is presented in Chapter 7 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 7-11: sensitivity of the average lifetime of industrial capital and the industrial capital-output ratio.
    As in the previous run, the average lifetime of industrial capital ALIC is
    increased from 14 to 21 years. To ensure that the model duplicates
    historical behavior, the industrial capital-output ratio ICOR is also increased (from 3 to 3.75). The resulting behavior is very similar to that of the reference run. Changes in the elements affecting capital growth, when
    constrained to produce behavior consistent with historical behavior, do
    not significantly affect the behavior of the model.
"""
function fig_15(; kwargs...)
    cap_parameters_7_15 = Capital.getparameters()
    cap_parameters_7_15[:alic1] = 21
    cap_parameters_7_15[:alic2] = 21
    cap_parameters_7_15[:icor1] = 3.75
    cap_parameters_7_15[:icor2] = 3.75

    system = historicalrun(capital_params=cap_parameters_7_15)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables_7(); title="Fig. 7.15", kwargs...)
end

"""
    Reproduce Fig 7.16. The original figure is presented in Chapter 7 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 7-12: improved resource exploration and extraction technologies.
    The implementation of improved resource exploration and extraction
    technologies in 1975 is modeled by lowering the capital cost of obtaining
    resources for industrial production. This policy allows industrial production to continue growing for a few more years than in the reference run, but it is ineffective in avoiding the effects of resource depletion.
"""
function fig_16(; kwargs...)
    nr_tables_7_16 = NonRenewable.gettables()
    nr_tables_7_16[:fcaor2] = (1.0, 0.2, 0.1, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05)

    system = historicalrun(nonrenewable_tables=nr_tables_7_16)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables_7(); title="Fig. 7.16", kwargs...)
end

"""
    Reproduce Fig 7.18. The original figure is presented in Chapter 7 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 7-13: recycling technologies.
    The advances in resource exploration and extraction technologies of Run
    7-12 are supplemented by an improvement in recycling technologies that
    reduces per capita resource usage by a factor of eight in 1975. That
    policy removes the constraining effects of resource depletion and allows
    population and capital growth to continue until checked by persistent
    pollution.
"""
function fig_18(; kwargs...)
    nr_parameters_7_18 = NonRenewable.getparameters()
    nr_parameters_7_18[:nruf2] = 0.125

    nr_tables_7_18 = NonRenewable.gettables()
    nr_tables_7_18[:fcaor2] = (1.0, 0.2, 0.1, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05)

    system = historicalrun(nonrenewable_params= nr_parameters_7_18, nonrenewable_tables=nr_tables_7_18)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables_7(); title="Fig. 7.18", kwargs...)
end

"""
    Reproduce Fig 7.19. The original figure is presented in Chapter 7 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 7-14: resource and air pollution control technologies.
    As resource technologies eliminate the resource constraint to growth,
    industrial output continues to grow until it generates intolerable levels of
    pollution. To decrease the constraining effects of pollution on the system,
    Run 7-14 assumes that new air pollution control technologies are implemented in 1975. These additional technologies substantially reduce the
    adverse effects of air pollution on land yield. However, land yield and
    food per capita still decline, for the high index of persistent pollution
    PPOLX decreases the land fertility. The improvement in air pollution
    control technologies has solved only a small part of the pollution problem, for the rise in persistent pollutants ends growth in the other sectors of
    the model.
"""
function fig_19(; kwargs...)
    nr_parameters_7_19 = NonRenewable.getparameters()
    nr_parameters_7_19[:nruf2] = 0.125

    nr_tables_7_19 = NonRenewable.gettables()
    nr_tables_7_19[:fcaor2] = (1.0, 0.2, 0.1, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05)

    agr_tables_7_19 = Agriculture.gettables()
    agr_tables_7_19[:lymap2] = (1.0, 1.0, 0.98, 0.95)

    system = historicalrun(nonrenewable_params= nr_parameters_7_19, nonrenewable_tables=nr_tables_7_19, agriculture_tables=agr_tables_7_19)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables_7(); title="Fig. 7.19", kwargs...)
end

"""
    Reproduce Fig 7.20. The original figure is presented in Chapter 7 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 7-15: resource and pollution technologies.
    Note: The scale for lOPC has been increased from 1,000 to 2,000 dollars
    per person-year.
    The resource arid air pollution control technologies of the previous run
    are augmented in 1975 by a technological policy that reduces by a factor
    of 10 the index of persistent pollution PPOLX 'generated by each unit of
    agricultural and industrial output. The lower level of pollution allows
    population and industrial output to continue to grow until the amount of
    available food becomes the constraining factor. The decline in food per
    capita FPC eventually causes a reduction in both population POP and
    industrial output per capita IOPC.
"""
function fig_20(; kwargs...)
    nr_parameters_7_20 = NonRenewable.getparameters()
    nr_parameters_7_20[:nruf2] = 0.125

    pol_parameters_7_20 = Pollution.getparameters()
    pol_parameters_7_20[:ppgf21] = 0.1

    nr_tables_7_20 = NonRenewable.gettables()
    nr_tables_7_20[:fcaor2] = (1.0, 0.2, 0.1, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05)

    agr_tables_7_20 = Agriculture.gettables()
    agr_tables_7_20[:lymap2] = (1.0, 1.0, 0.98, 0.95)

    system = historicalrun(
        nonrenewable_params=nr_parameters_7_20,
        pollution_params=pol_parameters_7_20,
        nonrenewable_tables=nr_tables_7_20,
        agriculture_tables=agr_tables_7_20,
    )

    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables_20(); title="Fig. 7.20", kwargs...)
end

"""
    Reproduce Fig 7.21. The original figure is presented in Chapter 7 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 7-16: resource, pollution, and land yield technologies.
    Note: The scale of IOPC has been increased from 1,000 to 2,000 dollars
    per person-year.
    To increase food production, new agricultural technologies are implemented, augmenting the resource and pollution technologies of the previous run; they increase the land yield LY by a factor of 2 in 1975.
    This policy successfully raises the level of food in the short run, but in the long run the high yields cause increased land erosion, which later decreases the available food. After the year 2050 the higher rate of erosion
    depresses yields (and thus food per capita FPC) below the values observed in the previous run. As a result, population POP and industrial
    output per capita IOPC decline earlier than in Run 7-15, which assumed
    no new land yield technologies.
"""
function fig_21(; kwargs...)
    nr_parameters_7_21 = NonRenewable.getparameters()
    nr_parameters_7_21[:nruf2] = 0.125

    pol_parameters_7_21 = Pollution.getparameters()
    pol_parameters_7_21[:ppgf21] = 0.1

    agr_parameters_7_21 = Agriculture.getparameters()
    agr_parameters_7_21[:lyf2] = 2

    nr_tables_7_21 = NonRenewable.gettables()
    nr_tables_7_21[:fcaor2] = (1.0, 0.2, 0.1, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05)

    agr_tables_7_21 = Agriculture.gettables()
    agr_tables_7_21[:lymap2] = (1.0, 1.0, 0.98, 0.95)

    system = historicalrun(
        nonrenewable_params=nr_parameters_7_21,
        pollution_params=pol_parameters_7_21,
        agriculture_params=agr_parameters_7_21,
        nonrenewable_tables=nr_tables_7_21,
        agriculture_tables=agr_tables_7_21,
    )

    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables_20(); title="Fig. 7.21", kwargs...)
end

"""
    Reproduce Fig 7.22. The original figure is presented in Chapter 7 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 7-17: resource, pollution, and agricultural technologies.
    Note: The scale of IOPC has been increased from 1,000 to 8,000 dollars
    per person-year.
    The resource, pollution, and land yield technologies of the previous run
    are supplemented in 1975 by an improvement in land maintenance technologies. These new technologies ensure that higher land yields do not
    lead to any significant increase in land erosion. The reduced constraints in
    the resource, pollution, and agriculture sectors allow population POP and
    industrial output per capita IOPC to continue to grow until the effects of
    resource depletion are again evident, as in the reference run. Both population POP and industrial output per capita IOPC decline after the year
    2080.
"""
function fig_22(; kwargs...)
    @named nr = NonRenewable.non_renewable()
    @named is = Capital.industrial_subsector()
    @named ld = Agriculture.land_development()
    @named pop = Pop4.population()
    @named pp = Pollution.persistent_pollution()
    @named br = Pop4.birth_rate()
    @named dr = Pop4.death_rate()

    variables = [
        (nr.nrfr,  0, 1,    "nrfr"),
        (is.iopc,  0, 8000, "iopc"),
        (ld.fpc,   0, 1000, "fpc"),
        (pop.pop,  0, 16e9, "pop"),
        (pp.ppolx, 0, 32,   "ppolx"),
        (br.cbr,   0, 50,   "cbr"),
        (dr.cdr,   0, 50,   "cdr"),
    ]

    nr_parameters_7_22 = NonRenewable.getparameters()
    nr_parameters_7_22[:nruf2] = 0.125

    pol_parameters_7_22 = Pollution.getparameters()
    pol_parameters_7_22[:ppgf21] = 0.1

    agr_parameters_7_22 = Agriculture.getparameters()
    agr_parameters_7_22[:lyf2] = 2

    nr_tables_7_22 = NonRenewable.gettables()
    nr_tables_7_22[:fcaor2] = (1.0, 0.2, 0.1, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05)

    agr_tables_7_22 = Agriculture.gettables()
    agr_tables_7_22[:lymap2] = (1.0, 1.0, 0.98, 0.95)
    agr_tables_7_22[:llmy2] = (1.2, 1.0, 0.9, 0.8, 0.75, 0.7, 0.67, 0.64, 0.62, 0.6)

    system = historicalrun(
        nonrenewable_params=nr_parameters_7_22,
        pollution_params=pol_parameters_7_22,
        agriculture_params=agr_parameters_7_22,
        nonrenewable_tables=nr_tables_7_22,
        agriculture_tables=agr_tables_7_22,
    )

    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables; title="Fig. 7.22", kwargs...)
end


"""
    Reproduce Fig 7.23. The original figure is presented in Chapter 7 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 7-18: exponential changes in technology.
    Here it is assumed that exponentially increasing technologies are able to
    postpone indefinitely the effects of the constraints to growth, as modeled
    in World3, at no cost and with no delays in development and implementation. The improved technologies tend to reduce per capita resource usage
    and pollution generation per unit of agricultural and industrial output at 4
    percent per year after 1975. At the same time, land yields tend to increase
    at 4 percent per year, with no upper limit and with practically no adverse
    side effects such as land erosion. Although industrialization grows exponentially, the rate of removal of land for urban-industrial use decreases to zero by the year 2000. Finally, air pollution is assumed to have no adverse effects on land yield. Under these assumptions, population
    reaches 14 billion people in the year 2100 and continues to grow (though
    at a slow rate of 0.6 percent per year). Food is in abundance throughout
    the run resource usage declines to zero as fewer resources are needed to
    sustain output, and industrial output per capita IOPC continues to grow
    indefinitely.
"""
fig_23(; kwargs...) = @info "This figure is not implemented yet."

"""
    Reproduce Fig 7.24. The original figure is presented in Chapter 7 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 7-19: adaptive technological policies—no delays, no costs.
    Technological advances in reducing per capita resource usage, diminishing pollution, and increasing land yield are assumed to occur in response
    to a perceived need for the technologies. The maximum rate of change for
    each technology is assumed to be 5 percent per year. In addition, discrete
    advances in exploration and extraction technologies, land maintenance
    technologies, and air pollution technologies are assumed to be implemented
    in 1975. This run is similar in behavior to Run 7-18, in which technological
    improvements rise continuously at 4 percent per year. Growth is maintained through the year 2100 because of the absence of significant delays
    and costs in the development of new technologies.
"""
fig_24(; kwargs...) = @info "This figure is not implemented yet."

"""
    Reproduce Fig 7.26. The original figure is presented in Chapter 7 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 7-20: adaptive technological policies—the effects of limitations to technological capabilities.
    The adaptive technological policies assumed in this run are identical to
    those in Run 7-19 except that the maximum rate of technological change
    is assumed to be 2 percent instead of 5 percent per year. Technology is
    unable to avoid the effects of the constraints to growth because industrial
    output per capita IOPC and population POP grow faster than the maximum rate of technological change. In this run, resource depletion again halts growth in population and industrial output.
"""
fig_26(; kwargs...) = @info "This figure is not implemented yet."

"""
    Reproduce Fig 7.27. The original figure is presented in Chapter 7 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 7-21: adaptive technological policies—the effects of technological development and implementation costs.
    Here it is assumed that more effective recycling, pollution control, and
    land yield advances can be obtained only at increasing costs. These
    higher costs are represented in the model by a rise in the industrial
    capital-output ratio I COR. A trade-off now occurs between the benefits of
    continued growth and the costs of the technologies that make further
    growth possible. The rising costs of the new technologies cause industrial
    output per capita IOPC to decline after the year 2010.
"""
fig_27(; kwargs...) = @info "This figure is not implemented yet."

"""
    Reproduce Fig 7.30. The original figure is presented in Chapter 7 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 7-22: adaptive technological policies—the effects of delays and costs of technological development and implementation.
    Advances in recycling, pollution control, and land yield technologies are
    again assumed to be obtainable only at a finite cost. In addition, it is
    assumed that the benefits of these technologies will not be realized until
    10 years after their initiation. As in Run 7-21, the rising costs, modeled
    as a rise in the industrial capital-output ratio ICOR, cause industrial
    output per capita IOPC to decline. The added costs incurred by the continued implementation of new technologies even after IOPC has peaked
    force IOPC to fall more precipitously than in Run 7-21.
"""
fig_30(; kwargs...) = @info "This figure is not implemented yet."

"""
    Reproduce Fig 7.32. The original figure is presented in Chapter 7 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 7-23: adaptive technological policies—the effects of delays and costs,with a bias for continued growth in industrial output per capita.
    The previous run assumed that new recycling, pollution control, and land
    yield technologies are developed in response to a perceived need for
    them. Because of the time involved in technological development and
    implementation, however, these new technologies were effective only after
    a delay. Moreover, their development and implementation required additional capital, which increased the industrial capital-output ratio. In this
    run, the assumptions of Run 7-22 are augmented with a societal bias
    toward continued growth in industrial output per capita IOPC. Technological policies are implemented only as long as they do not hamper
    continued growth in IOPC. This policy is effective in continuing growth
    in the short run but counterproductive in the long run: the failure to implement the new technologies causes a significant depletion of resources
    and growth is ultimately terminated.
"""
fig_32(; kwargs...) = @info "This figure is not implemented yet."

"""
    Reproduce Fig 7.34. The original figure is presented in Chapter 7 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 7-24: reduction of the desired completed family size.
    To reduce the pressures of population growth in the reference run, the
    desired completed family size is reduced to 2 children per family in 1975.
    Population POP continues to grow gradually for 70 years because of the
    delays inherent in the age structure. However, the effects of resource depletion again force the population to decline after 2040, as in the reference run. Since population growth is reduced, industrial output per capita IOPC and food per capita FPC rise more rapidly between 1975 and 2020
    than in the reference run.
"""
function fig_34(; kwargs...)
    pop_parameters_7_34 = Pop4.getparameters()
    pop_parameters_7_34[:zpgt] = 1975

    system = historicalrun(pop_params=pop_parameters_7_34)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables_7(); title="Fig. 7.34", kwargs...)
end

"""
    Reproduce Fig 7.35. The original figure is presented in Chapter 7 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 7-25: increase of industrial and service capital lifetimes.
    Both the average lifetime of industrial capital ALIC and the lifetime of
    service capital ALSC are increased 50 percent in 1975, thereby extending
    the productivity of capital. When implemented without additional policies
    to reduce the capital investment rate, this policy proves to be counterproductive in the long run. Compared with the reference run, the extension of product lifetimes allows industrial output to grow more rapidly, leading to a quicker depletion of resources. The rise in resource costs forces industrial output per capita IOPC to decline earlier than in the reference run.
"""
function fig_35(; kwargs...)
    cap_parameters_7_35 = Capital.getparameters()
    cap_parameters_7_35[:alic1] = 21
    cap_parameters_7_35[:alsc2] = 30

    system = historicalrun(capital_params=cap_parameters_7_35)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables_7(); title="Fig. 7.35", kwargs...)
end

"""
    Reproduce Fig 7.36. The original figure is presented in Chapter 7 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 7-26: shift in the choice of output forms.
    The amount of food and services desired by the population per unit of
    industrial output is increased by 50 percent in 1975. This shift in the
    choice of output slows the growth in industrial capital and industrial
    output, putting less pressure on the resource base. In the long run,
    however, the continually rising population POP thwarts the effectiveness
    of this policy, forcing a decline in industrial output per capita IOPC due
    to resource depletion.
"""
function fig_36(; kwargs...)
    cap_tables_7_36 = Capital.gettables()
    cap_tables_7_36[:isopc2] = (60, 450, 960, 1500, 1830, 2175, 2475, 2700, 3000)

    agr_tables_7_36 = Agriculture.gettables()
    agr_tables_7_36[:ifpc2] = (345, 720, 1035, 1275, 1455, 1605, 1725, 1815, 1875)

    system = historicalrun(capital_tables=cap_tables_7_36, agriculture_tables=agr_tables_7_36)
    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables_7(); title="Fig. 7.36", kwargs...)
end

"""
    Reproduce Fig 7.37. The original figure is presented in Chapter 7 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 7-27: population policy and shift of output choices.
    A combination of social policies that cause a reduction of growth both in
    population and in industrial capital is simulated in this run. In 1975 the
    desired completed family size is reduced to 2 children per family and the
    amount of services and food per unit of industrial output desired by the population is increased by 50 percent. The resulting behavior is substantially more stable than in the reference run, but the overshoot and decline mode is still evident. In World3, even these reduced levels of population and industrial capital cannot be sustained over the long term; new technological policies must be added to offset the effects of the limits to growth.
"""
function fig_37(; kwargs...)
    pop_parameters_7_37 = Pop4.getparameters()
    pop_parameters_7_37[:zpgt] = 1975

    cap_tables_7_37 = Capital.gettables()
    cap_tables_7_37[:isopc2] = (60, 450, 960, 1500, 1830, 2175, 2475, 2700, 3000)

    agr_tables_7_37 = Agriculture.gettables()
    agr_tables_7_37[:ifpc2] = (345, 720, 1035, 1275, 1455, 1605, 1725, 1815, 1875)

    system = historicalrun(
        pop_params=pop_parameters_7_37,
        capital_tables=cap_tables_7_37,
        agriculture_tables=agr_tables_7_37,
    )

    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables_7(); title="Fig. 7.37", kwargs...)
end

"""
    Reproduce Fig 7.38. The original figure is presented in Chapter 7 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 7-28: equilibrium through discrete policy changes.
    To obtain one example of a sustainable state of equilibrium, this run
    combines discrete policy changes in both technology and social values.
    To stabilize the population POP, the desired completed family size is
    reduced to 2 children per family in 1975. The growth in industrial capital is reduced in 1990 by reinvesting only enough industrial output to keep industrial output per capita IOPC at a constant level. In addition, new recycling and pollution control technologies are developed, capital lifetimes are increased, and social choices of output forms are shifted toward a preference for food and services. Population POP stabilizes in 2050 at 5 billion people, industrial output per capita IOPC levels off in 1990 at 350 dollars per person-year, and food per capita FPC stabilizes by the year 2000 at three times the subsistence level. The index of persistent pollution PPOLX is kept at very low levels, and the rate of resource depletion is slow enough to permit technology and industrial processes to adjust to changes in the availability of resources.
"""
function fig_38(; kwargs...)
    pop_parameters_7_38 = Pop4.getparameters()
    pop_parameters_7_38[:zpgt] = 1975

    cap_parameters_7_38 = Capital.getparameters()
    cap_parameters_7_38[:iet] = 1990
    cap_parameters_7_38[:iopcd] = 320
    cap_parameters_7_38[:alic2] = 21
    cap_parameters_7_38[:alsc2] = 30

    nr_parameters_7_38 = NonRenewable.getparameters()
    nr_parameters_7_38[:nruf2] = 0.125

    pol_parameters_7_38 = Pollution.getparameters()
    pol_parameters_7_38[:ppgf21] = 0.25

    cap_tables_7_38 = Capital.gettables()
    cap_tables_7_38[:isopc2] = (60, 450, 960, 1500, 1830, 2175, 2475, 2700, 3000)

    agr_tables_7_38 = Agriculture.gettables()
    agr_tables_7_38[:ifpc2] = (345, 720, 1035, 1275, 1455, 1605, 1725, 1815, 1875)

    system = historicalrun(
        pop_params=pop_parameters_7_38,
        capital_params=cap_parameters_7_38,
        nonrenewable_params=nr_parameters_7_38,
        pollution_params=pol_parameters_7_38,
        capital_tables=cap_tables_7_38,
        agriculture_tables=agr_tables_7_38,
    )

    solution = solve(system, (1900, 2100))

    return plotvariables(solution, (t, 1900, 2100), variables_7(); title="Fig. 7.38", kwargs...)
end


"""
    Reproduce Fig 7.39. The original figure is presented in Chapter 7 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 7-29: equilibrium through adaptive policies.
    Adaptive technological policies that increase resource recycling, reduce
    persistent pollution generation, and increase land yields are combined
    with social policies that stabilize population POP and industrial output
    per capita IOPC. The technological advances in recycling, pollution control , and land yields are assumed to be effective only after a delay and to require capital for their development and implementation. As in the adaptive technological runs described in section 7.5, additional technologies are assumed to be implemented in 1975. These policies lower resource costs, decrease the effects of air pollution, and reduce land erosion. The resulting model behavior reaches equilibrium because the stable population and capital reduce the need for new technologies. Thus the newly implemented technologies are less costly, and the delays in their development and implementation are less critical to their effectiveness.
"""
fig_39(; kwargs...) = @info "This figure is not implemented yet."

"""
    Reproduce Fig 7.41. The original figure is presented in Chapter 7 of [DGFW](https://archive.org/details/dynamicsofgrowth0000unse).

    Caption: Run 7-30: stabilization policies introduced in the year 2000.
    The combination of adaptive technological and social policies of the previous run are not introduced until the year 2000. The continuation of
    growth for an additional 25 years further erodes the carrying capacity of
    World3; therefore, the policies that led to equilibrium 25 years earlier are
    no longer effective.
"""
fig_41(; kwargs...) = @info "This figure is not implemented yet."
