# [World 3 equations, variables, and parameters](@id eqs_vars_pars) 

In this page we list the equations, the variables and the parameters of the World3 model as described in Appendices A and B of the book *Dynamics of growth in a finite world* (1974) (our code also implement the model corresponding to each system of the entire World3 model as described in Chapter 2, 3, 4, 5, and 6 of the book, but we do not list here the equations, the variables and the parameters of each such model).

## Equations

| Name 	| Definition 	| Reference	| Notes |
| --- 	| ---	| ---	| --- 	|
| Population  	| $\frac{d\mathtt{pop}}{dt}=\mathtt{b}-\mathtt{d}$ | lines 1-3, page 167 |
| Deaths per year	| $\mathtt{d}=\frac{\mathtt{pop}}{\mathtt{le}}$ | line 4, page 167 | $\mathtt{dr}$ in our code |
| Crude death rate  | $\mathtt{cdr}=1000\times\frac{\mathtt{d}}{\mathtt{pop}}$ | line 5, page 167 |
| Life expectancy  | $\mathtt{le}=\mathtt{len}\times\mathtt{lmf}\times\mathtt{lmhs}\times\mathtt{lmp}\times\mathtt{lmc}$ | lines 6-7, page 167 |
|5  | $\mathtt{lmf}=\mathit{interpolate}\left(\frac{\mathtt{fpc}}{\mathtt{sfpc}}\right)$ | lines 8-10, page 167 |
|6  | $\mathtt{hsapc}=\mathit{interpolate}\left(\mathtt{sopc}\right)$ | lines 11-12, page 167 |
|7  | $\frac{d\mathtt{ehspc}}{dt}=\frac{\mathtt{hsapc}-\mathtt{ehspc}}{\mathtt{hsid}}$ | lines 13-14, page 167 |
|8  | $ \mathtt{lmhs}=clip(\mathtt{lmhs2},\mathtt{lmhs1},t,\mathtt{iphst}) $ | lines 15-16, page 167 |
|9  | $\mathtt{lmhs1}=\mathit{interpolate}(\mathtt{ehspc})$ | lines 17-18, page 167 |
|10  | $\mathtt{lmhs2}=\mathit{interpolate}(\mathtt{ehspc})$ | lines 19-20, page 167 |
|11  | $\mathtt{fpu}=\mathit{interpolate}(\mathtt{pop})$ | lines 21-22, page 167 |
|12  | $\mathtt{cmi}=\mathit{interpolate}(\mathtt{iopc})$ | lines 23-24, page 167 |
|13  | $\mathtt{lmc}=1-\mathtt{cmi}\times\mathtt{fpu}$ | line 25, page 167 |
|14  | $\mathtt{lmp}=\mathit{interpolate}(\mathtt{ppolx})$ | lines 26-27, page 167 |
| Births per year  | $ \mathtt{b}=clip(\mathtt{d},\mathtt{tf}\times\mathtt{pop}\times\mathtt{ffw}/\mathtt{rlt},t,\mathtt{pet}) $ | lines 28-31, page 168 | $\mathtt{br}$ in our code |
|16  | $\mathtt{cbr}=1000\times\frac{\mathtt{b}}{\mathtt{pop}}$ | line 32, page 168 |
|17  | $\mathtt{lmp}=\mathit{min}(\mathtt{mtf}, \mathtt{mtf}\times(1-\mathtt{fce})+\mathtt{dtf}\times\mathtt{fce})$ | line 33, page 168 |
|18  | $\mathtt{mtf}=\mathtt{mtfn}\times\mathtt{fm}$ | lines 34-35, page 168 |
|19  | $\mathtt{fm}=\mathit{interpolate}(\mathtt{le})$ | lines 36-37, page 168 |
|20  | $\mathtt{dtf}=\mathtt{dcfs}\times\mathtt{cmple}$ | lines 38, page 168 |
|21  | $\mathtt{cmple}=\mathit{interpolate}(\mathtt{ple})$ | lines 39-40, page 168 |
|22.1  | $\frac{d\mathtt{ple}}{dt}=3\times\frac{\mathtt{ple2}-\mathtt{ple}}{\mathtt{lpd}}$ | lines 41-42, page 168 |
| 2nd lev. delay eq. for $\mathtt{ple}$   | $\frac{d\mathtt{ple1}}{dt}=3\times\frac{\mathtt{le}-\mathtt{ple1}}{\mathtt{lpd}}$ | lines 41-42, page 168 |
| 2nd lev. delay eq. for $\mathtt{ple}$  | $\frac{d\mathtt{ple2}}{dt}=3\times\frac{\mathtt{ple1}-\mathtt{ple2}}{\mathtt{lpd}}$ | lines 41-42, page 168 |
|23  | $ \mathtt{dcfs}=clip(2,\mathtt{dcfsn}\times\mathtt{frsn}\times\mathtt{sfsn},t,\mathtt{zpgt}) $ | lines 43-45, page 168 |
|24  | $\mathtt{sfsn}=\mathit{interpolate}(\mathtt{diopc})$ | lines 46-47, page 168 |
|25.1  | $\frac{d\mathtt{diopc}}{dt}=3\times\frac{\mathtt{diopc2}-\mathtt{diopc}}{\mathtt{sad}}$ | lines 48-49, page 168 |
|25.2  | $\frac{d\mathtt{diopc2}}{dt}=3\times\frac{\mathtt{diopc1}-\mathtt{diopc2}}{\mathtt{sad}}$ | lines 48-49, page 168 |
|25.3  | $\frac{d\mathtt{diopc1}}{dt}=3\times\frac{\mathtt{iopc}-\mathtt{diopc1}}{\mathtt{sad}}$ | lines 48-49, page 168 |
|26  | $\mathtt{frsn}=\mathit{interpolate}(\mathtt{fie})$ | lines 50-52, page 168 |
|27  | $\mathtt{fie}=(\mathtt{iopc}-\mathtt{aiopc})/\mathtt{aiopc}$ | line 53, page 168 |
|28  | $\frac{d\mathtt{aiopc}}{dt}=\frac{\mathtt{iopc}-\mathtt{aiopc}}{\mathtt{ieat}}$ | lines 54-55, page 168 |
|29  | $\mathtt{nfc}=\frac{\mathtt{mtf}}{\mathtt{dtf}}-1$ | line 56, page 168 |
|30  | $ \mathtt{fce}=clip(1,\mathit{interpolate}(\mathtt{fcfpc}),t,\mathtt{fcest}) $ | lines 57-59, page 168 |
|31.1  | $\frac{d\mathtt{fcfpc}}{dt}=3\times\frac{\mathtt{fcfpc2}-\mathtt{fcfpc}}{\mathtt{hsid}}$ | line 60, page 168 |
|31.2  | $\frac{d\mathtt{fcfpc2}}{dt}=3\times\frac{\mathtt{fcfpc1}-\mathtt{fcfpc2}}{\mathtt{hsid}}$ | line 60, page 168 |
|31.3  | $\frac{d\mathtt{fcfpc1}}{dt}=3\times\frac{\mathtt{fcapc}-\mathtt{fcfpc1}}{\mathtt{hsid}}$ | line 60, page 168 |
|32  | $\mathtt{fcapc}=\mathtt{fsafc}\times\mathtt{sopc}$ | line 61, page 168 |
|33  | $\mathtt{fsafc}=\mathit{interpolate}(\mathtt{nfc})$ | lines 62-63, page 168 |
|34 | $\mathtt{iopc}=0.7e11\times e^{\mathtt{lt}\times0.037}/\mathtt{pop}$ | lines 64-72, page 168 |
|35 | $\mathtt{ppolx}=1.0$ | lines 73-75, page 168 |
|36 | $\mathtt{sopc}=1.5e11\times e^{\mathtt{lt}\times0.030}/\mathtt{pop}$ | lines 76-82, page 168 |
|37 | $\mathtt{fpc}=4e11\times e^{\mathtt{lt}\times0.020}/\mathtt{pop}$ | lines 83-89, page 168 |

