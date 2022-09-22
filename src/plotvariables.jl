using PlotlyJS
using ColorTypes
using ColorSchemes


function plotvariables(solution, xrange, variables::Vector{<:Number}; kwargs...)
    plotvariables(solution, xrange, tuple.(variables, -Inf, Inf, ""); kwargs...)
end

function plotvariables(solution, xrange, variables::Vector{<:NTuple{1, Any}}; kwargs...)
    plotvariables(solution, xrange, map(t -> tuple(t[1], -Inf, Inf, ""), variables); kwargs...)
end

function plotvariables(solution, xrange, variables::Vector{<:NTuple{2, Any}}; kwargs...)
    plotvariables(solution, xrange, map(t -> tuple(t[1], -Inf, Inf, t[2]), variables); kwargs...)
end

function plotvariables(solution, xrange, variables::Vector{<:NTuple{3, Any}}; kwargs...)
    plotvariables(solution, xrange, map(t -> tuple(t..., ""), variables); kwargs...)
end

"""
   `plotvariables(solution, xrange, variables::Vector{<:NTuple{4, Any}}; name="", showaxis=true, showlegend=true, linetype="lines", colored=true)`

Plot the values of the variables in the vector `variables` obtained by the ODE system `solution` (normally, obtained by using the `solve` function in `solvesystems.jl`) in the specified `xrange` interval. For each variable, the vector `variables` includes a quadruple, containing the Julia variable, its range, and its symbolic name to be shown in the plot.
"""
function plotvariables(solution, xrange, variables::Vector{<:NTuple{4, Any}}; name="", showaxis=true, showlegend=true, linetype="lines", colored=true, save=false)
    numvars = length(variables)

    @assert 1 ≤ numvars
    @assert (1 == length(xrange)) || (3 == length(xrange))
    @assert 4 == length(variables[1])


    colors = colored ? ColorSchemes.tab10.colors : fill(RGB(0.2, 0.2, 0.2), numvars)

    x_offset = 0.05
    x_domain = showaxis ? x_offset * numvars - 0.04 : 0.0


    traces = GenericTrace[]

    (xvalue, xmin, xmax) = (3 == length(xrange)) ? xrange : (xrange[1], -Inf, Inf)
    (var, varmin, varmax, varname) = variables[1]

    layout = Dict([
        ("title", attr(text=name, x=0.5)),
        ("showlegend", showlegend),
        ("plot_bgcolor", "#EEE"),
        ("xaxis", attr(
            domain = [x_domain+0.02, 1.0],
            position = 0.0,
            range = [xmin, xmax])),
        ("yaxis", attr(
            color = colors[1],
            visible = showaxis,
            name = "",
            position = 0.0,
            showgrid = false,
            range = [varmin, varmax],
            domain = [0.05, 1.0]
        ))
    ])

    push!(traces, scatter(
        x = solution[xvalue],
        y = solution[var],
        marker_color = colors[1],
        name = varname,
        mode = linetype, yaxis="y1")
    )


    for i ∈ 2:numvars
        (var, varmin, varmax, varname) = variables[i]

        layout[string("yaxis", i)] = attr(
            color = colors[i],
            overlaying = "y",
            visible = showaxis,
            name = "",
            position = (i-1) * x_offset,
            showgrid = false,
            range = [varmin, varmax]
        )

        push!(traces, scatter(
            x = solution[xvalue],
            y = solution[var],
            marker_color = colors[i],
            name = varname,
            mode = linetype,
            yaxis = string("y", i))
        )
    end

    p = plot(traces, Layout(layout))
    save && savefig(p, "./" * name * ".svg")

    return p
end
