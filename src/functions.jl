using IfElse
using Formatting
using Graphs
using Latexify
using PlotlyJS
using Printf

using WorldDynamics

"""
   `add_equation(eqs, equation)`

Adds `equation` to the list `eqs` of equations.
"""
function add_equation!(eqs, equation)
   append!(eqs, [equation])
end

"""
   `delay_n!(eqs, x, rt, lv, delay, order)`
   
Returns an N'th order exponential delay.
"""
function delay_n!(eqs, x, rt, lv, delay, order)
   append!(eqs, [rt[1] ~ lv[1] / (delay / order)])
   append!(eqs, [D(lv[1]) ~ x - rt[1]])
   for d in 2:order
      append!(eqs, [rt[d] ~ lv[d] / (delay / order)])
      append!(eqs, [D(lv[d]) ~ rt[d-1] - rt[d]])
   end
end

"""
   `ramp(x, slope, startx, endx)`

Returns `0` until the `startx` and then slopes upward until `endx` and then holds constant. This function corresponds to the `RAMP` function in the `VENSIM` language.
"""
ramp(x, slope, startx, endx) = IfElse.ifelse(x > startx, IfElse.ifelse(x < endx, slope * (x - startx), slope * (endx - startx)), 0)

"""
   `smooth!(eqs, x, input, delay_time)`

Returns a exponential smooth of the input.
"""
function smooth!(eqs, x, input, delay_time)
   append!(eqs, [D(x) ~ (input - x) / delay_time])
end

"""
   `clip(returnifgte, returniflt, inputvalue, threshold)`

Returns `returnifgte` if the value `inputvalue` is greater than the threshold `threshold`, `returniflt` otherwise. This function corresponds to the `CLIP` (also called `FIFGE`) function in the `DYNAMO` language.
"""
clip(returnifgte, returniflt, inputvalue, threshold) = IfElse.ifelse(inputvalue ≥ threshold, returnifgte, returniflt)

"""
   `step(inputvalue, returnifgte, threshold)`

Returns `0` if the value `inputvalue` is smaller than the threshold `threshold`, `returnifgte` otherwise. This function corresponds to the `STEP` function in the `DYNAMO` language.
"""
step(inputvalue, returnifgte, threshold) = clip(returnifgte, zero(returnifgte), inputvalue, threshold)


"""
   `pulse(inputvalue, start, width)`

Returns 1.0, starting at time start, and lasting for interval width; 0.0 is returned at all other times. If width is passed as 0 it will be treated as though it were the current value of TIME STEP. This function corresponds to the `PULSE` function in the `VENSIM` language.
"""
pulse(inputvalue, start, width) = IfElse.ifelse(inputvalue >= start, 1, 0) * IfElse.ifelse(inputvalue < (start + width), 1, 0)

interpolate(x, x₁, xₙ, y₁, yₙ) = y₁ + (x - x₁) * ((yₙ - y₁) / (xₙ - x₁))

"""
   `interpolate(x, yvalues, xrange)`

Returns the value of a function with input `x`, by linearly interpolating the function itself through the table `yvalues` and the range `xrange`. If `x` is out of the range, the value at the corresponding extremity is returned. This function corresponds to the `TABHL` function in the `DYNAMO` language. This latter function receives a table (that is, `yvalues`), a value (that is, `x`), a left and a right extreme of an interval (that is, `xrange`), and an increment value.
"""
function interpolate(x, yvalues::Tuple{Vararg{Float64}}, xrange::Tuple{Float64,Float64})
   interpolate(x, collect(yvalues), collect(LinRange(xrange[1], xrange[2], length(yvalues))))
end

function interpolate(x, yvalues::Vector{Float64}, xvalues::Vector{Float64})
   # y gets the min y value if less than the min x range
   #   or the max y value if greater than the max x range
   y = (x < xvalues[1]) * yvalues[1] + (x ≥ xvalues[end]) * yvalues[end]

   # in case x is inside the range, y gets the interpolated value
   for i ∈ 1:length(yvalues)-1
      y += (x ≥ xvalues[i]) * (x < xvalues[i+1]) * interpolate(x, xvalues[i], xvalues[i+1], yvalues[i], yvalues[i+1])
   end

   return y
end

"""
   `withlookup(x, pairs::Vector{Tuple{Float64,Float64}})`

This function corresponds to the `WITH LOOKUP` function in the Vensim software.
"""
function withlookup(x, pairs::Vector{Tuple{Float64,Float64}})
   interpolate(x, map(t -> t[end], pairs), map(t -> t[1], pairs))
end

