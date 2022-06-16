using PlotlyJS
using ColorSchemes


function plotvariables(solution, xvalue, variables; name="", showaxis=false, showlegend=true, linetype="lines", colored=false)
    numvars = length(variables)

    @assert 1 ≤ numvars


    colors = colored ? ColorSchemes.tab10.colors : fill(RGB(0.2, 0.2, 0.2), numvars)   

    x_offset = 0.05
    x_domain = showaxis ? x_offset * numvars - 0.04 : 0.0


    traces = GenericTrace[]

    (var, min, max) = variables[1]

    layout = Dict([
        ("title", attr(text=name, x=0.5)), 
        ("showlegend", showlegend),
        ("plot_bgcolor", "#EEE"),
        ("xaxis", attr(domain=[x_domain+0.02, 1.0], position=0.0)),
        ("yaxis", attr(
            color = colors[1], 
            visible = showaxis, 
            name = "", 
            position = 0.0, 
            showgrid = false, 
            range = [min, max], 
            domain = [0.05, 1.0]
        ))
    ])

    push!(traces, scatter(
        x = solution[xvalue], 
        y = solution[var], 
        marker_color = colors[1], 
        name = string(var), 
        mode = linetype, yaxis="y1")
    )


    for i ∈ 2:numvars
        (var, min, max) = variables[i]

        layout[string("yaxis", i)] = attr(
            color = colors[i], 
            overlaying = "y", 
            visible = showaxis, 
            name = "", 
            position = (i-1) * x_offset, 
            showgrid = false, 
            range = [min, max]
        )

        push!(traces, scatter(
            x = solution[xvalue], 
            y = solution[var], 
            marker_color = colors[i], 
            name = string(var), 
            mode = linetype, 
            yaxis = string("y", i))
        )
    end

    plot(traces, Layout(layout))
end
