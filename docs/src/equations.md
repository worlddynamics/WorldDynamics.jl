# World 3 equations and constants

The pdf page is given by the book page + 16.
For the definitions, see *Appendix B: Definition File* at page 587 of [*Dynamics of growth in a finite world*][DGFW].

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
| Population	| $\mathtt{pop}(0)=1.61e9$ |
| Effective health services per capita	| $\mathtt{ehspc}(0)=\mathtt{hsapc}(0)$ |
| Perceived life expectancy	| $\mathtt{ple}(0) = \mathtt{le}(0)$  |
|	| $\mathtt{ple1}(0) = \mathtt{le}(0)$  |
|	| $\mathtt{ple2}(0) = \mathtt{le}(0)$  |
| Delayed industrial out	| $\mathtt{diopc}(0) = \mathtt{iopc}(0)$  |
|	| $\mathtt{diopc2}(0) = \mathtt{iopc}(0)$  |
|	| $\mathtt{diopc1}(0) = \mathtt{iopc}(0)$  |
|	| $\mathtt{frsn}(0)=0.82$  |
|	| $\mathtt{aiopc}(0) = \mathtt{iopc}(0)$  |
|	| $\mathtt{fcfpc}(0) = \mathtt{fcapc}(0)$  |
|	| $\mathtt{fcfpc2}(0) = \mathtt{fcapc}(0)$  |
|	| $\mathtt{fcfpc1}(0) = \mathtt{fcapc}(0)$  |