## Initializations

| Name 	| Initialization 	|
| ---	| --- 	|
| Agricultural inputs | $\mathtt{ai}(0) = 5e9$  |
| Arable land | $\mathtt{al}(0) = 9e8$  |
| Average industrial output per capita | $\mathtt{aiopc}(0) = \mathtt{iopc}(0)$  |
| Capital utilization fraction | $\mathtt{cuf}(0) = 1$  |
| Delayed industrial output per capita	| $\mathtt{diopc}(0) = \mathtt{iopc}(0)$  |
|	| $\mathtt{diopc2}(0) = \mathtt{iopc}(0)$  |
|	| $\mathtt{diopc1}(0) = \mathtt{iopc}(0)$  |
| Effective health services per capita	| $\mathtt{ehspc}(0)=\mathtt{hsapc}(0)$ |
| Family response to social norm | $\mathtt{frsn}(0)=0.82$  |
| Fertility control facilities per capita | $\mathtt{fcfpc}(0) = \mathtt{fcapc}(0)$  |
|	| $\mathtt{fcfpc2}(0) = \mathtt{fcapc}(0)$  |
|	| $\mathtt{fcfpc1}(0) = \mathtt{fcapc}(0)$  |
| Industrial capital	| $\mathtt{ic}(0)=2.1e11$ |
| Labor utilization fraction delay	| $\mathtt{lufd}(0)=1.0$ |
| Land fertility	| $\mathtt{lfert}(0)=600$ |
| Fraction of the population age 0-14	| $\mathtt{p1}(0)=65e7$ |
| Fraction of the population age 15-44	| $\mathtt{p2}(0)=70e7$ |
| Fraction of the population age 45-64	| $\mathtt{p3}(0)=19e7$ |
| Fraction of the population age 65+	| $\mathtt{p4}(0)=6e7$ |
| Perceived food ratio	| $\mathtt{pfr}(0)=1$ |
| Population	| $\mathtt{pop}(0)=1.61e9$ |
| Potentially arable land | $\mathtt{pal}(0) = 2.3e9$  |
| Perceived life expectancy	| $\mathtt{ple}(0) = \mathtt{le}(0)$  |
|	| $\mathtt{ple1}(0) = \mathtt{le}(0)$  |
|	| $\mathtt{ple2}(0) = \mathtt{le}(0)$  |
| Persistent pollution	| $\mathtt{ppol}(0) = 2.5e7$  |
| Index of persistent pollution	| $\mathtt{ppolx}(0) = 1.0$  |
| Service capital	| $\mathtt{sc}(0) = 1.44e11$  |
| Urban-industrial land | $\mathtt{uil}(0) = 8.2e6$  |


