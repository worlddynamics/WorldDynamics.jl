# World 3 Constants and Equations 

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

### Initializations

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



## Constants

| Name 	| Acronym 	| Initialisation 	| Reference	|
| --- 	| ---	| ---	| ---	|
|	|	|	|	|

<!-- References -->
[DUM]: http://archive.org/details/dynamousersmanua00pugh "A. L. Pugh, DYNAMO user’s manual. 1963. Accessed: Nov. 17, 2021."
[DGFW]: http://archive.org/details/dynamicsofgrowth0000unse "Dynamics of growth in a finite world. Cambridge, Mass. : Wright-Allen Press, 1974. Accessed: Nov. 17, 2021."