##############################################################################
# Functions supporting documentation and analysis of ODE systems and solutions
##############################################################################
function is_lhs_var(v, eq)
   l = replace(string(eq.lhs), "Differential(t)(" => "")
   l = replace(l, "))" => ")")
   return string(v) == l
end

function used_by_vars(v, sa)
   ubv = []
   for s = 1:lastindex(sa)
      vars = states(sa[s])
      eqs = equations(sa[s])
      eq_deps = equation_dependencies(sa[s])
      for i in 1:lastindex(eq_deps)
         if (issubset(string.([v]), string.(eq_deps[i])))
            l = replace(string(eqs[i].lhs), "Differential(t)(" => "")
            l = replace(l, "))" => ")")
            push!(ubv, l)
         end
      end
   end
   return ubv
end

function used_by_vars(p, eqs, eq_deps)
   ubv = []
   for i in 1:lastindex(eq_deps)
      if (issubset(string.([p]), string.(eq_deps[i])))
         l = replace(string(eqs[i].lhs), "Differential(t)(" => "")
         l = replace(l, "))" => ")")
         push!(ubv, l)
      end
   end
   return ubv
end

function clean_latex(s, dp)
   s = replace(s, "mathrm" => "mathtt")
   s = replace(s, "mathtt{d}" => "mathrm{d}")
   s = replace(s, "\\mathrm{d} \\cdot" => "\\mathrm{d}")
   s = replace(s, " " => "")
   s = replace(s, "\\cdote" => "\\cdot e")
   s = "\\(" * split(s, "\$")[2] * "\\)"
   for i in 1:lastindex(dp)
      s = replace(s, dp[i] => "\\mathtt{" * dp[i] * "}")
   end
   return s
end

function eqs_exceptions()
   return Dict{String,String}(
      "EEPUC" => "\\(\\mathtt{EEPUC}(t) = \\mathtt{interpolate}(\\mathtt{RESO}, (0.0, 0.25, 0.45, 0.63, 0.75, 0.85, 0.92, 0.96, 0.98, 0.99, 1.0), (0.0, 1000.0))\\)",
   )
end

function dep_exceptions()
   return Dict{String,Array{String}}(
   )
end

function used_by_exceptions()
   return Dict{String,String}(
   )
end

function write_html_head(f)
   write(f, "<head>\n")
   write(f, "  <script src=\"https://polyfill.io/v3/polyfill.min.js?features=es6\"></script>\n")
   write(f, "  <script id=\"MathJax-script\" async src=\"https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js\"></script>\n")
   write(f, "  <style>\n")
   write(f, "      table, th, td {\n")
   write(f, "          border: 1px solid black;\n")
   write(f, "          border-collapse: collapse;\n")
   write(f, "          padding: 10px;\n")
   write(f, "      }\n")
   write(f, "      tr:nth-child(even) {\n")
   write(f, "          background-color: #D6EEEE;\n")
   write(f, "      }\n")
   write(f, "      th {\n")
   write(f, "          background-color: #D6EEEE;\n")
   write(f, "      }\n")
   write(f, "  </style>\n")
   write(f, "</head>\n\n")
end

function var_dependencies(sa, sn, si)
   println(uppercase(sn[si]), " dependencies")
   sys_vars = states(sa[si])
   sys_eqs = equations(sa[si])
   sys_eq_v_deps = equation_dependencies(sa[si])
   sys_eq_p_deps = equation_dependencies(sa[si], variables=parameters(sa[si]))
   sys_vd_graph = variable_dependencies(sa[si])
   eq_exceps = eqs_exceptions()
   de_exceps = dep_exceptions()
   ub_exceps = used_by_exceptions()
   var_system_name::Dict{String,String} = Dict{String,String}()
   for var in sort(ModelingToolkit.get_states(sa[si]), by=x -> string(x))
      desc = ModelingToolkit.getdescription(var)
      if (desc != "" && !startswith(desc, "LV functions") && !startswith(desc, "RT functions"))
         dep_on_v = []
         for i in 1:lastindex(sys_eqs)
            if (is_lhs_var(var, sys_eqs[i]))
               if (get(de_exceps, string(var), "") == "")
                  dep_on_v = string.(sys_eq_v_deps[i])
               else
                  dep_on_v = de_exceps[string(var)]
               end
               break
            end
         end
         for i in 1:lastindex(dep_on_v)
            vs = var_system(dep_on_v[i], sa, sn)
            @assert (vs != "") "Variable " * dep_on_v[i] * " has no system"
            va = replace(dep_on_v[i], "(t)" => "")
            if (vs != sn[si])
               if (get(var_system_name, va, "") == "")
                  var_system_name[va] = uppercase(vs)
               end
            end
         end
      end
   end
   for k in keys(var_system_name)
      println(k, " from ", var_system_name[k])
   end
