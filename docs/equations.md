| Equation 	| Initialisation 	| Parameter	| Reference	| 
| ---		| ---				| ---		| ---		|
|1  |  $\frac{d\mathtt{pop}}{dt}=\mathtt{br}-\mathtt{dr}$ | $\mathtt{pop}(0)=1.61e9$ |  | lines 1-3, page 167\\|
|2  | $\mathtt{dr}=\frac{\mathtt{pop}}{\mathtt{le}}$ |  |  | line 4, page 167\\|
|3  | $\mathtt{cdr}=1000\times\frac{\mathtt{dr}}{\mathtt{pop}}$ |  |  | line 5, page 167\\|
|4  | $\mathtt{le}=\mathtt{len}\times\mathtt{lmf}\times\mathtt{lmhs}\times\mathtt{lmp}\times\mathtt{lmc}$ |  | $\mathtt{len}=28$ | lines 6-7, page 167\\|
|5  | $\mathtt{lmf}=\mathit{interpolate}\left(\frac{\mathtt{fpc}}{\mathtt{sfpc}}\right)$ |  | $\mathtt{sfpc}=230$ | lines 8-10, page 167\\|
|6  | $\mathtt{hsapc}=\mathit{interpolate}\left(\mathtt{sopc}\right)$ |  |  | lines 11-12, page 167\\|
|7  | $\frac{d\mathtt{ehspc}}{dt}=\frac{\mathtt{hsapc}-\mathtt{ehspc}}{\mathtt{hsid}}$ | $\mathtt{ehspc}(0)=\mathtt{hsapc}(0)$ | $\mathtt{hsid}=20$ | lines 13-14, page 167\\|
|8  | $\mathtt{lmhs}=t\geq\mathtt{iphst}?\mathtt{lmhs2}:\mathtt{lmhs1}$ |  | $\mathtt{iphst}=40$ | lines 15-16, page 167\\|
|9  | $\mathtt{lmhs1}=\mathit{interpolate}(\mathtt{ehspc})$ |  |  | lines 17-18, page 167\\|
|10  | $\mathtt{lmhs2}=\mathit{interpolate}(\mathtt{ehspc})$ |  |  | lines 19-20, page 167\\|
|11  | $\mathtt{fpu}=\mathit{interpolate}(\mathtt{pop})$ |  |  | lines 21-22, page 167\\|
|12  | $\mathtt{cmi}=\mathit{interpolate}(\mathtt{iopc})$ |  |  | lines 23-24, page 167\\|
|13  | $\mathtt{lmc}=1-\mathtt{cmi}\times\mathtt{fpu}$ |  |  | line 25, page 167\\|
|14  | $\mathtt{lmp}=\mathit{interpolate}(\mathtt{ppolx})$ |  |  | lines 26-27, page 167\\|
|15  | $\mathtt{br}=t\geq\mathtt{pet}?\mathtt{dr}:\mathtt{tf}\times\mathtt{pop}\times\mathtt{ffw}/\mathtt{rlt}$ |  | $\mathtt{ffw}=0.21,\mathtt{rlt}=30,\mathtt{pet}=4000$ | lines 28-31, page 168\\|
|16  | $\mathtt{cbr}=1000\times\frac{\mathtt{br}}{\mathtt{pop}}$ |  |  | line 32, page 168\\|
|17  | $\mathtt{lmp}=\mathit{min}(\mathtt{mtf}, \mathtt{mtf}\times(1-\mathtt{fce})+\mathtt{dtf}\times\mathtt{fce})$ |  |  | line 33, page 168\\|
|18  | $\mathtt{mtf}=\mathtt{mtfn}\times\mathtt{fm}$ |  | $\mathtt{mtfn}=12$ | lines 34-35, page 168\\|
|19  | $\mathtt{fm}=\mathit{interpolate}(\mathtt{le})$ |  |  | lines 36-37, page 168\\|
|20  | $\mathtt{dtf}=\mathtt{dcfs}\times\mathtt{cmple}$ |  |  | lines 38, page 168\\|
|21  | $\mathtt{cmple}=\mathit{interpolate}(\mathtt{ple})$ |  |  | lines 39-40, page 168\\|
|22.1  | $\frac{d\mathtt{ple}}{dt}=3\times\frac{\mathtt{ple2}-\mathtt{ple}}{\mathtt{lpd}}$ | $\mathtt{ple}(0) = \mathtt{le}(0)$ | $\mathtt{lpd}=20$ | lines 41-42, page 168\\|
|22.2  | $\frac{d\mathtt{ple2}}{dt}=3\times\frac{\mathtt{ple1}-\mathtt{ple2}}{\mathtt{lpd}}$ | $\mathtt{ple2}(0) = \mathtt{le}(0)$ |  | lines 41-42, page 168\\|
|22.3  | $\frac{d\mathtt{ple1}}{dt}=3\times\frac{\mathtt{le}-\mathtt{ple1}}{\mathtt{lpd}}$ | $\mathtt{ple1}(0) = \mathtt{le}(0)$ |  | lines 41-42, page 168\\|
|23  | $\mathtt{dcfs}=t\geq\mathtt{zpgt}?2:\mathtt{dcfsn}\times\mathtt{frsn}\times\mathtt{sfsn}$ |  | $\mathtt{zpgt}=4000,\mathtt{dcfsn}=4$ | lines 43-45, page 168\\|
|24  | $\mathtt{sfsn}=\mathit{interpolate}(\mathtt{diopc})$ |  |  | lines 46-47, page 168\\|
|25.1  | $\frac{d\mathtt{diopc}}{dt}=3\times\frac{\mathtt{diopc2}-\mathtt{diopc}}{\mathtt{sad}}$ | $\mathtt{diopc}(0) = \mathtt{iopc}(0)$ | $\mathtt{sad}=20$ | lines 48-49, page 168\\|
|25.2  | $\frac{d\mathtt{diopc2}}{dt}=3\times\frac{\mathtt{diopc1}-\mathtt{diopc2}}{\mathtt{sad}}$ | $\mathtt{diopc2}(0) = \mathtt{iopc}(0)$ |  | lines 48-49, page 168\\|
|25.3  | $\frac{d\mathtt{diopc1}}{dt}=3\times\frac{\mathtt{iopc}-\mathtt{diopc1}}{\mathtt{sad}}$ | $\mathtt{diopc1}(0) = \mathtt{iopc}(0)$ |  | lines 48-49, page 168\\|
|26  | $\mathtt{frsn}=\mathit{interpolate}(\mathtt{fie})$ | $\mathtt{frsn}(0)=0.82$ | | lines 50-52, page 168\\|
|27  | $\mathtt{fie}=(\mathtt{iopc}-\mathtt{aiopc})/\mathtt{aiopc}$ |  |  | line 53, page 168\\|
|28  | $\frac{d\mathtt{aiopc}}{dt}=\frac{\mathtt{iopc}-\mathtt{aiopc}}{\mathtt{ieat}}$ | $\mathtt{aiopc}(0) = \mathtt{iopc}(0)$ |  | lines 54-55, page 168\\|
|29  | $\mathtt{nfc}=\frac{\mathtt{mtf}}{\mathtt{dtf}}-1$ |  |  | line 56, page 168\\|
|30  | $\mathtt{fce}=t\geq\mathtt{fcest}?1:\mathit{interpolate}(\mathtt{fcfpc})$ |  | $\mathtt{fcest}=4000$ | lines 57-59, page 168\\|
|31.1  | $\frac{d\mathtt{fcfpc}}{dt}=3\times\frac{\mathtt{fcfpc2}-\mathtt{fcfpc}}{\mathtt{hsid}}$ | $\mathtt{fcfpc}(0) = \mathtt{fcapc}(0)$ |  | line 60, page 168\\|
|31.2  | $\frac{d\mathtt{fcfpc2}}{dt}=3\times\frac{\mathtt{fcfpc1}-\mathtt{fcfpc2}}{\mathtt{hsid}}$ | $\mathtt{fcfpc2}(0) = \mathtt{fcapc}(0)$ |  | line 60, page 168\\|
|31.3  | $\frac{d\mathtt{fcfpc1}}{dt}=3\times\frac{\mathtt{fcapc}-\mathtt{fcfpc1}}{\mathtt{hsid}}$ | $\mathtt{fcfpc1}(0) = \mathtt{fcapc}(0)$ |  | line 60, page 168\\|
|32  | $\mathtt{fcapc}=\mathtt{fsafc}\times\mathtt{sopc}$ |  |  | line 61, page 168\\|
|33  | $\mathtt{fsafc}=\mathit{interpolate}(\mathtt{nfc})$ |  | | lines 62-63, page 168\\|
|34 | $\mathtt{iopc}=0.7e11\times e^{\mathtt{lt}\times0.037}/\mathtt{pop}$ |  | $\mathtt{lt}=500$ | lines 64-72, page 168\\|
|35 | $\mathtt{ppolx}=1.0$ |  |  | lines 73-75, page 168\\|
|36 | $\mathtt{sopc}=1.5e11\times e^{\mathtt{lt}\times0.030}/\mathtt{pop}$ |  |  | lines 76-82, page 168\\|
|37 | $\mathtt{fpc}=4e11\times e^{\mathtt{lt}\times0.020}/\mathtt{pop}$ |  |  | lines 83-89, page 168\\|