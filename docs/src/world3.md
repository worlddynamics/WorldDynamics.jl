# [World 3 equations, variables, and parameters](@id eqs_vars_pars) 

In this page we list the equations, the variables and the parameters of the World3 model as described in Appendices A and B of the book *Dynamics of growth in a finite world* (1974) (our code also implement the model corresponding to each system of the entire World3 model as described in Chapter 2, 3, 4, 5, and 6 of the book, but we do not list here the equations, the variables and the parameters of each such model).

## Equations

| System | # | Definition 	| Reference	| Notes |
| --- 	| --- 	| ---	| ---	| --- 	|
| Population | 1  	| $\mathtt{pop} = \mathtt{p1} + \mathtt{p2} + \mathtt{p3} + \mathtt{p4}$ | page 567 | |
| Population | 2  	| $\frac{d\mathtt{p1}}{dt} = \mathtt{br} - \mathtt{d1} - \mathtt{mat1}$ | page 567 | see initialisation of $\mathtt{p1}$ |
| Population | 3  	| $\mathtt{d1} = \mathtt{m1}\times\mathtt{p1}$ | page 567 | |
| Population | 4  	| $\mathtt{m1}=\mathit{interpolate}\left(\mathtt{le}\right)$ | page 567 | see table $\mathtt{m1}$ |
| Population | 5  	| $\mathtt{mat1} = \frac{1}{15}\times(1 - \mathtt{m1})\times\mathtt{p1}$ | page 567 | |
| Population | 6  	| $\frac{d\mathtt{p2}}{dt} = \mathtt{mat1} - \mathtt{d2} - \mathtt{mat2}$ | page 567 | see initialisation of $\mathtt{p2}$ |
| Population | 7  	| $\mathtt{d2} = \mathtt{m2}\times\mathtt{p2}$ | page 567 | |
| Population | 8  	| $\mathtt{m2}=\mathit{interpolate}\left(\mathtt{le}\right)$ | page 568 | see table $\mathtt{m2}$ |
| Population | 9  	| $\mathtt{mat2} = \frac{1}{30}\times(1 - \mathtt{m2})\times\mathtt{p2}$ | page 568 | |
| Population | 10  	| $\frac{d\mathtt{p3}}{dt} = \mathtt{mat2} - \mathtt{d3} - \mathtt{mat3}$ | page 568 | see initialisation of $\mathtt{p3}$ |
| Population | 11  	| $\mathtt{d3} = \mathtt{m3}\times\mathtt{p3}$ | page 568 | |
| Population | 12  	| $\mathtt{m3}=\mathit{interpolate}\left(\mathtt{le}\right)$ | page 568 | see table $\mathtt{m3}$ |
| Population | 13  	| $\mathtt{mat3} = \frac{1}{20}\times(1 - \mathtt{m3})\times\mathtt{p3}$ | page 568 | |
| Population | 14  	| $\frac{d\mathtt{p4}}{dt} = \mathtt{mat3} - \mathtt{d4}$ | page 568 | see initialisation of $\mathtt{p1=4}$ |
| Population | 15  	| $\mathtt{d4} = \mathtt{m4}\times\mathtt{p4}$ | page 568 | |
| Population | 16  	| $\mathtt{m4}=\mathit{interpolate}\left(\mathtt{le}\right)$ | page 568 | see table $\mathtt{m4}$ |
| Population | 17	| $\mathtt{d}=\mathtt{d1}+\mathtt{d2}+\mathtt{d3}+\mathtt{d4}$ | page 568 | $\mathtt{dr}$ in our code |
| Population | 18  | $\mathtt{cdr}=1000\times\frac{\mathtt{d}}{\mathtt{pop}}$ | page 568 |
| Population | 19  | $\mathtt{le}=\mathtt{len}\times\mathtt{lmf}\times\mathtt{lmhs}\times\mathtt{lmp}\times\mathtt{lmc}$ | page 568 | see value of $\mathtt{len}$ |
| Population |20  | $\mathtt{lmf}=\mathit{interpolate}\left(\frac{\mathtt{fpc}}{\mathtt{sfpc}}\right)$ | page 569 | see table $\mathtt{lmf}$ |
| Population |21  | $\mathtt{hsapc}=\mathit{interpolate}\left(\mathtt{sopc}\right)$ | page 569 | see table $\mathtt{hsapc}$ |
| Population |22  | $\frac{d\mathtt{ehspc}}{dt}=\frac{\mathtt{hsapc}-\mathtt{ehspc}}{\mathtt{hsid}}$ | page 569 | see value of $\mathtt{hsid}$ |
| Population |23  | $ \mathtt{lmhs}=clip(\mathtt{lmhs2},\mathtt{lmhs1},t,\mathtt{iphst}) $ | page 569 | see value of $\mathtt{iphst}$ |
| Population |24  | $\mathtt{lmhs1}=\mathit{interpolate}(\mathtt{ehspc})$ | page 569 | see table $\mathtt{lmhs1}$ |
| Population |25  | $\mathtt{lmhs2}=\mathit{interpolate}(\mathtt{ehspc})$ | page 569 | see table $\mathtt{lmhs2}$ |
| Population |26  | $\mathtt{fpu}=\mathit{interpolate}(\mathtt{pop})$ | page 569 | see table $\mathtt{fpu}$ |
| Population |27  | $\mathtt{cmi}=\mathit{interpolate}(\mathtt{iopc})$ | page 569 | see table $\mathtt{cmi}$ |
| Population |28  | $\mathtt{lmc}=1-\mathtt{cmi}\times\mathtt{fpu}$ | page 570 | |
| Population |29  | $\mathtt{lmp}=\mathit{interpolate}(\mathtt{ppolx})$ | page 570 | see table $\mathtt{lmp}$ |
| Population | 30  | $ \mathtt{b}=clip(\mathtt{d},\frac{\mathtt{tf}\times\mathtt{p2}\times0.5}{\mathtt{rlt}},t,\mathtt{pet}) $ | page 570 | $\mathtt{br}$ in our code, see values of $\mathtt{rlt}$ and $\mathtt{pet}$ |
| Population |31  | $\mathtt{cbr}=1000\times\frac{\mathtt{b}}{\mathtt{pop}}$ | page 570 | |
| Population |32  | $\mathtt{lmp}=\mathit{min}(\mathtt{mtf}, \mathtt{mtf}\times(1-\mathtt{fce})+\mathtt{dtf}\times\mathtt{fce})$ | page 570 | |
| Population |33  | $\mathtt{mtf}=\mathtt{mtfn}\times\mathtt{fm}$ | page 570 | see value of $\mathtt{mtfn}$ |
| Population |34  | $\mathtt{fm}=\mathit{interpolate}(\mathtt{le})$ | page 570 | see table $\mathtt{fm}$ |
| Population |35  | $\mathtt{dtf}=\mathtt{dcfs}\times\mathtt{cmple}$ | page 570 | |
| Population |36  | $\mathtt{cmple}=\mathit{interpolate}(\mathtt{ple})$ | page 570 | see table $\mathtt{cmple}$ |
| Population |37  | $\frac{d\mathtt{ple}}{dt}=3\times\frac{\mathtt{ple2}-\mathtt{ple}}{\mathtt{lpd}}$ | page 571 | see value of $\mathtt{lpd}$ |
| Population |37  | $\frac{d\mathtt{ple2}}{dt}=3\times\frac{\mathtt{ple1}-\mathtt{ple2}}{\mathtt{lpd}}$ | page 571 | see value of $\mathtt{lpd}$ |
| Population |37   | $\frac{d\mathtt{ple1}}{dt}=3\times\frac{\mathtt{le}-\mathtt{ple1}}{\mathtt{lpd}}$ | page 571 | see value of $\mathtt{lpd}$ |
| Population |38  | $ \mathtt{dcfs}=clip(2,\mathtt{dcfsn}\times\mathtt{frsn}\times\mathtt{sfsn},t,\mathtt{zpgt}) $ | page 571 | see values of $\mathtt{dcfsn}$ and $\mathtt{zpgt}$ |
| Population |39  | $\mathtt{sfsn}=\mathit{interpolate}(\mathtt{diopc})$ | page 571 | see table $\mathtt{sfsn}$ |
| Population |40  | $\frac{d\mathtt{diopc}}{dt}=3\times\frac{\mathtt{diopc2}-\mathtt{diopc}}{\mathtt{sad}}$ | page 571 | see value of $\mathtt{sad}$ |
| Population |40  | $\frac{d\mathtt{diopc2}}{dt}=3\times\frac{\mathtt{diopc1}-\mathtt{diopc2}}{\mathtt{sad}}$ | page 571 | see value of $\mathtt{sad}$ |
| Population |40  | $\frac{d\mathtt{diopc1}}{dt}=3\times\frac{\mathtt{iopc}-\mathtt{diopc1}}{\mathtt{sad}}$ | page 571 | see value of $\mathtt{sad}$ |
| Population |41  | $\mathtt{frsn}=\mathit{interpolate}(\mathtt{fie})$ | page 571 | see table $\mathtt{frsn}$ and initialisation of $\mathtt{frsn}$ |
| Population |42  | $\mathtt{fie}=\frac{\mathtt{iopc}-\mathtt{aiopc}}{\mathtt{aiopc}}$ | page 571 | |
| Population |43  | $\frac{d\mathtt{aiopc}}{dt}=\frac{\mathtt{iopc}-\mathtt{aiopc}}{\mathtt{ieat}}$ | page 571 | see value of $\mathtt{ieat}$ |
| Population |44  | $\mathtt{nfc}=\frac{\mathtt{mtf}}{\mathtt{dtf}}-1$ | page 571 | |
| Population |45  | $\mathtt{fce}=clip(1,\mathit{interpolate}(\mathtt{fcfpc}),t,\mathtt{fcest})$ | page 571 | see table $\mathtt{fce}$ and value of $\mathtt{fcest}$ |
| Population |46  | $\frac{d\mathtt{fcfpc}}{dt}=3\times\frac{\mathtt{fcfpc2}-\mathtt{fcfpc}}{\mathtt{hsid}}$ | page 572 | see value of $\mathtt{hsid}$ |
| Population |46  | $\frac{d\mathtt{fcfpc2}}{dt}=3\times\frac{\mathtt{fcfpc1}-\mathtt{fcfpc2}}{\mathtt{hsid}}$ | page 572 | see value of $\mathtt{hsid}$ |
| Population |46  | $\frac{d\mathtt{fcfpc1}}{dt}=3\times\frac{\mathtt{fcapc}-\mathtt{fcfpc1}}{\mathtt{hsid}}$ | page 572 | see value of $\mathtt{hsid}$ |
| Population |47  | $\mathtt{fcapc}=\mathtt{fsafc}\times\mathtt{sopc}$ | page 572 | |
| Population |48  | $\mathtt{fsafc}=\mathit{interpolate}(\mathtt{nfc})$ | page 572 | see table $\mathtt{fsafc}$ |
| Capital |49 | $\mathtt{iopc}=\frac{\mathtt{io}}{\mathtt{pop}}$ | page 572 | |
| Capital |50 | $\mathtt{io}=\frac{\mathtt{ic}\times(1-\mathtt{fcaor})\times\mathtt{cuf}}{\mathtt{icor}}$ | page 572 | |
| Capital |51 | $\mathtt{fce}=clip(\mathtt{icor2},\mathtt{icor1},t,\mathtt{pyear})$ | page 572 | see values of $\mathtt{icor1}$, $\mathtt{icor2}$, and $\mathtt{pyear}$ |
| Capital |52 | $\frac{d\mathtt{ic}}{dt}=\mathtt{icir}-\mathtt{icdr}$ | page 572 | see initialisation of $\mathtt{ic}$ |
| Capital |53 | $\mathtt{icdr}=\frac{\mathtt{ic}}{\mathtt{alic}}$ | page 572 |  |
| Capital |54 | $\mathtt{alic}=clip(\mathtt{alic2},\mathtt{alic1},t,\mathtt{pyear})$ | page 573 | see values of $\mathtt{alic1}$, $\mathtt{alic2}$, and $\mathtt{pyear}$ |
| Capital |55 | $\mathtt{icir}=\mathtt{io}\times\mathtt{fioai}$ | page 573 |  |
| Capital |56 | $\mathtt{fioai}=1-\mathtt{fioaa}-\mathtt{fioas}-\mathtt{fioac}$ | page 573 |  |
| Capital |57 | $\mathtt{fioac}=clip(\mathtt{fioacv},\mathtt{fioacc},t,\mathtt{iet})$ | page 573 | see value of $\mathtt{iet}$ |
| Capital |58 | $\mathtt{fioacc}=clip(\mathtt{fioac2},\mathtt{fioac1},t,\mathtt{pyear})$ | page 573 | see values of $\mathtt{fioac1}$, $\mathtt{fioac2}$, and $\mathtt{pyear}$ |
| Capital |59  | $\mathtt{fioacv}=\mathit{interpolate}\left(\frac{\mathtt{iopc}}{\mathtt{iopcd}}\right)$ | page 571 | see table $\mathtt{fioacv}$ |
| Capital |60 | $\mathtt{isopc}=clip(\mathtt{isopc2},\mathtt{isopc1},t,\mathtt{pyear})$ | page 573 | see value of $\mathtt{pyear}$ |
| Capital |61  | $\mathtt{isopc1}=\mathit{interpolate}(\mathtt{iopc})$ | page 573 | see table $\mathtt{isopc1}$ |
| Capital |62  | $\mathtt{isopc2}=\mathit{interpolate}(\mathtt{iopc})$ | page 574 | see table $\mathtt{isopc2}$ |
| Capital |63 | $\mathtt{fioas}=clip(\mathtt{fioas2},\mathtt{fioas1},t,\mathtt{pyear})$ | page 574 | see value of $\mathtt{pyear}$ |
| Capital |64  | $\mathtt{fioas1}=\mathit{interpolate}\left(\frac{\mathtt{sopc}}{\mathtt{isopc}}\right)$ | page 574 | see table $\mathtt{fioas1}$ |
| Capital |65  | $\mathtt{fioas2}=\mathit{interpolate}\left(\frac{\mathtt{sopc}}{\mathtt{isopc}}\right)$ | page 574 | see table $\mathtt{fioas2}$ |
| Capital |66 | $\mathtt{scir}=\mathtt{io}\times\mathtt{fioas}$ | page 574 |  |
| Capital |67 | $\frac{d\mathtt{sc}}{dt}=\mathtt{scir}-\mathtt{scdr}$ | page 574 | see initialisation of $\mathtt{sc}$ |
| Capital |68 | $\mathtt{scdr}=\frac{\mathtt{sc}}{\mathtt{alsc}}$ | page 574 |  |
| Capital |69 | $\mathtt{alsc}=clip(\mathtt{alsc2},\mathtt{alsc1},t,\mathtt{pyear})$ | page 574 | see values of $\mathtt{alsc1}$, $\mathtt{alsc2}$, and $\mathtt{pyear}$ |
| Capital |70 | $\mathtt{so}=\frac{\mathtt{sc}\times\mathtt{cuf}}{\mathtt{scor}}$ | page 575 |  |
| Capital |71 | $\mathtt{sopc}=\frac{\mathtt{so}}{\mathtt{pop}}$ | page 575 |  |
| Capital |72 | $\mathtt{scor}=clip(\mathtt{scor2},\mathtt{scor1},t,\mathtt{pyear})$ | page 575 | see values of $\mathtt{scor1}$, $\mathtt{scor2}$, and $\mathtt{pyear}$ |
| Capital |73 | $\mathtt{j}=\mathtt{pjis}+\mathtt{pjas}+\mathtt{pjss}$ | page 575 |  |
| Capital |74 | $\mathtt{pjis}=\mathtt{ic}\times\mathtt{jpicu}$ | page 575 |  |
| Capital |75  | $\mathtt{jpicu}=\mathit{interpolate}(\mathtt{iopc})\times0.001$ | page 575 | see table $\mathtt{jpicu}$ |
| Capital |76 | $\mathtt{pjss}=\mathtt{sc}\times\mathtt{jpscu}$ | page 575 |  |
| Capital |77  | $\mathtt{jpscu}=\mathit{interpolate}(\mathtt{sopc})\times0.001$ | page 575 | see table $\mathtt{jpscu}$ |
| Capital |78 | $\mathtt{pjas}=\mathtt{jph}\times\mathtt{al}$ | page 575 |  |
| Capital |79  | $\mathtt{jph}=\mathit{interpolate}(\mathtt{aiph})$ | page 575 | see table $\mathtt{jph}$ |
| Capital |80 | $\mathtt{lf}=(\mathtt{p2}+\mathtt{p3})\times\mathtt{lfpf}$ | page 575-6 | see value of $\mathtt{lfpf}$ |
| Capital |81 | $\mathtt{luf}=\frac{\mathtt{j}}{\mathtt{lf}}$ | page 576 |  |
| Capital |82 | $\frac{d\mathtt{lufd}}{dt}=\frac{\mathtt{luf}-\mathtt{lufd}}{\mathtt{lufdt}}$ | page 576 | see value of $\mathtt{lufdt}$ |
| Capital |83  | $\mathtt{cuf}=\mathit{interpolate}(\mathtt{lufd})$ | page 576 | see table $\mathtt{cuf}$ and initialisation of $\mathtt{cuf}$ |
| Agriculture |84 | $\mathtt{lfc}=\frac{\mathtt{al}}{\mathtt{palt}}$ | page 576 | see value of $\mathtt{palt}$ |
| Agriculture |85 | $\frac{d\mathtt{al}}{dt}=\mathtt{ldr}-\mathtt{ler}-\mathtt{lrui}$ | page 576 | see initialisation of $\mathtt{al}$ |
| Agriculture |86 | $\frac{d\mathtt{pal}}{dt}=-\mathtt{ldr}$ | page 576 | see initialisation of $\mathtt{pal}$ |
| Agriculture |87 | $\mathtt{f}=\mathtt{ly}\times\mathtt{al}\times\mathtt{lfh}\times(1-\mathtt{pl})$ | page 576 | see values of $\mathtt{lfh}$ and $\mathtt{pl}$ |
| Agriculture |88 | $\mathtt{fpc}=\frac{\mathtt{f}}{\mathtt{pop}}$ | page 576 |  |
| Agriculture |89 | $\mathtt{ifpc}=clip(\mathtt{ifpc2},\mathtt{ifpc1},t,\mathtt{pyear})$ | page 577 | see value of $\mathtt{pyear}$ |
| Agriculture |90  | $\mathtt{ifpc1}=\mathit{interpolate}(\mathtt{iopc})$ | page 577 | see table $\mathtt{ifpc1}$ |
| Agriculture |91  | $\mathtt{ifpc2}=\mathit{interpolate}(\mathtt{iopc})$ | page 577 | see table $\mathtt{ifpc2}$ |
| Agriculture |92 | $\mathtt{tai}=\mathtt{io}\times\mathtt{fioaa}$ | page 577 |  |
| Agriculture |93 | $\mathtt{fioaa}=clip(\mathtt{fioaa2},\mathtt{fioaa1},t,\mathtt{pyear})$ | page 577 | see value of $\mathtt{pyear}$ |
| Agriculture |94  | $\mathtt{fioaa1}=\mathit{interpolate}\left(\frac{\mathtt{fpc}}{\mathtt{ifpc}}\right)$ | page 577 | see table $\mathtt{fioaa1}$ |
| Agriculture |95  | $\mathtt{fioaa2}=\mathit{interpolate}\left(\frac{\mathtt{fpc}}{\mathtt{ifpc}}\right)$ | page 577 | see table $\mathtt{fioaa2}$ |
| Agriculture |96 | $\mathtt{ldr}=\frac{\mathtt{tai}\times\mathtt{fiald}}{\mathtt{dcph}}$ | page 577 |  |
| Agriculture |97  | $\mathtt{dcph}=\mathit{interpolate}\left(\frac{\mathtt{pal}}{\mathtt{palt}}\right)$ | page 578 | see table $\mathtt{dcph}$ |
| Agriculture |98 | $\mathtt{cai}=\mathtt{tai}\times(1-\mathtt{fiald})$ | page 578 |  |
| Agriculture |99 | $\frac{d\mathtt{ai}}{dt}=\frac{\mathtt{cai}-\mathtt{ai}}{\mathtt{alai}}$ | page 578 | see initialisation of $\mathtt{ai}$ |
| Agriculture |100 | $\mathtt{alai}=clip(\mathtt{alai2},\mathtt{alai1},t,\mathtt{pyear})$ | page 578 | see values of $\mathtt{alai1}$, $\mathtt{alai2}$, and $\mathtt{pyear}$ |
| Agriculture |101 | $\mathtt{aiph}=\frac{\mathtt{ai}\times(1-\mathtt{falm})}{\mathtt{al}}$ | page 578 |  |
| Agriculture |102  | $\mathtt{lymc}=\mathit{interpolate}(\mathtt{aiph})$ | page 578 | see table $\mathtt{lymc}$ |
| Agriculture |103 | $\mathtt{ly}=\mathtt{lyf}\times\mathtt{lfert}\times\mathtt{lymc}\times\mathtt{lymap}$ | page 578 |  |
| Agriculture |104 | $\mathtt{lyf}=clip(\mathtt{lyf2},\mathtt{lyf1},t,\mathtt{pyear})$ | page 578 | see values of $\mathtt{lyf1}$, $\mathtt{lyf2}$, and $\mathtt{pyear}$ |
| Agriculture |105 | $\mathtt{lymap}=clip(\mathtt{lymap2},\mathtt{lymap1},t,\mathtt{pyear})$ | page 579 | see value of $\mathtt{pyear}$ |
| Agriculture |106  | $\mathtt{lymap1}=\mathit{interpolate}\left(\frac{\mathtt{io}}{\mathtt{io70}}\right)$ | page 579 | see table $\mathtt{lymap1}$ and value of $\mathtt{io70}$ |
| Agriculture |107  | $\mathtt{lymap2}=\mathit{interpolate}\left(\frac{\mathtt{io}}{\mathtt{io70}}\right)$ | page 579 | see table $\mathtt{lymap2}$  and value of $\mathtt{io70}$ |
| Agriculture |108  | $\mathtt{fiald}=\mathit{interpolate}\left(\frac{\mathtt{mpld}}{\mathtt{mpai}}\right)$ | page 579 | see table $\mathtt{fiald}$ |
| Agriculture |109 | $\mathtt{mpld}=\frac{\mathtt{ly}}{\mathtt{dcph}\times\mathtt{sd}}$ | page 579 | see value of $\mathtt{sd}$ |
| Agriculture |110 | $\mathtt{mpai}=\frac{\mathtt{alai}\times\mathtt{ly}\times\mathtt{mlymc}}{\mathtt{lymc}}$ | page 579 |  |
| Agriculture |111  | $\mathtt{mlymc}=\mathit{interpolate}(\mathtt{aiph})$ | page 579 | see table $\mathtt{mlymc}$ |
| Agriculture |112 | $\mathtt{all}=\mathtt{alln}\times\mathtt{llmy}$ | page 580 | see value of $\mathtt{alln}$ |
| Agriculture |113 | $\mathtt{llmy}=clip(\mathtt{llmy2},\mathtt{llmy1},t,\mathtt{pyear})$ | page 580 | see value of $\mathtt{pyear}$ |
| Agriculture |114  | $\mathtt{llmy1}=\mathit{interpolate}\left(\frac{\mathtt{ly}}{\mathtt{ilf}}\right)$ | page 580 | see table $\mathtt{llmy1}$ |
| Agriculture |115  | $\mathtt{llmy2}=\mathit{interpolate}\left(\frac{\mathtt{ly}}{\mathtt{ilf}}\right)$ | page 580 | see table $\mathtt{llmy2}$ |
| Agriculture |116 | $\mathtt{ler}=\frac{\mathtt{al}}{\mathtt{all}}$ | page 580 |  |
| Agriculture |117  | $\mathtt{uilpc}=\mathit{interpolate}(\mathtt{iopc})$ | page 580 | see table $\mathtt{uilpc}$ |
| Agriculture |118 | $\mathtt{uilr}=\mathtt{uilpc}\times\mathtt{pop}$ | page 580 |  |
| Agriculture |119  | $\mathtt{lrui}=\mathit{max}\left(0,\frac{\mathtt{uilr}-\mathtt{uil}}{\mathtt{uildt}}\right)$ | page 580 | see value of $\mathtt{uildt}$ |
| Agriculture |120 | $\frac{d\mathtt{uil}}{dt}=\mathtt{lrui}$ | page 580 | see initialisation of $\mathtt{uil}$ |
| Agriculture |121 | $\frac{d\mathtt{lfert}}{dt}=\mathtt{lfr}-\mathtt{lfd}$ | page 581 | see initialisation of $\mathtt{lfert}$ |
| Agriculture |122  | $\mathtt{lfdr}=\mathit{interpolate}(\mathtt{ppolx})$ | page 581 | see table $\mathtt{lfdr}$ |
| Agriculture |123 | $\mathtt{lfd}=\mathtt{lfert}\times\mathtt{lfdr}$ | page 581 |  |
| Agriculture |124 | $\mathtt{lfr}=\frac{\mathtt{ilf}-\mathtt{lfert}}{\mathtt{lfrt}}$ | page 581 | see value of $\mathtt{ilf}$ |
| Agriculture |125  | $\mathtt{lfrt}=\mathit{interpolate}(\mathtt{falm})$ | page 581 | see table $\mathtt{lfrt}$ |
| Agriculture |126  | $\mathtt{falm}=\mathit{interpolate}(\mathtt{pfr})$ | page 581 | see table $\mathtt{falm}$ |
| Agriculture |127 | $\mathtt{fr}=\frac{\mathtt{fpc}}{\mathtt{sfpc}}$ | page 581 | see value of $\mathtt{sfpc}$ |
| Agriculture |128 | $\frac{d\mathtt{pfr}}{dt}=\frac{\mathtt{fr}-\mathtt{pfr}}{\mathtt{fspd}}$ | page 581-2 | see initialisation of $\mathtt{pfr}$ and value of $\mathtt{fspd}$ |
| Nonrenewable |129 | $\frac{d\mathtt{nr}}{dt}=\mathtt{-nrur}$ | page 582 | see initialisation of $\mathtt{nr}$ |
| Nonrenewable |130 | $\mathtt{nrur}=\mathtt{pop}\times\mathtt{pcrum}\times\mathtt{nruf}$ | page 582 |  |
| Nonrenewable |131 | $\mathtt{nruf}=clip(\mathtt{nruf2},\mathtt{nruf1},t,\mathtt{pyear})$ | page 582 | see values of $\mathtt{nruf1}$, $\mathtt{nruf2}$, and $\mathtt{pyear}$ |
| Nonrenewable |132  | $\mathtt{pcrum}=\mathit{interpolate}(\mathtt{iopc})$ | page 582 | see table $\mathtt{pcrum}$ |
| Nonrenewable |133 | $\mathtt{nrfr}=\frac{\mathtt{nr}}{\mathtt{nri}}\times\mathtt{nruf}$ | page 582 | see initialisation of $\mathtt{nr}$ |
| Nonrenewable |134 | $\mathtt{fcaor}=clip(\mathtt{fcaor2},\mathtt{fcaor1},t,\mathtt{pyear})$ | page 582 | see value of $\mathtt{pyear}$ |
| Nonrenewable |135  | $\mathtt{fcaor1}=\mathit{interpolate}(\mathtt{nrfr})$ | page 582 | see table $\mathtt{fcaor1}$ |
| Nonrenewable |136  | $\mathtt{fcaor2}=\mathit{interpolate}(\mathtt{nrfr})$ | page 582-3 | see table $\mathtt{fcaor2}$ |
| Pollution |137 | $\mathtt{ppgr}=(\mathtt{ppgio}+\mathtt{ppgao})\times\mathtt{ppgf}$ | page 583 |  |
| Pollution |138 | $\mathtt{ppgf}=clip(\mathtt{ppgf2},\mathtt{ppgf1},t,\mathtt{pyear})$ | page 583 | see values of $\mathtt{ppgf2}$, $\mathtt{ppgf1}$, and $\mathtt{pyear}$ |
| Pollution |139 | $\mathtt{ppgio}=\mathtt{pcrum}\times\mathtt{pop}\times\mathtt{frpm}\times\mathtt{imef}\times\mathtt{imti}$ | page 583 | see values of $\mathtt{frpm}$, $\mathtt{imef}$, and $\mathtt{imti}$ |
| Pollution |140 | $\mathtt{ppgao}=\mathtt{aiph}\times\mathtt{al}\times\mathtt{fipm}\times\mathtt{amti}$ | page 583 | see values of $\mathtt{fipm}$ and $\mathtt{amti}$ |
| Pollution |141  | $\frac{d\mathtt{ppapr}}{dt}=3\times\frac{\mathtt{ppapr2}-\mathtt{ppapr}}{\mathtt{pptd}}$ | page 583 | see value of $\mathtt{pptd}$ |
| Pollution |141  | $\frac{d\mathtt{ppapr2}}{dt}=3\times\frac{\mathtt{ppapr1}-\mathtt{ppapr2}}{\mathtt{pptd}}$ | page 583 | see value of $\mathtt{pptd}$ |
| Pollution |141  | $\frac{d\mathtt{ppapr1}}{dt}=3\times\frac{\mathtt{ppgr}-\mathtt{ppapr1}}{\mathtt{pptd}}$ | page 583 | see value of $\mathtt{pptd}$ |
| Pollution |142  | $\frac{d\mathtt{ppol}}{dt}=\mathtt{ppapr}-\mathtt{ppasr}$ | page 583 | see initialisation of $\mathtt{ppol}$ |
| Pollution |143 | $\mathtt{ppolx}=\frac{\mathtt{ppol}}{\mathtt{ppol70}}$ | page 584 | see value of $\mathtt{ppol70}$ |
| Pollution |144 | $\mathtt{ppasr}=\frac{\mathtt{ppol}}{\mathtt{ahl}\times 1.4}$ | page 584 |  |
| Pollution |145  | $\mathtt{ahlm}=\mathit{interpolate}(\mathtt{ppolx})$ | page 584 | see table $\mathtt{ahlm}$ |
| Pollution |146 | $\mathtt{ahl}=\mathtt{ahl70}\times\mathtt{ahlm}$ | page 584 | see value of $\mathtt{ahl70}$ |
| Supplementary |147 | $\mathtt{foa}=\frac{0.22\times\mathtt{f}}{0.22\times\mathtt{f}+\mathtt{so}+\mathtt{io}}$ | page 584 |  |
| Supplementary |148 | $\mathtt{foi}=\frac{\mathtt{io}}{0.22\times\mathtt{f}+\mathtt{so}+\mathtt{io}}$ | page 584 |  |
| Supplementary |149 | $\mathtt{fos}=\frac{\mathtt{so}}{0.22\times\mathtt{f}+\mathtt{so}+\mathtt{io}}$ | page 584 |  |

