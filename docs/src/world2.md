# [World 2 equations, variables, and parameters](@id eqs_vars_pars_2)

In this page we list the equations, the variables and the parameters of the World2 model as described in Chapter 3 and Appendix B of the book *World dynamics* (1973). Even if it is not said explicitily in the book, the World2 model consists of six systems containing several subsystems.

## Equations

| System | # | Definition 	| Reference	| Notes |
| --- 	| --- 	| ---	| ---	| --- 	|
| Population | 1  	| $\frac{d\mathtt{p}}{dt} = \mathtt{br} - \mathtt{dr}$ | page 33 | see initialisation of $\mathtt{p}$ |
| Population | 2  	| $\mathtt{br} = \mathtt{p}\times\mathit{clip}(\mathtt{brn}, \mathtt{brn1},\mathit{t},\mathtt{swt1})\times\mathtt{brfm}\times\mathtt{brmm}\times\mathtt{brcm}\times\mathtt{brpm}$ | page 34 | see values of $\mathtt{brn}$, $\mathtt{brn1}$, and $\mathtt{swt1}$ |
| Population | 3 | $\mathtt{brmm}=\mathit{interpolate}\left(\mathtt{msl}\right)$ | page 35 | see table $\mathtt{brmm}$ |
| Capital investment		 | 4 | $\mathtt{msl}=\frac{\mathtt{ecir}}{\mathtt{ecirn}}$ | page 36 | see value of $\mathtt{ecirn}$ |
| Capital investment | 5 | $\mathtt{ecir}=\frac{\mathtt{cir}\times(1-\mathtt{ciaf})\times\mathtt{nrem}}{1-\mathtt{ciafn}}$ | page 37 | see value of $\mathtt{ciafn}$ |
| Natural resources | 6 | $\mathtt{nrem}=\mathit{interpolate}\left(\mathtt{nrfr}\right)$ | page 38 | see table $\mathtt{nrem}$ |
| Natural resources | 7 | $\mathtt{nrfr}=\frac{\mathtt{nr}}{\mathtt{nri}}$ | page 38 | see initialisation of $\mathtt{nr}$ |
| Natural resources | 8 | $\frac{d\mathtt{nr}}{dt} = - \mathtt{nrur}$ | page 39 | see initialisation of $\mathtt{nr}$ |
| Natural resources | 9 | $\mathtt{nrur} = \mathtt{p}\times\mathit{clip}(\mathtt{nrun}, \mathtt{nrun1},\mathit{t},\mathtt{swt2})\times\mathtt{nrmm}$ | page 39 | see values of $\mathtt{nrun}$, $\mathtt{nrun1}$, and $\mathtt{swt2}$ |
| Population | 10  	| $\mathtt{dr} = \mathtt{p}\times\mathit{clip}(\mathtt{drn}, \mathtt{drn1},\mathit{t},\mathtt{swt3})\times\mathtt{drfm}\times\mathtt{drmm}\times\mathtt{drcm}\times\mathtt{drpm}$ | page 40 | see values of $\mathtt{drn}$, $\mathtt{drn1}$, and $\mathtt{swt3}$ |
| Population | 11 | $\mathtt{drmm}=\mathit{interpolate}\left(\mathtt{msl}\right)$ | page 41 | see table $\mathtt{drmm}$ |
| Population | 12 | $\mathtt{drpm}=\mathit{interpolate}\left(\mathtt{polr}\right)$ | page 42 | see table $\mathtt{drpm}$ |
| Population | 13 | $\mathtt{drfm}=\mathit{interpolate}\left(\mathtt{fr}\right)$ | page 43 | see table $\mathtt{drfm}$ |
| Population | 14 | $\mathtt{drcm}=\mathit{interpolate}\left(\mathtt{cr}\right)$ | page 44 | see table $\mathtt{drcm}$ |
| Population | 15 | $\mathtt{cr}=\frac{\mathtt{p}}{\mathtt{la}\times\mathtt{pdn}}$ | page 44 | see values of $\mathtt{la}$ and $\mathtt{pdn}$ |
| Population | 16 | $\mathtt{brcm}=\mathit{interpolate}\left(\mathtt{cr}\right)$ | page 45 | see table $\mathtt{brcm}$ |
| Population | 17 | $\mathtt{brfm}=\mathit{interpolate}\left(\mathtt{fr}\right)$ | page 46 | see table $\mathtt{brfm}$ |
| Population | 18 | $\mathtt{brpm}=\mathit{interpolate}\left(\mathtt{polr}\right)$ | page 47 | see table $\mathtt{brpm}$ |
| Agricultural investment | 19  	| $\mathtt{fr} = \frac{\mathtt{fpci}\times\mathtt{fcm}\times\mathtt{fpm}\times\mathit{clip}(\mathtt{fc}, \mathtt{fc1},\mathit{t},\mathtt{swt7})}{\mathtt{fn}}$ | page 47 | see values of $\mathtt{fc}$, $\mathtt{fc1}$, $\mathtt{fn}$, and $\mathtt{swt7}$ |
| Agricultural investment | 20 | $\mathtt{fcm}=\mathit{interpolate}\left(\mathtt{cr}\right)$ | page 48 | see table $\mathtt{fcm}$ |
| Agricultural investment | 21 | $\mathtt{fpci}=\mathit{interpolate}\left(\mathtt{cira}\right)$ | page 49 | see table $\mathtt{fpci}$ |
| Capital investment | 22 | $\mathtt{cira}=\frac{\mathtt{cir}\times\mathtt{ciaf}}{\mathtt{ciafn}}$ | page 50 | see value of $\mathtt{ciafn}$ |
| Capital investment | 23 | $\mathtt{cir}=\frac{\mathtt{ci}}{\mathtt{p}}$ | page 50 |  |
| Capital investment | 24 | $\frac{d\mathtt{ci}}{dt} = \mathtt{cig}-\mathtt{cid}$ | page 50 | see initialisation of $\mathtt{ci}$ |
| Capital investment | 25 | $\mathtt{cig} = \mathtt{p}\times\mathtt{brfm}\times\mathit{clip}(\mathtt{cign}, \mathtt{cign1},\mathit{t},\mathtt{swt4})$ | page 51 | see values of $\mathtt{cign}$, $\mathtt{cign1}$, and $\mathtt{swt4}$ |
| Capital investment | 26 | $\mathtt{cim}=\mathit{interpolate}\left(\mathtt{msl}\right)$ | page 52 | see table $\mathtt{cim}$ |
| Capital investment | 27 | $\mathtt{cid} = \mathtt{ci}\times\mathit{clip}(\mathtt{cidn}, \mathtt{cidn1},\mathit{t},\mathtt{swt5})$ | page 53 | see values of $\mathtt{cidn}$, $\mathtt{cidn1}$, and $\mathtt{swt5}$ |
| Agriculture investment | 28 | $\mathtt{fpm}=\mathit{interpolate}\left(\mathtt{polr}\right)$ | page 54 | see table $\mathtt{fpm}$ |
| Pollution | 29 | $\mathtt{polr} = \frac{\mathtt{pol}}{\mathtt{pols}}$ | page 54 | see value of $\mathtt{pols}$ |
| Pollution | 30 | $\frac{d\mathtt{pol}}{dt} = \mathtt{polg}-\mathtt{pola}$ | page 54 | see initialisation of $\mathtt{pol}$ |
| Pollution | 31 | $\mathtt{polg} = \mathtt{p}\times\mathit{clip}(\mathtt{poln}, \mathtt{poln1},\mathit{t},\mathtt{swt6})\times\mathtt{polcm}$ | page 55 | see values of $\mathtt{poln}$, $\mathtt{poln1}$, and $\mathtt{swt6}$ |
| Pollution | 32 | $\mathtt{polcm}=\mathit{interpolate}\left(\mathtt{cir}\right)$ | page 56 | see table $\mathtt{polcm}$ |
| Pollution | 33 | $\mathtt{pola}=\frac{\mathtt{pol}}{\mathtt{polat}}$ | page 57 | see table $\mathtt{polcm}$ |
| Pollution | 34 | $\mathtt{polat}=\mathit{interpolate}\left(\mathtt{polr}\right)$ | page 58 | see table $\mathtt{polat}$ |
| Agriculture investment | 35 | $\frac{d\mathtt{ciaf}}{dt} = \frac{\mathtt{cfifr}\times\mathtt{ciqr}-\mathtt{ciaf}}{\mathtt{ciaft}}$ | page 59 | see initialisation of $\mathtt{ciaf}$ and value of $\mathtt{ciaft}$ |
| Agriculture investment | 36 | $\mathtt{cfifr}=\mathit{interpolate}\left(\mathtt{fr}\right)$ | page 60 | see table $\mathtt{cfifr}$ |
| Quality life | 37 | $\mathtt{ql} = \mathtt{qls}\times\mathtt{qlm}\times\mathtt{qlc}\times\mathtt{qlf}\times\mathtt{qlp}$ | page 60 | see value of $\mathtt{qls}$ |
| Quality life | 38 | $\mathtt{qlm}=\mathit{interpolate}\left(\mathtt{msl}\right)$ | page 61 | see table $\mathtt{qlm}$ |
| Quality life | 39 | $\mathtt{qlc}=\mathit{interpolate}\left(\mathtt{cr}\right)$ | page 62 | see table $\mathtt{qlc}$ |
| Quality life | 40 | $\mathtt{qlf}=\mathit{interpolate}\left(\mathtt{fr}\right)$ | page 63 | see table $\mathtt{qlf}$ |
| Quality life | 41 | $\mathtt{qlp}=\mathit{interpolate}\left(\mathtt{polr}\right)$ | page 64 | see table $\mathtt{qlp}$ |
| Natural resources | 42 | $\mathtt{nrmm}=\mathit{interpolate}\left(\mathtt{msl}\right)$ | page 64 | see table $\mathtt{nrmm}$ |
| Agriculture investment | 43 | $\mathtt{ciqr}=\mathit{interpolate}\left(\frac{\mathtt{qlm}}{\mathtt{qlf}}\right)$ | page 65 | see table $\mathtt{ciqr}$ |