## Variable and (ODE) subsystem correspondance

| #   | Variable | Main subsystem | Other subsystems |
| --- | -------- | --------------- | ----------------- |
|1| `pop` | `population` | `land_development`, `land_erosion_urban_industrial_use`, `industrial_subsector`, `service_subsector`, `non_renewable`, `persistent_pollution`, `birth_rate`, `death_rate` |
|2| `p1` | ` population` | |
|3| `p2` | ` population` | `job_subsector` |
|4| `p3` | ` population` | `job_subsector` |
|5| `p4` | ` population` | |
|6| `d1` | ` population` | |
|7| `d2` | ` population` | |
|8| `d3` | ` population` | |
|9| `d4` | ` population` | |
|10| `m1` | ` population` | |
|11| `m2` | ` population` | |
|12| `m3` | ` population` | |
|13| `m4` | ` population` | |
|14| `mat1` | ` population` | |
|15| `mat2` | ` population` | |
|16| `mat3` | ` population` | |
|17| `dr` | `death_rate` | ` population` |
|18| `cdr` | `death_rate` |  |
|19| `le` | `death_rate` | `birth_rate`,` population` |
|20| `lmf` | `death_rate` |  |
|21| `hsapc` | `death_rate` |  |
|22| `ehspc` | `death_rate` |  |
|23| `lmhs` | `death_rate` |  |
|24| `lmhs1` | `death_rate` |  |
|25| `lmhs2` | `death_rate` |  |
|26| `fpu` | `death_rate` |  |
|27| `cmi` | `death_rate` |  |
|28| `lmc` | `death_rate` |  |
|29| `lmp` | `death_rate` |  |
|30| `br` | `birth_rate` | ` population` |
|31| `cbr` | `birth_rate ` |  |
|32| `tf` | `birth_rate` | ` population` |
|33| `mtf` | `birth_rate` |  |
|34| `fm` | `birth_rate` |  |
|35| `dtf` | `birth_rate` |  |
|36| `cmple` | `birth_rate` |  |
|37| `ple` | `birth_rate` |  |
|| `ple1` | `birth_rate` |  |
|| `ple2` | `birth_rate` |  |
|38| `dcfs` | `birth_rate` |  |
|39| `sfsn` | `birth_rate` |  |
|40| `diopc` | `birth_rate` |  |
|| `diopc1` | `birth_rate` |  |
|| `diopc2` | `birth_rate` |  |
|41| `frsn` | `birth_rate` |  |
|42| `fie` | `birth_rate` |  |
|43| `aiopc` | `birth_rate` |  |
|44| `nfc` | `birth_rate` |  |
|45| `fce` | `birth_rate` |  |
|46| `fcfpc` | `birth_rate` |  |
|| `fcfpc1` | `birth_rate` |  |
|| `fcfpc2` | `birth_rate` |  |
|47| `fcapc` | `birth_rate` |  |
|48| `fsafc` | `birth_rate` |  |
|49| `iopc` | `industrial_subsector` | `land_development`, `land_erosion_urban_industrial_use`, `job_subsector`, `service_subsector`, `non_renewable`, `birth_rate`, `death_rate` | 8|
|50| `io` | `industrial_subsector` | `agricultural_inputs`, `land_development`, `service_subsector`, `supplementary_equations` | 5|
|51| `icor` | `industrial_subsector` | |
|52| `ic` | `industrial_subsector` | `job_subsector` |
|53| `icdr` | `industrial_subsector` | |
|54| `alic` | `industrial_subsector` | |
|55| `icir` | `industrial_subsector` | |
|56| `fioai` | `industrial_subsector` | |
|57| `fioac` | `industrial_subsector` | |
|58| `fioacc` | `industrial_subsector` | |
|59| `fioacv` | `industrial_subsector` | |
|60| `isopc` | `service_subsector` | |
|61| `isopc1` | `service_subsector` | |
|62| `isopc2` | `service_subsector` | |
|63| `fioas` | `service_subsector` | `industrial_subsector` |
|64| `fioas1` | `service_subsector` | |
|65| `fioas2` | `service_subsector` | |
|66| `scir` | `service_subsector` | |
|67| `sc` | `service_subsector` | `job_subsector` |
|68| `scdr` | `service_subsector` | |
|69| `alsc` | `service_subsector` | |
|70| `so` | `service_subsector` | `supplementary_equations` |
|71| `sopc` | `service_subsector` | `job_subsector`, `birth_rate`, `death_rate` | 4|
|72| `scor` | `service_subsector` | |
|73| `j` | `job_subsector` | |
|74| `pjis` | `job_subsector` | |
|75| `jpicu` | `job_subsector` | |
|76| `pjss` | `job_subsector` | |
|77| `jpscu` | `job_subsector` | |
|78| `pjas` | `job_subsector` | |
|79| `jph` | `job_subsector` | |
|80| `lf` | `job_subsector` | |
|81| `luf` | `job_subsector` | |
|82| `lufd` | `job_subsector` | |
|83| `cuf` | `job_subsector` | `industrial_subsector`, `service_subsector` |
|84| `lfc` | `land_development` | |
|85| `al` | `land_development` | `agricultural_inputs`, `land_erosion_urban_industrial_use`, `job_subsector`, `persistent_pollution` | 5|
|86| `pal` | `land_development` | |
|87| `f` | `land_development` | `supplementary_equations` |
|88| `fpc` | `land_development` | `discontinuing_land_maintenance`, `death_rate` |
|89| `ifpc` | `land_development` | |
|90| `ifpc1` | `land_development` | |
|91| `ifpc2` | `land_development` | |
|92| `tai` | `land_development` | `agricultural_inputs` |
|93| `fioaa` | `land_development` | `industrial_subsector` |
|94| `fioaa1` | `land_development` | |
|95| `fioaa2` | `land_development` | |
|96| `ldr` | `land_development` | |
|97| `dcph` | `land_development` | `investment_allocation_decision` |
|98| `cai` | `agricultural_inputs` | |
|99| `ai` | `agricultural_inputs` | |
|100| `alai` | `agricultural_inputs` | `investment_allocation_decision` |
|101| `aiph` | `agricultural_inputs` | `investment_allocation_decision`, `job_subsector`, `persistent_pollution` |
|102| `lymc` | `agricultural_inputs` | `investment_allocation_decision` |
|103| `ly` | `agricultural_inputs` | `investment_allocation_decision`, `land_development`, `land_erosion_urban_industrial_use` |
|104| `lyf` | `agricultural_inputs` |  |
|105| `lymap` | `agricultural_inputs` |  |
|106| `lymap1` | `agricultural_inputs` |  |
|107| `lymap2` | `agricultural_inputs` |  |
|108| `fiald` | `agricultural_inputs` | `investment_allocation_decision` , `land_development` |
|109| `mpld` | `investment_allocation_decision` |  |
|110| `mpai` | `investment_allocation_decision` |  |
|111| `mlymc` | `investment_allocation_decision` |  |
|112| `all` | `land_erosion_urban_industrial_use` |  |
|113| `llmy` | `land_erosion_urban_industrial_use` |  |
|114| `llmy1` | `land_erosion_urban_industrial_use` |  |
|115| `llmy2` | `land_erosion_urban_industrial_use` |  |
|116| `ler` | `land_erosion_urban_industrial_use` | `land_development` |
|117| `uilpc` | `land_erosion_urban_industrial_use` |  |
|118| `uilr` | `land_erosion_urban_industrial_use` |  |
|119| `lrui` | `land_erosion_urban_industrial_use` | `land_development` |
|120| `uil` | `land_erosion_urban_industrial_use` |  |
|121| `lfert` | `land_fertility_degradation` | `agricultural_inputs`, `land_fertility_regeneration` |
|122| `lfdr` | `land_fertility_degradation` |  |
|123| `lfd` | `land_fertility_degradation` |  |
|124| `lfr` | `land_fertility_regeneration` | `land_fertility_degradation` |
|125| `lfrt` | `land_fertility_regeneration` | |
|126| `falm` | `discontinuing_land_maintenance` | `agricultural_inputs`, `land_fertility_regeneration` |
|127| `fr` | `discontinuing_land_maintenance` | |
|128| `pfr` | `discontinuing_land_maintenance` | |
|129| `nr` | `non_renewable` | |
|130| `nrur` | `non_renewable` | |
|131| `nruf` | `non_renewable` | |
|132| `pcrum` | `non_renewable` | `persistent_pollution` |
|133| `nrfr` | `non_renewable` | |
|134| `fcaor` | `non_renewable` | `industrial_subsector` |
|135| `fcaor1` | `non_renewable` | |
|136| `fcaor2` | `non_renewable` | |
|137| `ppgr` | `persistent_pollution` | |
|138| `ppgf` | `persistent_pollution` | |
|| `ppgf2` | `persistent_pollution` | |
|| `ppgf22` | `persistent_pollution` | `adaptive_technological_control_cards` |
|139| `ppgio` | `persistent_pollution` | |
|140| `ppgao` | `persistent_pollution` | |
|141| `ppapr` | `persistent_pollution` | |
|| `ppapr1` | `persistent_pollution` | |
|| `ppapr2` | `persistent_pollution` | |
|| `ppapr3` | `persistent_pollution` | |
|| `pptd` | `persistent_pollution` | |
|142| `ppol` | `persistent_pollution` | |
|143| `ppolx` | `persistent_pollution` | `land_fertility_degradation`, `pollution_damage`, `death_rate` |
|144| `ppasr` | `persistent_pollution` | |
|145| `ahlm` | `persistent_pollution` | |
|146| `ahl` | `persistent_pollution` | |
|| `ppgf221` | `adaptive_technological_control_cards` | |
|| `ppgf222` | `adaptive_technological_control_cards` | |
|| `pcti` | `adaptive_technological_control_cards` | |
|| `plmp` | `adaptive_technological_control_cards` | |
|| `plmp1` | `adaptive_technological_control_cards` | |
|| `plmp2` | `adaptive_technological_control_cards` | |
|| `pctcm` | `adaptive_technological_control_cards` | |
|| `pctir` | `adaptive_technological_control_cards` | |
|| `lmp` | `pollution_damage` | `adaptive_technological_control_cards` |
|| `lmp1` | `pollution_damage` | |
|| `lmp2` | `pollution_damage` | |
|| `lfdr` | `pollution_damage` | |
|| `lfdr1` | `pollution_damage` | |
|| `lfdr2` | `pollution_damage` | |
|147| `foa` | `supplementary_equations` | |
|148| `foi` | `supplementary_equations` | |
|149| `fos` | `supplementary_equations` | |