end

"""
   `write_html)index()`

Write the index HTML page with the links to the systems HTML pages.
"""
function write_html_index(sn)
   mkpath("output/html/")
   open("output/html/index.html", "w") do f
      write(f, "<html>\n")
      write(f, "</body>\n</html>")
      write(f, "<body>\n\n\t<h1 style=\"text-align:center\">The list of sectors</h1>\n")
      write(f, "\n<ul>\n")
      for s in 1:lastindex(sn)
         write(f, "    <li><a href=\"" * sn[s] * ".html\">" * uppercase(sn[s]) * "</a></li>\n")
      end
      write(f, "</ul>\n</body>\n</html>")
   end
end

"""
   `write_html()`

Write two HTML tables with all the variables and the parameters of all the ODE systems of the Earth4All model.
"""
function write_html()
   sa = systems()
   sn = sector_names()
   for s in 1:lastindex(sa)
      println(sn[s])
      write_html(sa, sn, s)
   end
   write_html_index(sn)
end

"""
   `write_html(sa, sn, si)`

Write two HTML tables with all the variables and the parameters of the `si`-th ODE system in `sa`.
"""
function write_html(sa, sn, si)
   mkpath("output/html/")
   open("output/html/" * sn[si] * ".html", "w") do f
      write(f, "<html>\n")
      write_html_head(f)
      write(f, "<body style=\"text-align:center\">\n\n\t<h1>The ", uppercase(sn[si]), " sector</h1>\n")
      write(f, "\t<h2 style=\"text-align:left\">The variables</h2>\n")
      write_html_vars(sa, sn, si, f)
      write(f, "\n\t<h2 style=\"text-align:left\">The parameters</h2>\n")
      write_html_pars(sa[si], f)
      write(f, "</body>\n</html>")
   end
end

"""
   `write_html_vars(sa, sn, si, f)`

Write a HTML table with the description, the name, the initial value (when specified), and the equation of all the (endogenous) variables of the `si`-th ODE system in `sa`. If the description is empty, the variable is not printed (usually it is an exogenous variable).
"""
function write_html_vars(sa, sn, si, f)
   sys_vars = states(sa[si])
   sys_eqs = equations(sa[si])
   sys_eq_v_deps = equation_dependencies(sa[si])
   sys_eq_p_deps = equation_dependencies(sa[si], variables=parameters(sa[si]))
   sys_vd_graph = variable_dependencies(sa[si])
   eq_exceps = eqs_exceptions()
   de_exceps = dep_exceptions()
   ub_exceps = used_by_exceptions()
   write(f, "<table border: 1px solid black;>\n\t<thead>\n\t\t<tr>\n\t\t\t<th>Description</th>\n\t\t\t<th>Name</th>\n\t\t\t<th>Used variables</th>\n\t\t\t<th>Used parameters</th>\n\t\t\t<th>Variables using it</th>\n\t\t\t<th>Initial value</th>\n\t\t\t<th>Equation</th>\n\t\t</tr>\n\t</thead>\n\t<tbody>\n")
   for var in sort(ModelingToolkit.get_states(sa[si]), by=x -> string(x))
      desc = ModelingToolkit.getdescription(var)
      if (desc != "" && !startswith(desc, "LV functions") && !startswith(desc, "RT functions"))
         ltx = "\\mathrm{NA}"
         dep_on_v = []
         dep_on_p = []
         for i in 1:lastindex(sys_eqs)
            if (is_lhs_var(var, sys_eqs[i]))
               if (get(de_exceps, string(var), "") == "")
                  dep_on_v = string.(sys_eq_v_deps[i])
               else
                  dep_on_v = de_exceps[string(var)]
               end
               dep_on_p = string.(sys_eq_p_deps[i])
               ltx = clean_latex(latexinline(sys_eqs[i]; cdot=true, fmt=x -> format(round(x, sigdigits=2))), dep_on_p)
               break
            end
         end
         used_by = used_by_vars(var, sa)
         if (get(ub_exceps, string(var), "") != "")
            push!(used_by, ub_exceps[string(var)])
         end
         acronym = replace(string(var), "(t)" => "")
         write(f, "\t<tr id=\"", acronym, "\">\n")
         if (get(eq_exceps, acronym, "") != "")
            ltx = eq_exceps[acronym]
         end
         write(f, "\t\t<td>", desc, "</td>\n")
         write(f, "\t\t<td><code>", acronym, "</code></td>\n")
         write(f, "\t\t<td>")
         for i in 1:lastindex(dep_on_v)
            vs = var_system(dep_on_v[i], sa, sn)
            @assert (vs != "") "Variable " * dep_on_v[i] * " has no system"
            va = replace(dep_on_v[i], "(t)" => "")
            if (vs == sn[si])
               write(f, "<a href=#", va, "><code>", va, "</code></a> ")
            else
               write(f, "<a href=\"", vs, ".html#", va, "\"><code>", va, "</code></a> ")
            end
         end
         write(f, "</td>\n")
         write(f, "\t\t<td>")
         for i in 1:lastindex(dep_on_p)
            write(f, "<a href=#", dep_on_p[i], "><code>", dep_on_p[i], "</code></a> ")
         end
         write(f, "</td>\n")
         write(f, "\t\t<td>")
         for i in 1:lastindex(used_by)
            if (!startswith(used_by[i], "(LV_") && !startswith(used_by[i], "(RT_"))
               vs = var_system(used_by[i], sa, sn)
               @assert (vs != "") "Variable " * used_by[i] * " is used by variable " * acronym * " but has no associated system"
               va = replace(used_by[i], "(t)" => "")
               if (vs == sn[si])
                  write(f, "<a href=#", va, "><code>", va, "</code></a> ")
               else
                  write(f, "<a href=\"", vs, ".html#", va, "\"><code>", va, "</code></a> ")
               end
            end
         end
         write(f, "</td>\n")
         try
            v = round(ModelingToolkit.getdefault(var), digits=4)
            write(f, "\t\t<td>", string(v), "</td>\n")
         catch err
            write(f, "\t\t<td></td>\n")
         end
         write(f, "\t\t<td>", ltx, "</td>\n")
         write(f, "\t</tr>\n")
      end
   end
   write(f, "\t</tbody>\n</table>\n")