## Variable and (ODE) subsystem correspondance

| Description   | Name | Main subsystem | Other subsystems |
| --- | -------- | --------------- | ----------------- |
| Population | `pop` | `population` | `land_development`, `land_erosion_urban_industrial_use`, `industrial_subsector`, `service_subsector`, `non_renewable`, `persistent_pollution`, `birth_rate`, `death_rate` |
| Population, ages 0-14 | `p1` | ` population` | |
| Population, ages 15-44 | `p2` | ` population` | `job_subsector` |
| Population, ages 45-64 | `p3` | ` population` | `job_subsector` |
| Population, ages 65+ | `p4` | ` population` | |
| Deaths per year, ages 0-14 | `d1` | ` population` | |
| Deaths per year, ages 15-44 | `d2` | ` population` | |
| Deaths per year, ages 45-64 | `d3` | ` population` | |
| Deaths per year, ages 65+ | `d4` | ` population` | |
| Mortality, ages 0-14 | `m1` | ` population` | |
| Mortality, ages 15-44 | `m2` | ` population` | |
| Mortality, ages 45-64 | `m3` | ` population` | |
| Mortality, ages 65+ | `m4` | ` population` | |
| Maturation rate, age 14-15 | `mat1` | ` population` | |
| Maturation rate, age 44-45 | `mat2` | ` population` | |
| Maturation rate, age 64-65 | `mat3` | ` population` | |
| Deaths per year| `dr` | `death_rate` | ` population` |
| Crude death rate | `cdr` | `death_rate` |  |
| Life expectancy | `le` | `death_rate` | `birth_rate`,` population` |
| Lifetime multiplier from food| `lmf` | `death_rate` |  |
| Health services allocations per capita| `hsapc` | `death_rate` |  |
| Effective health services per capita| `ehspc` | `death_rate` |  |
| Lifetime multiplier from health services | `lmhs` | `death_rate` |  |
| `lmhs` before time `pyear` | `lmhs1` | `death_rate` |  |
| `lmhs` after time `pyear` | `lmhs2` | `death_rate` |  |
| Fraction of population urban | `fpu` | `death_rate` |  |
| Crowding multiplier from industrialization | `cmi` | `death_rate` |  |
| Lifetime multiplier from crowding | `lmc` | `death_rate` |  |
| Lifetime multiplier from pollution | `lmp` | `death_rate` |  |
| Births per year | `br` | `birth_rate` | ` population` |
| Crude birth rate | `cbr` | `birth_rate ` |  |
| Total fertility | `tf` | `birth_rate` | ` population` |
| Maximum total fertility | `mtf` | `birth_rate` |  |
| Fecundity multiplier | `fm` | `birth_rate` |  |
| Desired total fertility | `dtf` | `birth_rate` |  |
| Compensatory multiplier from perceived life expectancy | `cmple` | `birth_rate` |  |
| Perceived life expectancy | `ple` | `birth_rate` |  |
|| `ple1` | `birth_rate` |  |
|| `ple2` | `birth_rate` |  |
| Desired completed family size | `dcfs` | `birth_rate` |  |
| Social family size norm | `sfsn` | `birth_rate` |  |
| Delayed industrial output per capita | `diopc` | `birth_rate` |  |
|| `diopc1` | `birth_rate` |  |
|| `diopc2` | `birth_rate` |  |
| Family response to social norm | `frsn` | `birth_rate` |  |
| Family income expectation | `fie` | `birth_rate` |  |
| Averag industrial output per capita | `aiopc` | `birth_rate` |  |
| Need for fertility control | `nfc` | `birth_rate` |  |
| Fertility control effectiveness | `fce` | `birth_rate` |  |
| Fertility control facilities per capita | `fcfpc` | `birth_rate` |  |
|| `fcfpc1` | `birth_rate` |  |
|| `fcfpc2` | `birth_rate` |  |
| Fertility control allocations per capita | `fcapc` | `birth_rate` |  |
| Fraction of services allocated to fertility control | `fsafc` | `birth_rate` |  |
| Industrial output per capita | `iopc` | `industrial_subsector` | `land_development`, `land_erosion_urban_industrial_use`, `job_subsector`, `service_subsector`, `non_renewable`, `birth_rate`, `death_rate` | 8|
| Industrial output | `io` | `industrial_subsector` | `agricultural_inputs`, `land_development`, `service_subsector`, `supplementary_equations` | 5|
| Industrial capital-output ratio | `icor` | `industrial_subsector` | |
| Industrial capital | `ic` | `industrial_subsector` | `job_subsector` |
| Industrial capital depreciation rate | `icdr` | `industrial_subsector` | |
| Average lifetime of industrial capital | `alic` | `industrial_subsector` | |
| Industrial capital investment rate | `icir` | `industrial_subsector` | |
| Fraction of industrial output allocated to industry | `fioai` | `industrial_subsector` | |
| Fraction of industrial output allocated to consumption | `fioac` | `industrial_subsector` | |
| `fioac` constant | `fioacc` | `industrial_subsector` | |
| `fioac` variable | `fioacv` | `industrial_subsector` | |
| Indicated service output per capita | `isopc` | `service_subsector` | |
| `isopc` before `pyear` | `isopc1` | `service_subsector` | |
| `isopc` after `pyear` | `isopc2` | `service_subsector` | |
| Fraction of industrial output allocated to services | `fioas` | `service_subsector` | `industrial_subsector` |
| `fioas` before `pyear` | `fioas1` | `service_subsector` | |
| `fioas` after `pyear` | `fioas2` | `service_subsector` | |
| Service capital investment rate | `scir` | `service_subsector` | |
| Service capital | `sc` | `service_subsector` | `job_subsector` |
| Service capital depreciation rate | `scdr` | `service_subsector` | |
| Average lifetime of service capital | `alsc` | `service_subsector` | |
| Service output | `so` | `service_subsector` | `supplementary_equations` |
| Service output per capita | `sopc` | `service_subsector` | `job_subsector`, `birth_rate`, `death_rate` | 4|
| Service capital-output ratio | `scor` | `service_subsector` | |
| Jobs | `j` | `job_subsector` | |
| Potential jobs in industrial sector | `pjis` | `job_subsector` | |
| Jobs per industrial capital unit | `jpicu` | `job_subsector` | |
| Potential jobs in service sector | `pjss` | `job_subsector` | |
| Jobs per service capital unit | `jpscu` | `job_subsector` | |
| Potential jobs in agricultural sector | `pjas` | `job_subsector` | |
| Jobs per hectare | `jph` | `job_subsector` | |
| Labor force | `lf` | `job_subsector` | |
| Labor utilization fraction | `luf` | `job_subsector` | |
| Labor utilization fraction delayed | `lufd` | `job_subsector` | |
| Capital utilization fraction | `cuf` | `job_subsector` | `industrial_subsector`, `service_subsector` |
| Land fraction cultivated | `lfc` | `land_development` | |
| Arable land | `al` | `land_development` | `agricultural_inputs`, `land_erosion_urban_industrial_use`, `job_subsector`, `persistent_pollution` | 5|
| Potentially arable land | `pal` | `land_development` | |
| Food | `f` | `land_development` | `supplementary_equations` |
| Food per capita | `fpc` | `land_development` | `discontinuing_land_maintenance`, `death_rate` |
| Indicated food per capita | `ifpc` | `land_development` | |
| `ifpc` before `pyear` | `ifpc1` | `land_development` | |
| `ifpc` after `pyear` | `ifpc2` | `land_development` | |
| Total agricultural investment | `tai` | `land_development` | `agricultural_inputs` |
| Fraction of industral ouput allocated to agriculture | `fioaa` | `land_development` | `industrial_subsector` |
| `fioaa` before `pyear` | `fioaa1` | `land_development` | |
| `fioaa` after `pyear` | `fioaa2` | `land_development` | |
| Land development rate | `ldr` | `land_development` | |
| Development cost per hectare | `dcph` | `land_development` | `investment_allocation_decision` |
| Current agricultural inputs | `cai` | `agricultural_inputs` | |
| agricultural inputs| `ai` | `agricultural_inputs` | |
| Average lifetime of agricultural inputs | `alai` | `agricultural_inputs` | `investment_allocation_decision` |
| Agricultural inputs per hectare | `aiph` | `agricultural_inputs` | `investment_allocation_decision`, `job_subsector`, `persistent_pollution` |
| Land yield multiplier from capital | `lymc` | `agricultural_inputs` | `investment_allocation_decision` |
| Land yield | `ly` | `agricultural_inputs` | `investment_allocation_decision`, `land_development`, `land_erosion_urban_industrial_use` |
| Land yield factor | `lyf` | `agricultural_inputs` |  |
| Land yield multiplier from air pollution | `lymap` | `agricultural_inputs` |  |
| `lymap ` before `pyear` | `lymap1` | `agricultural_inputs` |  |
| `lymap ` after `pyear` | `lymap2` | `agricultural_inputs` |  |
| Fraction of inputs allocated to land development | `fiald` | `agricultural_inputs` | `investment_allocation_decision` , `land_development` |
| Marginal productivity of land development | `mpld` | `investment_allocation_decision` |  |
| Marginal productivity of agricultural inputs | `mpai` | `investment_allocation_decision` |  |
| Marginal land yield multiplier from capital | `mlymc` | `investment_allocation_decision` |  |
| Average life of land | `all` | `land_erosion_urban_industrial_use` |  |
| Land life multiplier from yeld | `llmy` | `land_erosion_urban_industrial_use` |  |
| `llmy ` before `pyear` | `llmy1` | `land_erosion_urban_industrial_use` |  |
| `llmy ` after `pyear` | `llmy2` | `land_erosion_urban_industrial_use` |  |
| Land erosion rate | `ler` | `land_erosion_urban_industrial_use` | `land_development` |
| Urban-industrial land per capita | `uilpc` | `land_erosion_urban_industrial_use` |  |
| Urban-industrial land required | `uilr` | `land_erosion_urban_industrial_use` |  |
| Land removal from urban-industrial use | `lrui` | `land_erosion_urban_industrial_use` | `land_development` |
| Urban-industrial land | `uil` | `land_erosion_urban_industrial_use` |  |
| Land fertility | `lfert` | `land_fertility_degradation` | `agricultural_inputs`, `land_fertility_regeneration` |
| Land fertility degradation rate | `lfdr` | `land_fertility_degradation` |  |
| Land fertility degradation | `lfd` | `land_fertility_degradation` |  |
| Land fertility regeneration | `lfr` | `land_fertility_regeneration` | `land_fertility_degradation` |
| Land fertility regeneration time | `lfrt` | `land_fertility_regeneration` | |
| Fraction of inputs allocated to land maintenance | `falm` | `discontinuing_land_maintenance` | `agricultural_inputs`, `land_fertility_regeneration` |
| Food ratio | `fr` | `discontinuing_land_maintenance` | |
| Perceived food ratio | `pfr` | `discontinuing_land_maintenance` | |
| Nonrenewable resources | `nr` | `non_renewable` | |
| Nonrenewable resource usage rate | `nrur` | `non_renewable` | |
| Nonrenewable resource usage factor | `nruf` | `non_renewable` | |
| Per capita resource usage multiplier | `pcrum` | `non_renewable` | `persistent_pollution` |
| Nonrenewable resource fraction remaining | `nrfr` | `non_renewable` | |
| Fraction of capital allocated to obtaining resources | `fcaor` | `non_renewable` | `industrial_subsector` |
| `fcaor ` before `pyear` | `fcaor1` | `non_renewable` | |
| `fcaor ` after `pyear` | `fcaor2` | `non_renewable` | |
| Persistent pollution generation rate | `ppgr` | `persistent_pollution` | |
| Persistent pollution generation factor | `ppgf` | `persistent_pollution` | |
| `ppgf ` before `pyear`| `ppgf1` | `persistent_pollution` | |
| `ppgf ` after `pyear`| `ppgf2` | `persistent_pollution` | `adaptive_technological_control_cards` |
| Persistent pollution generated by industrial output | `ppgio` | `persistent_pollution` | |
| Persistent pollution generated by agricultural output | `ppgao` | `persistent_pollution` | |
| Persistent pollution appearance rate | `ppapr` | `persistent_pollution` | |
|| `ppapr1` | `persistent_pollution` | |
|| `ppapr2` | `persistent_pollution` | |
|| `ppapr3` | `persistent_pollution` | |
| Persistent pollution | `ppol` | `persistent_pollution` | |
| Index of persistent pollution | `ppolx` | `persistent_pollution` | `land_fertility_degradation`, `pollution_damage`, `death_rate` |
| Persistent pollution assimilation rate | `ppasr` | `persistent_pollution` | |
| Assimilation half-life multiplier | `ahlm` | `persistent_pollution` | |
| Assimilation half-life | `ahl` | `persistent_pollution` | |
| Lifetime multiplier from persistent pollution| `lmp` | `pollution_damage` | `adaptive_technological_control_cards` |
| Land fertility degradation rate | `lfdr` | `pollution_damage` | |
| Fraction of output in agriculture | `foa` | `supplementary_equations` | |
| Fraction of output in industry | `foi` | `supplementary_equations` | |
| Fraction of output in services | `fos` | `supplementary_equations` | |