## Parameters

| Name 	| Value | System |
| ---	| --- 	| ------ |
| $\mathtt{ahl70}$ | $1.5$ | `Pollution` |
| $\mathtt{ai}$ | $5e9$ | `Agriculture` |
| $\mathtt{al}$ | $9e8$ | `Agriculture` |
| $\mathtt{alic}$ | $14$ | `NonRenewable` |
| $\mathtt{alic1}$ | $14$ | `Capital` |
| $\mathtt{alic2}$ | $14$ | `Capital` |
| $\mathtt{alsc1}$ | $20$ | `Capital` |
| $\mathtt{alsc2}$ | $20$ | `Capital` |
| $\mathtt{amti}$ | $1$ | `Pollution` |
| $\mathtt{cfood}$ | $250$ | `Population` |
| $\mathtt{cio}$ | $100$ | `Population` |
| $\mathtt{cso}$ | $150$ | `Population` |
| $\mathtt{dcfsn}$ | $4$ | `Population` |
| $\mathtt{fcest}$ | $4000$ | `Population` |
| $\mathtt{ffw}$ | $0.21$ | `Population` |
| $\mathtt{fioaa}$ | $0.12$ | `NonRenewable` |
| $\mathtt{fioac}$ | $0.43$ | `NonRenewable` |
| $\mathtt{fioac1}$ | $0.43$ | `Capital` |
| $\mathtt{fioac2}$ | $0.43$ | `Capital` |
| $\mathtt{fioas}$ | $0.12$ | `NonRenewable` |
| $\mathtt{fipm}$ | $0.001$ | `Pollution` |
| $\mathtt{frpm}$ | $0.02$ | `Pollution` |
| $\mathtt{gc}$ | $0.012$ | `NonRenewable` |
| $\mathtt{hsid}$ | $20$ | `Population` |
| $\mathtt{icor}$ | $3$ | `NonRenewable` |
| $\mathtt{icor1}$ | $3$ | `Capital` |
| $\mathtt{icor2}$ | $3$ | `Capital` |
| $\mathtt{ieat}$ | $3$ | `Population` |
| $\mathtt{iet}$ | $4000$ | `Capital` |
| $\mathtt{imef}$ | $0.1$ | `Pollution` |
| $\mathtt{imti}$ | $10$ | `Pollution` |
| $\mathtt{iopcd}$ | $400$ | `Capital` |
| $\mathtt{iphst}$ | $1940$ | `Population` |
| $\mathtt{len}$ | $28$ | `Population` |
| $\mathtt{lfert}$ | $600$ | `Agriculture` |
| $\mathtt{lfpf}$ | $0.75$ | `Capital` |
| $\mathtt{lpd}$ | $20$ | `Population` |
| $\mathtt{lt}$ | $2400$ | `Population` |
| $\mathtt{lt2}$ | $2400$ | `Population` |
| $\mathtt{lufdt}$ | $2$ | `Capital` |
| $\mathtt{mtfn}$ | $12$ | `Population` |
| $\mathtt{nri}$ | $1e12$ | `NonRenewable` |
| $\mathtt{nruf1}$ | $1$ | `NonRenewable` |
| $\mathtt{nruf2}$ | $1$ | `NonRenewable` |
| $\mathtt{pal}$ | $2.3e9$ | `Agriculture` |
| $\mathtt{pcti}$ | $1$ | `Pollution` |
| $\mathtt{pd}$ | $5$ | `Pollution` |
| $\mathtt{pet}$ | $4000$ | `Population` |
| $\mathtt{pfr}$ | $1$ | `Agriculture` |
| $\mathtt{pop2}$ | $4e9$ | `NonRenewable` |
| $\mathtt{popi}$ | $1.65e9$ | `NonRenewable` |
| $\mathtt{ppgf1}$ | $1$ | `Pollution` |
| $\mathtt{ppgf21}$ | $1$ | `Pollution` |
| $\mathtt{ppol70}$ | $1.36e8$ | `Pollution` |
| $\mathtt{pptd1}$ | $20$ | `Pollution` |
| $\mathtt{pptd2}$ | $20$ | `Pollution` |
| $\mathtt{ps}$ | $0$ | `Population` |
| $\mathtt{pt}$ | $1910$ | `Population` |
| $\mathtt{pyear}$ | $1975$ | `NonRenewable` |
| $\mathtt{pyear}$ | $1975$ | `Pollution` |
| $\mathtt{pyear}$ | $4000$ | `Capital` |
| $\mathtt{rlt}$ | $30$ | `Population` |
| $\mathtt{sad}$ | $20$ | `Population` |
| $\mathtt{scor1}$ | $1$ | `Capital` |
| $\mathtt{scor2}$ | $1$ | `Capital` |
| $\mathtt{sfpc}$ | $230$ | `Population` |
| $\mathtt{swat}$ | $0$ | `Pollution` |
| $\mathtt{tdd}$ | $10$ | `Pollution` |
| $\mathtt{uil}$ | $8.2e6$ | `Agriculture` |
| $\mathtt{zpgt}$ | $2500$ | `NonRenewable` |
| $\mathtt{zpgt}$ | $4000$ | `Population` |