end

"""
   `write_html_pars(sys, f)`

Write a HTML table with the description, the name, the value of all the parameters of the ODE system `sys`.
"""
function write_html_pars(sys, f)
   sys_vars = states(sys)
   sys_eqs = equations(sys)
   sys_eq_v_deps = equation_dependencies(sys)
   sys_eq_p_deps = equation_dependencies(sys, variables=parameters(sys))
   sys_vd_graph = variable_dependencies(sys)
   write(f, "<table class=\"styled-table\">\n\t<thead>\n\t\t<tr>\n\t\t\t<th>Description</th>\n\t\t\t<th>Name</th>\n\t\t\t<th>Is used by</th>\n\t\t\t<th>Value</th>\n\t\t</tr>\n\t</thead>\n\t<tbody>\n")
   for par in sort(ModelingToolkit.get_ps(sys), by=x -> string(x))
      desc = ModelingToolkit.getdescription(par)
      if (desc != "")
         used_by = used_by_vars(par, sys_eqs, sys_eq_p_deps)
         acronym = string(par)
         write(f, "\t<tr id=\"", acronym, "\">\n")
         write(f, "\t\t<td>", desc, "</td>\n")
         write(f, "\t\t<td><code>", acronym, "</code></td>\n")
         write(f, "\t\t<td>")
         for i in 1:lastindex(used_by)
            va = replace(used_by[i], "(t)" => "")
            write(f, "<a href=#", va, "><code>", va, "</code></a> ")
         end
         write(f, "</td>\n")
         try
            v = round(ModelingToolkit.getdefault(par), digits=4)
            write(f, "\t\t<td>", string(v), "</td>\n")
         catch err
            write(f, "\t\t<td></td>\n")
         end
         write(f, "\t</tr>\n")
      end
   end
   write(f, "\t</tbody>\n</table>\n")
end

function var_system(v, sa, sn)
   for s in 1:lastindex(sa)
      vars = states(sa[s])
      for i in 1:lastindex(vars)
         if (getdescription(vars[i]) != "" && string(vars[i]) == v)
            return sn[s]
         end
      end
   end
   return ""
end

"""
   `systems()`

Return the array of ODE systems corresponding to the sectors of the Earth4All model (that is, Climate, Demand, Energy, Finance, Food and land, Inventory, Labour market, Other, Output, Population, Public, and Wellbeing).
"""
function systems()
   r = []
   @named cap = Duggan.Capital.capital_system()
   @named res = Duggan.Resource.resource_system()
   append!(r, [cap, res])
   return r
end

"""
   `sector_names()`

Return the names of the sectors of the Earth4All model.
"""
function sector_names()
   return ["capital", "resource"]
end