## Variable initializations

| Description 	| Initialization 	| Reference |
| ---	| --- 	| --- |
| Agricultural inputs | $\mathtt{ai}(0) = 5e9$  | lines 99.1-2 |
| Arable land | $\mathtt{al}(0) = 0.9e9$  | lines 85.1-2 |
| Average industrial output per capita | $\mathtt{aiopc}(0) = \mathtt{iopc}(0)$  | line 43 |
| Capital utilization fraction | $\mathtt{cuf}(0) = 1$  | line 83.1 |
| Delayed industrial output per capita	| $\mathtt{diopc}(0) = \mathtt{iopc}(0)$  | line 40 |
|	| $\mathtt{diopc1}(0) = \mathtt{iopc}(0)$  |
|	| $\mathtt{diopc2}(0) = \mathtt{iopc}(0)$  |
| Effective health services per capita	| $\mathtt{ehspc}(0)=\mathtt{hsapc}(0)$ |  line 22 |
| Fertility control facilities per capita | $\mathtt{fcfpc}(0) = \mathtt{fcapc}(0)$  | line 46 |
|	| $\mathtt{fcfpc1}(0) = \mathtt{fcapc}(0)$  |
|	| $\mathtt{fcfpc2}(0) = \mathtt{fcapc}(0)$  |
| Family response to social norm | $\mathtt{frsn}(0)=0.82$  | line 41.2 |
| Industrial capital	| $\mathtt{ic}(0)=2.1e11$ | lines 52.1-2 |
| Land fertility	| $\mathtt{lfert}(0)=600$ | lines 121.1-2 |
| Labor utilization fraction delay	| $\mathtt{lufd}(0)=\mathtt{luf}(0)$ | line 82 |
| Nonrenewable resources	| $\mathtt{nr}(0)=1e12$ | lines 129.1-2 |
| Population, ages 0-14	| $\mathtt{p1}(0)=65e7$ | lines 2.1-2 |
| Population, ages 15-44	| $\mathtt{p2}(0)=70e7$ | lines 6.1-2 |
| Population, ages 45-64	| $\mathtt{p3}(0)=19e7$ | lines 10.1-2 |
| Population, ages 65+	| $\mathtt{p4}(0)=6e7$ | lines 14.1-2 |
| Potentially arable land | $\mathtt{pal}(0) = 2.3e9$  | lines 86.1-2 |
| Perceived food ratio	| $\mathtt{pfr}(0)=1$ | line 128 |
| Perceived life expectancy	| $\mathtt{ple}(0) = \mathtt{le}(0)$  | line 37 |
|	| $\mathtt{ple1}(0) = \mathtt{le}(0)$  |
|	| $\mathtt{ple2}(0) = \mathtt{le}(0)$  |
| Persistent pollution appearance rate	| $\mathtt{ppapr}(0) = \mathtt{ppgr}(0)$  | line 141 |
| 	| $\mathtt{ppapr1}(0) = \mathtt{ppgr}(0)$  |
| 	| $\mathtt{ppapr2}(0) = \mathtt{ppgr}(0)$  |
| 	| $\mathtt{ppapr3}(0) = \mathtt{ppgr}(0)$  |
| Persistent pollution	| $\mathtt{ppol}(0) = 2.5e7$  | line 142.1 |
| Service capital	| $\mathtt{sc}(0) = 1.44e11$  | lines 67.1-2 |
| Urban-industrial land | $\mathtt{uil}(0) = 8.2e6$  | lines 120.1-2 |