## Tables and ranges

| Variable name | Table | Range | System |
| ---	| --- 	| ------ | ------ |
| $\mathtt{ifpc1}$ | $(230.0, 480.0, 690.0, 850.0, 970.0, 1070.0, 1150.0, 1210.0, 1250.0)$ | $(0, 1600)$ | `Agriculture` |
| $\mathtt{ifpc2}$ | $(230.0, 480.0, 690.0, 850.0, 970.0, 1070.0, 1150.0, 1210.0, 1250.0)$ | $(0, 1600)$ | `Agriculture` |
| $\mathtt{fioaa1}$ | $(0.4, 0.2, 0.1, 0.025, 0.0, 0.0)$ | $(0.0, 2.5)$ | `Agriculture` |
| $\mathtt{fioaa2}$ | $(0.4, 0.2, 0.1, 0.025, 0.0, 0.0)$ | $(0.0, 2.5)$ | `Agriculture` |
| $\mathtt{dcph}$ | $(100000.0, 7400.0, 5200.0, 3500.0, 2400.0, 1500.0, 750.0, 300.0, 150.0, 75.0, 50.0)$ | $(0, 1)$ | `Agriculture` |
| $\mathtt{lymc}$ | $(1.0, 3.0, 3.8, 4.4, 4.9, 5.4, 5.7, 6.0, 6.3, 6.6, 6.9, 7.2, 7.4, 7.6, 7.8, 8.0, 8.2, 8.4, 8.6, 8.8, 9.0, 9.2, 9.4, 9.6, 9.8, 10.0)$ | $(0, 1000)$ | `Agriculture` |
| $\mathtt{lymap1}$ | $(1.0, 1.0, 0.7, 0.4)$ | $(0, 30)$ | `Agriculture` |
| $\mathtt{lymap2}$ | $(1.0, 1.0, 0.7, 0.4)$ | $(0, 30)$ | `Agriculture` |
| $\mathtt{fiald}$ | $(0.0, 0.05, 0.15, 0.3, 0.5, 0.7, 0.85, 0.95, 1.0)$ | $(0, 2)$ | `Agriculture` |
| $\mathtt{mlymc}$ | $(0.075, 0.03, 0.015, 0.011, 0.009, 0.009, 0.007, 0.006, 0.005, 0.005, 0.005, 0.005, 0.005, 0.005, 0.005, 0.005)$ | $(0, 600)$ | `Agriculture` |
| $\mathtt{llmy1}$ | $(1.2, 1.0, 0.63, 0.36, 0.16, 0.055, 0.04, 0.025, 0.015, 0.01)$ | $(0, 9)$ | `Agriculture` |
| $\mathtt{llmy2}$ | $(1.2, 1.0, 0.63, 0.36, 0.16, 0.055, 0.04, 0.025, 0.015, 0.01)$ | $(0, 9)$ | `Agriculture` |
| $\mathtt{uilpc}$ | $(0.005, 0.008, 0.015, 0.025, 0.04, 0.055, 0.07, 0.08, 0.09)$ | $(0, 1600)$ | `Agriculture` |
| $\mathtt{lfdr}$ | $(0.0, 0.1, 0.3, 0.5)$ | $(0, 30)$ | `Agriculture` |
| $\mathtt{lfrt}$ | $(20.0, 13.0, 8.0, 4.0, 2.0, 2.0)$ | $(0, 0.1)$ | `Agriculture` |
| $\mathtt{falm}$ | $(0.0, 0.04, 0.07, 0.09, 0.1)$ | $(0, 4)$ | `Agriculture` |
| $\mathtt{fioaa}$ | $(0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1, 0.1)$ | $(1900, 2000)$ | `Capital` |
| $\mathtt{fioas2}$ | $(0.3, 0.2, 0.1, 0.05, 0.0)$ | $(0, 2)$ | `Capital` |
| $\mathtt{fioas1}$ | $(0.3, 0.2, 0.1, 0.05, 0.0)$ | $(0, 2)$ | `Capital` |
| $\mathtt{isopc1}$ | $(40.0, 300.0, 640.0, 1000.0, 1220.0, 1450.0, 1650.0, 1800.0, 2000.0)$ | $(0, 1600)$ | `Capital` |
| $\mathtt{isopc2}$ | $(40.0, 300.0, 640.0, 1000.0, 1220.0, 1450.0, 1650.0, 1800.0, 2000.0)$ | $(0, 1600)$ | `Capital` |
| $\mathtt{fioacv}$ | $(0.3, 0.32, 0.34, 0.36, 0.38, 0.43, 0.73, 0.77, 0.81, 0.82, 0.83)$ | $(0, 2)$ | `Capital` |
| $\mathtt{cuf}$ | $(1.0, 0.9, 0.7, 0.3, 0.1, 0.1)$ | $(1, 11)$ | `Capital` |
| $\mathtt{jpicu}$ | $(0.37, 0.18, 0.12, 0.09, 0.07, 0.06)$ | $(50, 800)$ | `Capital` |
| $\mathtt{jph}$ | $(2.0, 0.5, 0.4, 0.3, 0.27, 0.24, 0.2, 0.2)$ | $(2, 30)$ | `Capital` |
| $\mathtt{aiph}$ | $(5.0, 11.0, 21.0, 34.0, 58.0, 86.0, 123.0, 61.0, 23.0, 8.0, 3.0)$ | $(1900, 2100)$ | `Capital` |
| $\mathtt{al}$ | $(9.0, 10.0, 11.0, 13.0, 16.0, 20.0, 23.0, 24.0, 24.0, 24.0, 24.0)$ | $(1900, 2100)$ | `Capital` |
| $\mathtt{jpscu}$ | $(1.1, 0.6, 0.35, 0.2, 0.15, 0.15)$ | $(50, 800)$ | `Capital` |
| $\mathtt{pop}$ | $(1.65, 1.73, 1.8, 2.1, 2.3, 2.55, 3.0, 3.65, 4.0, 4.6, 5.15)$ | $(1900, 2000)$ | `Capital` |
| $\mathtt{fcaor}$ | $(0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05, 0.05)$ | $(1900, 2000)$ | `Capital` |
| $\mathtt{pcrum}$ | $(0.0, 0.85, 2.6, 4.4, 5.4, 6.2, 6.8, 7.0, 7.0)$ | $(0, 1600)$ | `NonRenewable` |
| $\mathtt{fcaor1}$ | $(1.0, 0.9, 0.7, 0.5, 0.2, 0.1, 0.05, 0.05, 0.05, 0.05, 0.05)$ | $(0, 1)$ | `NonRenewable` |
| $\mathtt{fcaor2}$ | $(1.0, 0.9, 0.7, 0.5, 0.2, 0.1, 0.05, 0.05, 0.05, 0.05, 0.05)$ | $(0, 1)$ | `NonRenewable` |
| $\mathtt{ahlm}$ | $(1.0, 11.0, 21.0, 31.0, 41.0)$ | $(1, 1001)$ | `Pollution` |
| $\mathtt{pcrum}$ | $(17.0, 30.0, 52.0, 78.0, 138.0, 280.0, 480.0, 660.0, 700.0, 700.0, 700.0)$ | $(1900, 2100)$ | `Pollution` |
| $\mathtt{pop}$ | $(16.0, 19.0, 22.0, 31.0, 42.0, 53.0, 67.0, 86.0, 109.0, 139.0, 176.0)$ | $(1900, 2100)$ | `Pollution` |
| $\mathtt{aiph}$ | $(6.6, 11.0, 20.0, 34.0, 57.0, 97.0, 168.0, 290.0, 495.0, 845.0, 1465.0)$ | $(1900, 2100)$ | `Pollution` |
| $\mathtt{al}$ | $(9.0, 10.0, 11.0, 13.0, 16.0, 20.0, 24.0, 26.0, 27.0, 27.0, 27.0)$ | $(1900, 2100)$ | `Pollution` |
| $\mathtt{pctcm}$ | $(0.0, -0.05)$ | $(0, 0.1)$ | `Pollution` |
| $\mathtt{lmp1}$ | $(1.0, 0.99, 0.97, 0.95, 0.90, 0.85, 0.75, 0.65, 0.55, 0.40, 0.20)$ | $(0, 100)$ | `Pollution` |
| $\mathtt{lmp2}$ | $(1.0, 0.99, 0.97, 0.95, 0.90, 0.85, 0.75, 0.65, 0.55, 0.40, 0.20)$ | $(0, 100)$ | `Pollution` |
| $\mathtt{lfdr1}$ | $(0.0, 0.1, 0.3, 0.5)$ | $(0, 30)$ | `Pollution` |
| $\mathtt{lfdr2}$ | $(0.0, 0.1, 0.3, 0.5)$ | $(0, 30)$ | `Pollution` |
| $\mathtt{cmi}$ | $(0.5, 0.05, -0.1, -0.08, -0.02, 0.05, 0.1, 0.15, 0.2)$ | $(0, 1600)$ | `Population` |
| $\mathtt{fpu}$ | $(0.0, 0.2, 0.4, 0.5, 0.58, 0.65, 0.72, 0.78, 0.8)$ | $(0, 16e9)$ | `Population` |
| $\mathtt{hsapc}$ | $(0.0, 20.0, 50.0, 95.0, 140.0, 175.0, 200.0, 220.0, 230.0)$ | $(0.0, 2000.0)$ | `Population` |
| $\mathtt{lmf}$ | $(0.0, 1.0, 1.2, 1.3, 1.35, 1.4)$ | $(0.0, 5.0)$ | `Population` |
| $\mathtt{lmhs1}$ | $(1.0, 1.1, 1.4, 1.6, 1.7, 1.8)$ | $(0.0, 100.0)$ | `Population` |
| $\mathtt{lmhs2}$ | $(1.0, 1.4, 1.6, 1.8, 1.95, 2.0)$ | $(0.0, 100.0)$ | `Population` |
| $\mathtt{lmp}$ | $(1.0, 0.99, 0.97, 0.95, 0.9, 0.85, 0.75, 0.65, 0.55, 0.4, 0.2)$ | $(0.0, 100.0)$ | `Population` |
| $\mathtt{fm}$ | $(0.0, 0.2, 0.4, 0.6, 0.8, 0.9, 1.0, 1.05, 1.1)$ | $(0.0, 80.0)$ | `Population` |
| $\mathtt{cmple}$ | $(3.0, 2.1, 1.6, 1.4, 1.3, 1.2, 1.1, 1.05, 1.0)$ | $(0.0, 80.0)$ | `Population` |
| $\mathtt{sfsn}$ | $(1.25, 1.0, 0.9, 0.8, 0.75)$ | $(0.0, 800.0)$ | `Population` |
| $\mathtt{frsn}$ | $(0.5, 0.6, 0.7, 0.85, 1.0)$ | $(-0.2, 0.2)$ | `Population` |
| $\mathtt{fce}$ | $(0.75, 0.85, 0.9, 0.95, 0.98, 0.99, 1.0)$ | $(0.0, 3.0)$ | `Population` |
| $\mathtt{fsafc}$ | $(0.0, 0.005, 0.015, 0.025, 0.03, 0.035)$ | $(0.0, 10.0)$ | `Population` |
| $\mathtt{m1}$ | $(0.0567, 0.0366, 0.0243, 0.0155, 0.0082, 0.0023, 0.001)$ | $(20, 80)$ | `Population` |
| $\mathtt{m2}$ | $(0.0266, 0.0171, 0.0110, 0.0065, 0.0040, 0.0016, 0.0008)$ | $(20, 80)$ | `Population` |
| $\mathtt{m3}$ | $(0.0562, 0.0373, 0.0252, 0.0171, 0.0118, 0.0083, 0.006)$ | $(20, 80)$ | `Population` |
| $\mathtt{m4}$ | $(0.13, 0.11, 0.09, 0.07, 0.06, 0.05, 0.04)$ | $(20, 80)$ | `Population` |
