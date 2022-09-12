# Replicating historical runs

We first have to solve the ODE system, which is constructed in the `world3_historicalrun` function, included in the `world3_historicalrun.jl` code file. This ODE system is the one described in the book *Dynamics of Growth in a Finite World* (1974), and used in Chapter 7 of the book itself.

```
using WorldDynamics
include("examples/scenarios/world3_historicalrun.jl")
system = world3_historicalrun()
sol = WorldDynamics.solve(system, (1900, 2100))
```

We then have to define the variables that we want to plot. For example, Figure 7-2 of the above book shows the plot of eleven variables in the population sector of the model. These variables are defined as follows.

```
@named pop = WorldDynamics.World3.Pop4.population()
@named br = WorldDynamics.World3.Pop4.birth_rate()
@named dr = WorldDynamics.World3.Pop4.death_rate()
fig_7_2_variables = [
    (pop.pop, 0, 4e9, "pop"),
    (br.cbr, 0, 50, "cbr"),
    (dr.cdr, 0, 50, "cdr"),
    (dr.le, 0, 60, "le"),
    (dr.lmf, 0.75, 1.75, "lmf"),
    (dr.lmp, 0.75, 1.75, "lmp"),
    (dr.lmhs, 0.75, 1.75, "lmhs"),
    (dr.lmc, 0.75, 1.75, "lmc"),
    (br.tf, 0, 8, "tf"),
    (br.dtf, 0, 8, "dtf"),
]
@variables t
```
For each variable of the model, the above vector includes a quadruple, containing the Julia variable, its range, and its symbolic name to be shonw in the plot (the range and the symbolic name are optional). The time variable `t` has also to be declared. Finally, we can plot the evolution of the model variables according to the previously computed solution.

```
plotvariables(sol, (t, 1900, 1970), fig_7_2_variables, name="Fig. 7-2", showlegend=true, colored=true)
```

# Replicating the reference behaviour

To replicate the figures in Section 7.3 of the above book, we can operate in a similar way by declaring the varibales to be plot and by changing the time range. For example the following code reproduce the plot of Figure 7-7.

```
@named pop = WorldDynamics.World3.Pop4.population()
@named br = WorldDynamics.World3.Pop4.birth_rate()
@named dr = WorldDynamics.World3.Pop4.death_rate()
@named is = WorldDynamics.World3.Capital.industrial_subsector()
@named ld = WorldDynamics.World3.Agriculture.land_development()
@named nr = WorldDynamics.World3.NonRenewable.non_renewable()
@named pp = WorldDynamics.World3.Pollution.persistent_pollution()
reference_variables = [
    (nr.nrfr, 0, 1, "nrfr"),
    (is.iopc, 0, 1000, "iopc"),
    (ld.fpc, 0, 1000, "fpc"),
    (pop.pop, 0, 16e9, "pop"),
    (pp.ppolx, 0, 32, "ppolx"),
    (br.cbr, 0, 50, "cbr"),
    (dr.cdr, 0, 50, "cdr"),
]
@variables t
plotvariables(sol, (t, 1900, 2100), reference_variables, name="Fig. 7-7", showlegend=true, colored=true)
```

# Replicating the sensitivity tests

In this case, we have to mdoify the parameter or the interpolation table of the varaible with respect to which we want to perform the sensistivity test, we have to solve agian the ODE system, and we can finally plot the resulting evolution of the system.

## Modifying a parameter

In order to reproduce Figure 7-10, in which the nonrenewable resources initial value (that is, the value of the `NRI` parameter) is doubled, we can modify the value of this parameter by getting the parameter set of the nonrenewable resources sector, and by changing the value of `NRI`.

```
nonrenewable_parameters_7_10 = WorldDynamics.World3.NonRenewable.getparameters()
nonrenewable_parameters_7_10[:nri] = 2.0 * nonrenewable_parameters_7_10[:nri]
```

We then have to solve again the ODE system, by specifying which set of paramer values has to be used for the nonrenewable resources sector.

```
system = world3_historicalrun(nonrenewable_params=nonrenewable_parameters_7_10)
sol = WorldDynamics.solve(system, (1900, 2100))
```

Finally, we can plot the seven variables of Figure 7-10.

```
plotvariables(sol, (t, 1900, 2100), reference_variables, name="Fig. 7-10", showlegend=true, colored=true)
```

## Modifying an interpolation table

In order to reproduce Figure 7-13, in which the slope of the fraction of industrial output allocated to agriculture is increased, we can modify the two tables `FIOAA1` and `FIOAA2` by getting the table set of the agriculture sector, and by changing the value of these two tables.

```
agriculture_tables_7_13 = WorldDynamics.World3.Agriculture.gettables()
agriculture_tables_7_13[:fioaa1] = (0.5, 0.3, 0.1, 0.0, 0.0, 0.0)
agriculture_tables_7_13[:fioaa2] = (0.5, 0.3, 0.1, 0.0, 0.0, 0.0)
```

We then have to solve again the ODE system, by specifying which set of tables has to be used for the agriculture sector.

```
system = world3_historicalrun(agriculture_tables=agriculture_tables_7_13)
sol = WorldDynamics.solve(system, (1900, 2100))
```

Finally, we can plot the seven variables of Figure 7-10.

```
plotvariables(sol, (t, 1900, 2100), reference_variables, name="Fig. 7-13", showlegend=true, colored=true)
```


### License

WorldDynamics.jl is released under the terms of MIT License.