## Parameters

| Description | Name 	| Value | System |
| --- | ------	| -------	| ------ |
| Assimilation half-life in 1970 | $\mathtt{ahl}70$ | $1.5$ | `Pollution` |
| `alic` before `pyear` | $\mathtt{alic1}$ | $14$ | `Capital` |
| `alic` after `pyear` | $\mathtt{alic2}$ | $14$ | `Capital` |
| `alsc` before `pyear` | $\mathtt{alsc1}$ | $20$ | `Capital` |
| `alsc` after `pyear` | $\mathtt{alsc2}$ | $20$ | `Capital` |
| Agricultural materials toxicity index | $\mathtt{amti}$ | $1$ | `Pollution` |
| Desired completed family size normal | $\mathtt{dcfsn}$ | $4$ | `Population` |
| Fertility control effectiveness set time | $\mathtt{fcest}$ | $4000$ | `Population` |
| `fioac` before `pyear` | $\mathtt{fioac1}$ | $0.43$ | `Capital` |
| `fioac` after `pyear` | $\mathtt{fioac2}$ | $0.43$ | `Capital` |
| Fraction of inputs as persistent materials | $\mathtt{fipm}$ | $0.001$ | `Pollution` |
| Fraction of resources as persistent materials | $\mathtt{frpm}$ | $0.02$ | `Pollution` |
| Health services impact delay | $\mathtt{hsid}$ | $20$ | `Population` |
| `icor` before `pyear` | $\mathtt{icor1}$ | $3$ | `Capital` |
| `icor` after `pyear` | $\mathtt{icor2}$ | $3$ | `Capital` |
| Income expectation averaging time | $\mathtt{ieat}$ | $3$ | `Population` |
| Industrial equilibrium time | $\mathtt{iet}$ | $4000$ | `Capital` |
| Industrial materials emission factor | $\mathtt{imef}$ | $0.1$ | `Pollution` |
| Industrial materials toxicity index | $\mathtt{imti}$ | $10$ | `Pollution` |
| Industrial output per capita desired | $\mathtt{iopcd}$ | $400$ | `Capital` |
| Life expectancy normal | $\mathtt{len}$ | $28$ | `Population` |
| Labor force participation fraction | $\mathtt{lfpf}$ | $0.75$ | `Capital` |
| Lifetime perception delay | $\mathtt{lpd}$ | $20$ | `Population` |
| Labor utilization fraction delay time | $\mathtt{lufdt}$ | $2$ | `Capital` |
| Maximum total fertility normal | $\mathtt{mtfn}$ | $12$ | `Population` |
| `nruf` before `pyear` | $\mathtt{nruf1}$ | $1$ | `NonRenewable` |
| `nruf` after `pyear` | $\mathtt{nruf2}$ | $1$ | `NonRenewable` |
| Population equilibrium time | $\mathtt{pet}$ | $4000$ | `Population` |
| `ppgf` before `pyear` | $\mathtt{ppgf1}$ | $1$ | `Pollution` |
| `ppgf` after `pyear` | $1$ | `Pollution` |
| Persistent pollution in 1970 | $\mathtt{ppol70}$ | $1.36e8$ | `Pollution` |
| Year new policy is implemented | $\mathtt{pyear}$ | $1975$ | `NonRenewable` |
| Reproductive lifetime | $\mathtt{rlt}$ | $30$ | `Population` |
| Social adjustment delay | $\mathtt{sad}$ | $20$ | `Population` |
| `scor` before `pyear` | $\mathtt{scor1}$ | $1$ | `Capital` |
| `scor` after `pyear` | $\mathtt{scor2}$ | $1$ | `Capital` |
| Subsistence food per capita | $\mathtt{sfpc}$ | $230$ | `Population` |
| Technological development and implementation delay | $\mathtt{tdd}$ | $10$ | `Pollution` |
| Time when desired family size equals 2 children | $\mathtt{zpgt}$ | $4000$ | `NonRenewable` |

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