## Variable and (ODE) subsystem correspondance

| Description   | Name | Main subsystem | Other subsystems |
| --- | -------- | --------------- | ----------------- |
| Population | `p` | `population` | `birth_rate`, `capital_investment`, `capital_investment_generation`, `death_rate`, `natural_resources_usage_rate`, `pollution_generation` |
| Birth rate | `br` | `birth_rate` | `population` |
| Birth rate from crowding multiplier | `brcm` | `birth_rate` |  |
| Birth rate from food multiplier | `brfm` | `birth_rate` |  |
| Birth rate from material multiplier | `brmm` | `birth_rate` |  |
| Birth rate from pollution multiplier | `brpm` | `birth_rate` |  |
| Capital investment | `ci` | `capital_investment` | `capital_investment_discard` |
| Capital fraction indicated by food ratio | `cfifr` | `agriculture_investment` | |
| Capital investment in agriculture fraction | `ciaf` | `agriculture_investment` | `capital_investment` |
| Capital investment discard | `cid` | `capital_investment_discard` | `capital_investment` |
| Capital investment generation | `cig` | `capital_investment_generation` | `capital_investment` |
| Capital investment multiplier | `cim` | `capital_investment_generation` | |
| Capital investment from quality ratio | `ciqr` | `agriculture_investment` | |
| Capital investment ratio | `cir` | `capital_investment` | `pollution_generation` |
| Capital investment ratio in agriculture | `cira` | `capital_investment` | `agriculture_investment` |
| Crowding ratio | `cr` | `population` | `agriculture_investment`, `birth_rate`, `death_rate`, `quality_life` |
| Death rate | `dr` | `death_rate` | `population` |
| Death rate from crowding multiplier | `drcm` | `death_rate` |  |
| Death rate from food multiplier | `drfm` | `death_rate` |  |
| Death rate from material multiplier | `drmm` | `death_rate` |  |
| Death rate from pollution multiplier | `drpm` | `death_rate` |  |
| Effective capital investment ratio | `ecir` | `capital_investment` |  |
| Food from crowding multiplier | `fcm` | `agriculture_investment` |  |
| Food potential from capital investment | `fpci` | `agriculture_investment` |  |
| Food from pollution multiplier | `fpm` | `agriculture_investment` |  |
| Food ratio | `fr` | `agriculture_investment` | `birth_rate`, `death_rate`, `quality_life` |
| Material standard of living | `msl` | `capital_investment` | `birth_rate`, `capital_investment_generation`, `death_rate`, `natural_resources_usage_rate`, `quality_life` |
| Natural resources | `nr` | `natural_resources` |  |
| Natural resource extraction multiplier | `nrem` | `natural_resources` | `capital_investment` |
| Natural resource fraction remaining | `nrfr` | `natural_resources` | |
| Natural resources from material multiplier | `nrmm` | `natural_resources_usage_rate` | |
| Natural resource usage rate | `nrur` | `natural_resources_usage_rate` | `natural_resources` |
| Pollution | `pol` | `pollution` | `pollution_absorption` |
| Pollution absorption | `pola` | `pollution_absorption` | `pollution` |
| Pollution absorption time | `polat` | `pollution_absorption` | |
| Pollution from capital multiplier | `polcm` | `pollution_generation` | |
| Pollution generation | `polg` | `pollution_generation` | `pollution` |
| Pollution ratio | `polr` | `pollution` | `agriculture_investment`, `birth_rate`, `death_rate`, `pollution_absorption`, `quality_life` |
| Quality of life | `ql` | `quality_life` | |
| Quality of life from crowding | `qlc` | `quality_life` | |
| Quality of life from food | `qlf` | `quality_life` | `agriculture_investment` |
| Quality of life from material | `qlm` | `quality_life` | `agriculture_investment` |
| Quality of life from pollution | `qlp` | `quality_life` | |

