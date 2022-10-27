using WorldDynamics, ModelingToolkit

macro create_eq(s)
	esc(s)
end

function variable_connections(systems::Vector{ODESystem})
    connection_eqs::Vector{Equation} = []
    var2sys::Dict{String,String} = Dict{String,String}()
    for e in 1:lastindex(systems)
        g = variable_dependencies(systems[e])
        al = g.fadjlist
        for u in 1:lastindex(al)
            if (length(al[u]) > 0)
                # println(nameof(systems[e]), ".", states(systems[e])[u])
                var2sys[string(states(systems[e])[u])] = string(nameof(systems[e]))
            end
        end
    end
    # f = open("connection_eqs.jl", "w")
    # write(f, "connection_eqs = [\n")
    for e in 1:lastindex(systems)
        ed = equation_dependencies(systems[e])
        for u in 1:lastindex(ed)
            vl = ed[u]
            for v in 1:lastindex(vl)
                if (var2sys[string(vl[v])] != string(nameof(systems[e])))
                    # s = string(nameof(systems[e])) * "." * string(vl[v]) * " ~ " * var2sys[string(vl[v])] * "." * string(vl[v]) * ",\n"
                    # write(f, s)
                    s = string(nameof(systems[e])) * "." * string(vl[v]) * " ~ " * var2sys[string(vl[v])] * "." * string(vl[v])
                    println(s)
                    current_eq =  @create_eq(Meta.parse(s))
                    push!(connection_eqs, current_eq)
                end
            end
        end
    end
    # write(f, "]\n")
    # close(f)
    return connection_eqs
end

function sys_eqs(;
    pop_params=World2.Population._params,
    capital_params=World2.CapitalInvestment._params,
    agriculture_params=World2.AgricultureInvestment._params,
    naturalresources_params=World2.NaturalResources._params,
    pollution_params=World2.Pollution._params,
    qualitylife_params=World2.QualityLife._params,
    pop_inits=World2.Population._inits,
    capital_inits=World2.CapitalInvestment._inits,
    agriculture_inits=World2.AgricultureInvestment._inits,
    naturalresources_inits=World2.NaturalResources._inits,
    pollution_inits=World2.Pollution._inits,
    qualitylife_inits=World2.QualityLife._inits,
    pop_tables=World2.Population._tables,
    capital_tables=World2.CapitalInvestment._tables,
    agriculture_tables=World2.AgricultureInvestment._tables,
    naturalresources_tables=World2.NaturalResources._tables,
    pollution_tables=World2.Pollution._tables,
    qualitylife_tables=World2.QualityLife._tables,
    pop_ranges=World2.Population._ranges,
    capital_ranges=World2.CapitalInvestment._ranges,
    agriculture_ranges=World2.AgricultureInvestment._ranges,
    naturalresources_ranges=World2.NaturalResources._ranges,
    pollution_ranges=World2.Pollution._ranges,
    qualitylife_ranges=World2.QualityLife._ranges
)
    @named pop = World2.Population.population(; params=pop_params, inits=pop_inits, tables=pop_tables, ranges=pop_ranges)
    @named dr = World2.Population.death_rate(; params=pop_params, inits=pop_inits, tables=pop_tables, ranges=pop_ranges)
    @named br = World2.Population.birth_rate(; params=pop_params, inits=pop_inits, tables=pop_tables, ranges=pop_ranges)

    @named ci = World2.CapitalInvestment.capital_investment(; params=capital_params, inits=capital_inits, tables=capital_tables, ranges=capital_ranges)
    @named cig = World2.CapitalInvestment.capital_investment_generation(; params=capital_params, inits=capital_inits, tables=capital_tables, ranges=capital_ranges)
    @named cid = World2.CapitalInvestment.capital_investment_discard(; params=capital_params, inits=capital_inits, tables=capital_tables, ranges=capital_ranges)

    @named ai = World2.AgricultureInvestment.agriculture_investment(; params=agriculture_params, inits=agriculture_inits, tables=agriculture_tables, ranges=agriculture_ranges)

    @named nr = World2.NaturalResources.natural_resources(; params=naturalresources_params, inits=naturalresources_inits, tables=naturalresources_tables, ranges=naturalresources_ranges)
    @named nrur = World2.NaturalResources.natural_resources_usage_rate(; params=naturalresources_params, inits=naturalresources_inits, tables=naturalresources_tables, ranges=naturalresources_ranges)

    @named pol = World2.Pollution.pollution(; params=pollution_params, inits=pollution_inits, tables=pollution_tables, ranges=pollution_ranges)
    @named pola = World2.Pollution.pollution_absorption(; params=pollution_params, inits=pollution_inits, tables=pollution_tables, ranges=pollution_ranges)
    @named polg = World2.Pollution.pollution_generation(; params=pollution_params, inits=pollution_inits, tables=pollution_tables, ranges=pollution_ranges)

    @named ql = World2.QualityLife.quality_life(; params=qualitylife_params, inits=qualitylife_inits, tables=qualitylife_tables, ranges=qualitylife_ranges)

    systems = [
        pop, dr, br,
        ci, cig, cid,
        ai,
        nr, nrur,
        pol, pola, polg,
        ql,
    ]

    connection_eqs::Vector{Equation} = variable_connections(systems)

    return WorldDynamics.compose(systems, connection_eqs)
end