## Variable/ODE system correspondance
| #   | Variable | Main ODE system | Other ODE systems | # ODE systems |
| --- | -------- | --------------- | ----------------- | ------------- |
|1| `pop`    | `Pop4.population` | `Agriculture.land_development`, `Agriculture.land_erosion_urban_industrial_use`, `Capital.industrial_subsector`, `Capital.service_subsector`, `NonRenewable.non_renewable`, `Pollution.persistent_pollution`, `Pop4.birth_rate`, `Pop4.death_rate` | 9 |
|2| `p1`    | `Pop4.population` | | 1|
|3| `p2`    | `Pop4.population` | `Capital.job_subsector` | 2|
|4| `p3`    | `Pop4.population` | `Capital.job_subsector` | 2|
|5| `p4`    | `Pop4.population` | | 1|
|6| `d1`    | `Pop4.population` | | 1|
|7| `d2`    | `Pop4.population` | | 1|
|8| `d3`    | `Pop4.population` | | 1|
|9| `d4`    | `Pop4.population` | | 1|
|10| `m1`    | `Pop4.population` | | 1|
|11| `m2`    | `Pop4.population` | | 1|
|12| `m3`    | `Pop4.population` | | 1|
|13| `m4`    | `Pop4.population` | | 1|
|14| `mat1`    | `Pop4.population` | | 1|
|15| `mat2`    | `Pop4.population` | | 1|
|16| `mat3`    | `Pop4.population` | | 1|
|17| `dr`    | `Pop4.death_rate` | `Pop4.population` | 2|
|18| `cdr`    | `Pop4.death_rate` |  | 1|
|19| `le`    | `Pop4.death_rate` | `Pop4.birth_rate`,`Pop4.population` | 3|
|20| `lmf`    | `Pop4.death_rate` |  | 1|
|21| `hsapc`    | `Pop4.death_rate` |  | 1|
|22| `ehspc`    | `Pop4.death_rate` |  | 1|
|23| `lmhs`    | `Pop4.death_rate` |  | 1|
|24| `lmhs1`    | `Pop4.death_rate` |  | 1|
|25| `lmhs2`    | `Pop4.death_rate` |  | 1|
|26| `fpu`    | `Pop4.death_rate` |  | 1|
|27| `cmi`    | `Pop4.death_rate` |  | 1|
|28| `lmc`    | `Pop4.death_rate` |  | 1|
|29| `lmp`    | `Pop4.death_rate` |  | 1|
|30| `br`    | `Pop4.birth_rate` | `Pop4.population` | 2|
|31| `cbr`    | `Pop4. birth_rate ` |  | 1|
|32| `tf`    | `Pop4.birth_rate` | `Pop4.population` | 2|
|33| `mtf`    | `Pop4.birth_rate` |  | 1|
|34| `fm`    | `Pop4.birth_rate` |  | 1|
|35| `dtf`    | `Pop4.birth_rate` |  | 1|
|36| `cmple`    | `Pop4.birth_rate` |  | 1|
|37| `ple`    | `Pop4.birth_rate` |  | 1|
|| `ple1`    | `Pop4.birth_rate` |  | 1|
|| `ple2`    | `Pop4.birth_rate` |  | 1|
|38| `dcfs`    | `Pop4.birth_rate` |  | 1|
|39| `sfsn`    | `Pop4.birth_rate` |  | 1|
|40| `diopc`    | `Pop4.birth_rate` |  | 1|
|| `diopc1`    | `Pop4.birth_rate` |  | 1|
|| `diopc2`    | `Pop4.birth_rate` |  | 1|
|41| `frsn`    | `Pop4.birth_rate` |  | 1|
|42| `fie`    | `Pop4.birth_rate` |  | 1|
|43| `aiopc`    | `Pop4.birth_rate` |  | 1|
|44| `nfc`    | `Pop4.birth_rate` |  | 1|
|45| `fce`    | `Pop4.birth_rate` |  | 1|
|46| `fcfpc`    | `Pop4.birth_rate` |  | 1|
|| `fcfpc1`    | `Pop4.birth_rate` |  | 1|
|| `fcfpc2`    | `Pop4.birth_rate` |  | 1|
|47| `fcapc`    | `Pop4.birth_rate` |  | 1|
|48| `fsafc`    | `Pop4.birth_rate` |  | 1|
|49| `iopc`    | `Capital.industrial_subsector` | `Agriculture.land_development`, `Agriculture.land_erosion_urban_industrial_use`, `Capital.job_subsector`, `Capital.service_subsector`, `NonRenewable.non_renewable`, `Pop4.birth_rate`, `Pop4.death_rate` | 8|
|50| `io`    | `Capital.industrial_subsector` | `Agriculture.agricultural_inputs`, `Agriculture.land_development`, `Capital.service_subsector`, `SupplementaryEquations.supplementary_equations` | 5|
|51| `icor`    | `Capital.industrial_subsector` | | 1|
|52| `ic`    | `Capital.industrial_subsector` | `Capital.job_subsector` | 2|
|53| `icdr`    | `Capital.industrial_subsector` | | 1|
|54| `alic`    | `Capital.industrial_subsector` | | 1|
|55| `icir`    | `Capital.industrial_subsector` | | 1|
|56| `fioai`    | `Capital.industrial_subsector` | | 1|
|57| `fioac`    | `Capital.industrial_subsector` | | 1|
|58| `fioacc`    | `Capital.industrial_subsector` | | 1|
|59| `fioacv`    | `Capital.industrial_subsector` | | 1|
|60| `isopc`    | `Capital.service_subsector` | | 1|
|61| `isopc1`    | `Capital.service_subsector` | | 1|
|62| `isopc2`    | `Capital.service_subsector` | | 1|
|63| `fioas`    | `Capital.service_subsector` | `Capital.industrial_subsector` | 2|
|64| `fioas1`    | `Capital.service_subsector` | | 1|
|65| `fioas2`    | `Capital.service_subsector` | | 1|
|66| `scir`    | `Capital.service_subsector` | | 1|
|67| `sc`    | `Capital.service_subsector` | `Capital.job_subsector` | 2|
|68| `scdr`    | `Capital.service_subsector` | | 1|
|69| `alsc`    | `Capital.service_subsector` | | 1|
|70| `so`    | `Capital.service_subsector` | `SupplementaryEquations.supplementary_equations` | 2|
|71| `sopc`    | `Capital.service_subsector` | `Capital.job_subsector`, `Pop4.birth_rate`, `Pop4.death_rate` | 4|
|72| `scor`    | `Capital.service_subsector` | | 1|
|73| `j`    | `Capital.job_subsector` | | 1|
|74| `pjis`    | `Capital.job_subsector` | | 1|
|75| `jpicu`    | `Capital.job_subsector` | | 1|
|76| `pjss`    | `Capital.job_subsector` | | 1|
|77| `jpscu`    | `Capital.job_subsector` | | 1|
|78| `pjas`    | `Capital.job_subsector` | | 1|
|79| `jph`    | `Capital.job_subsector` | | 1|
|80| `lf`    | `Capital.job_subsector` | | 1|
|81| `luf`    | `Capital.job_subsector` | | 1|
|82| `lufd`    | `Capital.job_subsector` | | 1|
|83| `cuf`    | `Capital.job_subsector` | `Capital.industrial_subsector`, `Capital.service_subsector` | 3|
|84| `lfc`    | `Agriculture.land_development` | | 1|
|85| `al`    | `Agriculture.land_development` | `Agriculture.agricultural_inputs`, `Agriculture.land_erosion_urban_industrial_use`, `Capital.job_subsector`, `Pollution.persistent_pollution` | 5|
|86| `pal`    | `Agriculture.land_development` | | 1|
|87| `f`    | `Agriculture.land_development` | `SupplementaryEquations.supplementary_equations` | 2|
|88| `fpc`    | `Agriculture.land_development` | `Agriculture.discontinung_land_maintenance`, `Pop4.death_rate` | 3|
|89| `ifpc`    | `Agriculture.land_development` | | 1|
|90| `ifpc1`    | `Agriculture.land_development` | | 1|
|91| `ifpc2`    | `Agriculture.land_development` | | 1|
|92| `tai`    | `Agriculture.land_development` | `Agriculture.agricultural_inputs` | 2|
|93| `fioaa`    | `Agriculture.land_development` | `Capital.industrial_subsector` | 2|
|94| `fioaa1`    | `Agriculture.land_development` | | 1|
|95| `fioaa2`    | `Agriculture.land_development` | | 1|
|96| `ldr`    | `Agriculture.land_development` | | 1|
|97| `dcph`    | `Agriculture.land_development` | `Agriculture.investment_allocation_decision` | 2|
|98| `cai`    | `Agriculture.agricultural_inputs` | | 1|
|99| `ai`    | `Agriculture.agricultural_inputs` | | 1|
|100| `alai`    | `Agriculture.agricultural_inputs` | `Agriculture.investment_allocation_decision` | 2|
|101| `aiph`    | `Agriculture.agricultural_inputs` | `Agriculture.investment_allocation_decision`, `Capital.job_subsector`, `Pollution.persistent_pollution` | 4|
|102| `lymc`    | `Agriculture.agricultural_inputs` | `Agriculture.investment_allocation_decision` | 2|
|103| `ly`    | `Agriculture.agricultural_inputs` | `Agriculture.investment_allocation_decision`, `Agriculture.land_development`, `Agriculture.land_erosion_urban_industrial_use` | 4|
|104| `lyf`    | `Agriculture.agricultural_inputs` |  | 1|
|105| `lymap`    | `Agriculture.agricultural_inputs` |  | 1|
|106| `lymap1`    | `Agriculture.agricultural_inputs` |  | 1|
|107| `lymap2`    | `Agriculture.agricultural_inputs` |  | 1|
|108| `fiald`    | `Agriculture.agricultural_inputs` | `Agriculture.investment_allocation_decision` , `Agriculture.land_development` | 3|
|109| `mpld`    | `Agriculture.investment_allocation_decision` |  | 1|
|110| `mpai`    | `Agriculture.investment_allocation_decision` |  | 1|
|111| `mlymc`    | `Agriculture.investment_allocation_decision` |  | 1|
|112| `all`    | `Agriculture.land_erosion_urban_industrial_use` |  | 1|
|113| `llmy`    | `Agriculture.land_erosion_urban_industrial_use` |  | 1|
|114| `llmy1`    | `Agriculture.land_erosion_urban_industrial_use` |  | 1|
|115| `llmy2`    | `Agriculture.land_erosion_urban_industrial_use` |  | 1|
|116| `ler`    | `Agriculture.land_erosion_urban_industrial_use` | `Agriculture.land_development` | 2|
|117| `uilpc`    | `Agriculture.land_erosion_urban_industrial_use` |  | 1|
|118| `uilr`    | `Agriculture.land_erosion_urban_industrial_use` |  | 1|
|119| `lrui`    | `Agriculture.land_erosion_urban_industrial_use` | `Agriculture.land_development` | 2|
|120| `uil`    | `Agriculture.land_erosion_urban_industrial_use` |  | 1|
|121| `lfert`    | `Agriculture.land_fertility_degradation` | `Agriculture.agricultural_inputs`, `Agriculture.land_fertility_regeneration` | 3|
|122| `lfdr`    | `Agriculture.land_fertility_degradation` |  | 1|
|123| `lfd`    | `Agriculture.land_fertility_degradation` |  | 1|
|124| `lfr`    | `Agriculture.land_fertility_regeneration` | `Agriculture.land_fertility_degradation` | 2|
|125| `lfrt`    | `Agriculture.land_fertility_regeneration` | | 1|
|126| `falm`    | `Agriculture.discontinuing_land_maintenance` | `Agriculture.agricultural_inputs`, `Agriculture.land_fertility_regeneration` | 3|
|127| `fr`    | `Agriculture.discontinuing_land_maintenance` | | 1|
|128| `pfr`    | `Agriculture.discontinuing_land_maintenance` | | 1|
|129| `nr`    | `NonRenewable.non_renewable` | | 1|
|130| `nrur`    | `NonRenewable.non_renewable` | | 1|
|131| `nruf`    | `NonRenewable.non_renewable` | | 1|
|132| `pcrum`    | `NonRenewable.non_renewable` | `Pollution.persistent_pollution` | 2|
|133| `nrfr`    | `NonRenewable.non_renewable` | | 1|
|134| `fcaor`    | `NonRenewable.non_renewable` | `Capital.industrial_subsector` | 2|
|135| `fcaor1`    | `NonRenewable.non_renewable` | | 1|
|136| `fcaor2`    | `NonRenewable.non_renewable` | | 1|
|137| `ppgr`    | `Pollution.persistent_pollution` | | 1|
|138| `ppgf`    | `Pollution.persistent_pollution` | | 1|
|| `ppgf2`    | `Pollution.persistent_pollution` | | 1|
|| `ppgf22`    | `Pollution.persistent_pollution` | `Pollution.adaptive_technological_control_cards` | 2|
|139| `ppgio`    | `Pollution.persistent_pollution` | | 1|
|140| `ppgao`    | `Pollution.persistent_pollution` | | 1|
|141| `ppapr`    | `Pollution.persistent_pollution` | | 1|
|| `ppapr1`    | `Pollution.persistent_pollution` | | 1|
|| `ppapr2`    | `Pollution.persistent_pollution` | | 1|
|| `ppapr3`    | `Pollution.persistent_pollution` | | 1|
|| `pptd`    | `Pollution.persistent_pollution` | | 1|
|142| `ppol`    | `Pollution.persistent_pollution` | | 1|
|143| `ppolx`    | `Pollution.persistent_pollution` | `Agriculture.land_fertility_degradation`, `Pollution.pollution_damage`, `Pop4.death_rate` | 4|
|144| `ppasr`    | `Pollution.persistent_pollution` | | 1|
|145| `ahlm`    | `Pollution.persistent_pollution` | | 1|
|146| `ahl`    | `Pollution.persistent_pollution` | | 1|
|| `ppgf221`    | `Pollution.adaptive_technological_control_cards` | | 1|
|| `ppgf222`    | `Pollution.adaptive_technological_control_cards` | | 1|
|| `pcti`    | `Pollution.adaptive_technological_control_cards` | | 1|
|| `plmp`    | `Pollution.adaptive_technological_control_cards` | | 1|
|| `plmp1`    | `Pollution.adaptive_technological_control_cards` | | 1|
|| `plmp2`    | `Pollution.adaptive_technological_control_cards` | | 1|
|| `pctcm`    | `Pollution.adaptive_technological_control_cards` | | 1|
|| `pctir`    | `Pollution.adaptive_technological_control_cards` | | 1|
|| `lmp`    | `Pollution.pollution_damage` | `Pollution.adaptive_technological_control_cards` | 2|
|| `lmp1`    | `Pollution.pollution_damage` | | 1|
|| `lmp2`    | `Pollution.pollution_damage` | | 1|
|| `lfdr`    | `Pollution.pollution_damage` | | 1|
|| `lfdr1`    | `Pollution.pollution_damage` | | 1|
|| `lfdr2`    | `Pollution.pollution_damage` | | 1|
|147| `foa`    | `SupplementaryEquations.supplementary_equations` | | 1|
|148| `foi`    | `SupplementaryEquations.supplementary_equations` | | 1|
|149| `fos`    | `SupplementaryEquations.supplementary_equations` | | 1|

## Constants

To be copied from `parameters.jl`.