## Variable initializations

| Description 	| Initialization 	| Reference |
| ---	| --- 	| --- |
| Capital investment	| $\mathtt{ci}(0)=0.4e9$ | page 50 |
| Agriculture investment	| $\mathtt{ciaf}(0)=0.2$ | page 59 |
| Natural resources	| $\mathtt{nr}(0)=900e9$ | page 39 |
| Population	| $\mathtt{p}(0)=1.65e9$ | page |
| Pollution	| $\mathtt{pol}(0)=0.2e9$ | page 54 |

## Parameters

| Description | Name 	| Value | System |
| --- | ------	| -------	| ------ |
| Birth rate normal | $\mathtt{brn}$ | $0.04$ | `Population` |
| Birth rate normal no. 1 | $\mathtt{brn1}$ | $0.04$ | `Population` |
| Capital investment in agriculture fraction normal | $\mathtt{ciafn}$ | $0.3$ | `Capital investment` |
| Capital investment in agriculture fraction adjustment time | $\mathtt{ciaft}$ | $15$ | `Agriculture investment` |
| Capital investment discard normal | $\mathtt{cidn}$ | $0.025$ | `Capital investment` |
| Capital investment discard normal no. 1 | $\mathtt{cidn1}$ | $0.025$ | `Capital investment` |
| Capital investment generation normal | $\mathtt{cign}$ | $0.05$ | `Capital investment` |
| Capital investment generation normal no. 1 | $\mathtt{cign1}$ | $0.05$ | `Capital investment` |
| Death rate normal | $\mathtt{drn}$ | $0.028$ | `Population` |
| Death rate normal no. 1 | $\mathtt{drn1}$ | $0.028$ | `Population` |
| Effective capital investment ratio normal | $\mathtt{ecirn}$ | $1$ | `Capital investment` |
| Food coefficient | $\mathtt{fc}$ | $1$ | `Agriculture investment` |
| Food coefficient no. 1 | $\mathtt{fc1}$ | $1$ | `Agriculture investment` |
| Food normal | $\mathtt{fn}$ | $1$ | `Agriculture investment` |
| Land area | $\mathtt{la}$ | $135e6$ | `Population` |
| Natural resource usage normal | $\mathtt{nrun}$ | $1$ | `Natural resources` |
| Natural resource usage normal no. 1 | $\mathtt{nrun1}$ | $1$ | `Natural resources` |
| Population density normal | $\mathtt{pdn}$ | $26.5$ | `Population` |
| Pollution normal | $\mathtt{poln}$ | $1$ | `Pollution` |
| Pollution normal no. 1 | $\mathtt{poln1}$ | $1$ | `Pollution` |
| Pollution standard | $\mathtt{pols}$ | $3.6e9$ | `Pollution` |
| Quality of life standard | $\mathtt{qls}$ | $1$ | `Quality life` |
| Switch time no. 1 for `brn` | $\mathtt{swt1}$ | $1970$ | `Population` |
| Switch time no. 2 for `nrun` | $\mathtt{swt2}$ | $1970$ | `Natural resources` |
| Switch time no. 3 for `nrun` | $\mathtt{swt3}$ | $1970$ | `Population` |
| Switch time no. 4 for `cign` | $\mathtt{swt4}$ | $1970$ | `Capital investment` |
| Switch time no. 5 for `cidn` | $\mathtt{swt5}$ | $1970$ | `Capital investment` |
| Switch time no. 6 for `poln` | $\mathtt{swt6}$ | $1970$ | `Pollution` |
| Switch time no. 7 for `fc` | $\mathtt{swt7}$ | $1970$ | `Population` |

## Tables and ranges

| Variable name | Table | Range | System |
| ---	| --- 	| ------ | ------ |
| $\mathtt{brcm}$ | $(1.05, 1.0, 0.9, 0.7, 0.6, 0.55)$ | $(0, 5)$ | `Population` |
| $\mathtt{brfm}$ | $(0.0, 1.0, 1.6, 1.9, 2.0)$ | $(0, 4)$ | `Population` |
| $\mathtt{brmm}$ | $(1.2, 1.0, 0.85, 0.75, 0.7, 0.7)$ | $(0, 5)$ | `Population` |
| $\mathtt{brpm}$ | $(1.02, 0.9, 0.7, 0.4, 0.25, 0.15, 0.1)$ | $(0, 60)$ | `Population` |
| $\mathtt{cfifr}$ | $(1.0, 0.6, 0.3, 0.15, 0.1)$ | $(0, 2)$ | `Agriculture investment` |
| $\mathtt{cim}$ | $(0.1, 1.0, 1.8, 2.4, 2.8, 3.0)$ | $(0, 5)$ | `Capital investment` |
| $\mathtt{ciqr}$ | $(0.7, 0.8, 1.0, 1.5, 2.0)$ | $(0, 2)$ | `Agriculture investment` |
| $\mathtt{drcm}$ | $(0.9, 1.0, 1.2, 1.5, 1.9, 3.0)$ | $(0, 5)$ | `Population` |
| $\mathtt{drfm}$ | $(30.0, 3.0, 2.0, 1.4, 1.0, 0.7, 0.6, 0.5, 0.5)$ | $(0, 2)$ | `Population` |
| $\mathtt{drmm}$ | $(3.0, 1.8, 1.0, 0.8, 0.7, 0.6, 0.53, 0.5, 0.5, 0.5, 0.5)$ | $(0, 5)$ | `Population` |
| $\mathtt{drpm}$ | $(0.92, 1.3, 2.0, 3.2, 4.8, 6.8, 9.2)$ | $(0, 60)$ | `Population` |
| $\mathtt{fcm}$ | $(2.4, 1.0, 0.6, 0.4, 0.3, 0.2)$ | $(0, 5)$ | `Agricultural investment` |
| $\mathtt{fpci}$ | $(0.5, 1.0, 1.4, 1.7, 1.9, 2.05, 2.2)$ | $(0, 6)$ | `Agricultural investment` |
| $\mathtt{fpm}$ | $(1.02, 0.9, 0.65, 0.35, 0.2, 0.1, 0.05)$ | $(0, 60)$ | `Agricultural investment` |
| $\mathtt{nrem}$ | $(0.0, 0.15, 0.5, 0.85, 1.0)$ | $(0, 1)$ | `Natural resources` |
| $\mathtt{nrmm}$ | $(0.0, 1.0, 1.8, 2.4, 2.9, 3.3, 3.6, 3.8, 3.9, 3.95, 4.0)$ | $(0, 10)$ | `Natural resources` |
| $\mathtt{polat}$ | $(0.6, 2.5, 5.0, 8.0, 11.5, 15.5, 20.0)$ | $(0, 60)$ | `Pollution` |
| $\mathtt{polcm}$ | $(0.05, 1.0, 3.0, 5.4, 7.4, 8.0)$ | $(0, 5)$ | `Pollution` |
| $\mathtt{qlc}$ | $(2.0, 1.3, 1.0, 0.75, 0.55, 0.45, 0.38, 0.3, 0.25, 0.22, 0.2)$ | $(0, 5)$ | `Quality life` |
| $\mathtt{qlf}$ | $(0.0, 1.0, 1.8, 2.4, 2.7)$ | $(0, 4)$ | `Quality life` |
| $\mathtt{qlm}$ | $(0.2, 1.0, 1.7, 2.3, 2.7, 2.9)$ | $(0, 5)$ | `Quality life` |
| $\mathtt{qlp}$ | $(1.04, 0.85, 0.6, 0.3, 0.15, 0.05, 0.02)$ | $(0, 60)$ | `Quality life` |
