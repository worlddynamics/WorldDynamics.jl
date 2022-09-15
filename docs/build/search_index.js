var documenterSearchIndex = {"docs":
[{"location":"source/#Source-code-documentation","page":"Source code documentation","title":"Source code documentation","text":"","category":"section"},{"location":"source/#WorldDynamics-constants","page":"Source code documentation","title":"WorldDynamics constants","text":"","category":"section"},{"location":"source/","page":"Source code documentation","title":"Source code documentation","text":"Modules = [WorldDynamics]\nOrder   = [:constant]","category":"page"},{"location":"source/#WorldDynamics-functions","page":"Source code documentation","title":"WorldDynamics functions","text":"","category":"section"},{"location":"source/#Functions-in-functions.jl","page":"Source code documentation","title":"Functions in functions.jl","text":"","category":"section"},{"location":"source/","page":"Source code documentation","title":"Source code documentation","text":"This functions correspond to DYNAMO functions used in the World3 model.","category":"page"},{"location":"source/","page":"Source code documentation","title":"Source code documentation","text":"Modules = [WorldDynamics]\nOrder   = [:function]\nPages   = [\"functions.jl\"]","category":"page"},{"location":"source/#Main.WorldDynamics.clip-NTuple{4, Any}","page":"Source code documentation","title":"Main.WorldDynamics.clip","text":"clip(f1, f2, va, th)\n\nReturn f1 if the value v is greater than the threshold th, f2 otherwise. This function correspond to the CLIP (also called FIFGE) function in the DYNAMO language. \n\n\n\n\n\n","category":"method"},{"location":"source/#Main.WorldDynamics.interpolate-Tuple{Any, Any, Any}","page":"Source code documentation","title":"Main.WorldDynamics.interpolate","text":"interpolate(x, y, xs)\n\nReturn the value of a function with input x, by linearly interpolating the function itself through the table y and the range xs. If x is out of the range, the value at the corresponding extremity is returned. This function correspond to the TABHL function in the DYNAMO language. This latter function receives a table (that is, y), a value (that is, x), a left and a right extreme of an interval (that is, xs), and an increment value.  \n\n\n\n\n\n","category":"method"},{"location":"source/#Main.WorldDynamics.max-Tuple{Any, Any}","page":"Source code documentation","title":"Main.WorldDynamics.max","text":"max(v1, v2)\n\nReturn the maximum between v1 and v2. This function correspond to the MAX function in the DYNAMO language.\n\n\n\n\n\n","category":"method"},{"location":"source/#Main.WorldDynamics.min-Tuple{Any, Any}","page":"Source code documentation","title":"Main.WorldDynamics.min","text":"min(v1, v2)\n\nReturn the minimum between v1 and v2. This function correspond to the MIN function in the DYNAMO language.\n\n\n\n\n\n","category":"method"},{"location":"source/#Main.WorldDynamics.step-Tuple{Any, Any, Any}","page":"Source code documentation","title":"Main.WorldDynamics.step","text":"step(t, hght, sttm)\n\nReturn 0 if the value t is smaller than the threshold sttm, hght otherwise. This function correspond to the STEP function in the DYNAMO language.\n\n\n\n\n\n","category":"method"},{"location":"source/#Main.WorldDynamics.switch-Tuple{Any, Any, Any}","page":"Source code documentation","title":"Main.WorldDynamics.switch","text":"switch(v1, v2, z)\n\nReturn v1 if the value z is approximately 0 with tolerance 1e-16, v2 otherwise. This function correspond to the SWITCH (also called FIFZE) function in the DYNAMO language. \n\n\n\n\n\n","category":"method"},{"location":"source/#Functions-in-plotvariables.jl","page":"Source code documentation","title":"Functions in plotvariables.jl","text":"","category":"section"},{"location":"source/","page":"Source code documentation","title":"Source code documentation","text":"Modules = [WorldDynamics]\nOrder   = [:function]\nPages   = [\"plotvariables.jl\"]","category":"page"},{"location":"source/#Functions-in-solvesystems.jl","page":"Source code documentation","title":"Functions in solvesystems.jl","text":"","category":"section"},{"location":"source/","page":"Source code documentation","title":"Source code documentation","text":"Modules = [WorldDynamics]\nOrder   = [:function]\nPages   = [\"solvesystems.jl\"]","category":"page"},{"location":"world3/#World-3-equations-and-constants","page":"World3 equations and constants","title":"World 3 equations and constants","text":"","category":"section"},{"location":"world3/","page":"World3 equations and constants","title":"World3 equations and constants","text":"The pdf page is given by the book page + 16.   For the definitions, see Appendix B: Definition File at page 587 of [Dynamics of growth in a finite world][DGFW]. ","category":"page"},{"location":"world3/#Equations","page":"World3 equations and constants","title":"Equations","text":"","category":"section"},{"location":"world3/","page":"World3 equations and constants","title":"World3 equations and constants","text":"Name Definition Reference Notes\nPopulation fracdmathttpopdt=mathttb-mathttd lines 1-3, page 167 \nDeaths per year mathttd=fracmathttpopmathttle line 4, page 167 mathttdr in our code\nCrude death rate mathttcdr=1000timesfracmathttdmathttpop line 5, page 167 \nLife expectancy mathttle=mathttlentimesmathttlmftimesmathttlmhstimesmathttlmptimesmathttlmc lines 6-7, page 167 \n5 mathttlmf=mathitinterpolateleft(fracmathttfpcmathttsfpcright) lines 8-10, page 167 \n6 mathtthsapc=mathitinterpolateleft(mathttsopcright) lines 11-12, page 167 \n7 fracdmathttehspcdt=fracmathtthsapc-mathttehspcmathtthsid lines 13-14, page 167 \n8 $ \\mathtt{lmhs}=clip(\\mathtt{lmhs2},\\mathtt{lmhs1},t,\\mathtt{iphst}) $ lines 15-16, page 167 \n9 mathttlmhs1=mathitinterpolate(mathttehspc) lines 17-18, page 167 \n10 mathttlmhs2=mathitinterpolate(mathttehspc) lines 19-20, page 167 \n11 mathttfpu=mathitinterpolate(mathttpop) lines 21-22, page 167 \n12 mathttcmi=mathitinterpolate(mathttiopc) lines 23-24, page 167 \n13 mathttlmc=1-mathttcmitimesmathttfpu line 25, page 167 \n14 mathttlmp=mathitinterpolate(mathttppolx) lines 26-27, page 167 \nBirths per year $ \\mathtt{b}=clip(\\mathtt{d},\\mathtt{tf}\\times\\mathtt{pop}\\times\\mathtt{ffw}/\\mathtt{rlt},t,\\mathtt{pet}) $ lines 28-31, page 168 mathttbr in our code\n16 mathttcbr=1000timesfracmathttbmathttpop line 32, page 168 \n17 mathttlmp=mathitmin(mathttmtf mathttmtftimes(1-mathttfce)+mathttdtftimesmathttfce) line 33, page 168 \n18 mathttmtf=mathttmtfntimesmathttfm lines 34-35, page 168 \n19 mathttfm=mathitinterpolate(mathttle) lines 36-37, page 168 \n20 mathttdtf=mathttdcfstimesmathttcmple lines 38, page 168 \n21 mathttcmple=mathitinterpolate(mathttple) lines 39-40, page 168 \n22.1 fracdmathttpledt=3timesfracmathttple2-mathttplemathttlpd lines 41-42, page 168 \n2nd lev. delay eq. for mathttple fracdmathttple1dt=3timesfracmathttle-mathttple1mathttlpd lines 41-42, page 168 \n2nd lev. delay eq. for mathttple fracdmathttple2dt=3timesfracmathttple1-mathttple2mathttlpd lines 41-42, page 168 \n23 $ \\mathtt{dcfs}=clip(2,\\mathtt{dcfsn}\\times\\mathtt{frsn}\\times\\mathtt{sfsn},t,\\mathtt{zpgt}) $ lines 43-45, page 168 \n24 mathttsfsn=mathitinterpolate(mathttdiopc) lines 46-47, page 168 \n25.1 fracdmathttdiopcdt=3timesfracmathttdiopc2-mathttdiopcmathttsad lines 48-49, page 168 \n25.2 fracdmathttdiopc2dt=3timesfracmathttdiopc1-mathttdiopc2mathttsad lines 48-49, page 168 \n25.3 fracdmathttdiopc1dt=3timesfracmathttiopc-mathttdiopc1mathttsad lines 48-49, page 168 \n26 mathttfrsn=mathitinterpolate(mathttfie) lines 50-52, page 168 \n27 mathttfie=(mathttiopc-mathttaiopc)mathttaiopc line 53, page 168 \n28 fracdmathttaiopcdt=fracmathttiopc-mathttaiopcmathttieat lines 54-55, page 168 \n29 mathttnfc=fracmathttmtfmathttdtf-1 line 56, page 168 \n30 $ \\mathtt{fce}=clip(1,\\mathit{interpolate}(\\mathtt{fcfpc}),t,\\mathtt{fcest}) $ lines 57-59, page 168 \n31.1 fracdmathttfcfpcdt=3timesfracmathttfcfpc2-mathttfcfpcmathtthsid line 60, page 168 \n31.2 fracdmathttfcfpc2dt=3timesfracmathttfcfpc1-mathttfcfpc2mathtthsid line 60, page 168 \n31.3 fracdmathttfcfpc1dt=3timesfracmathttfcapc-mathttfcfpc1mathtthsid line 60, page 168 \n32 mathttfcapc=mathttfsafctimesmathttsopc line 61, page 168 \n33 mathttfsafc=mathitinterpolate(mathttnfc) lines 62-63, page 168 \n34 mathttiopc=07e11times e^mathttlttimes0037mathttpop lines 64-72, page 168 \n35 mathttppolx=10 lines 73-75, page 168 \n36 mathttsopc=15e11times e^mathttlttimes0030mathttpop lines 76-82, page 168 \n37 mathttfpc=4e11times e^mathttlttimes0020mathttpop lines 83-89, page 168 ","category":"page"},{"location":"world3/#Initializations","page":"World3 equations and constants","title":"Initializations","text":"","category":"section"},{"location":"world3/","page":"World3 equations and constants","title":"World3 equations and constants","text":"Name Initialization\nPopulation mathttpop(0)=161e9\nEffective health services per capita mathttehspc(0)=mathtthsapc(0)\nPerceived life expectancy mathttple(0) = mathttle(0)\n mathttple1(0) = mathttle(0)\n mathttple2(0) = mathttle(0)\nDelayed industrial out mathttdiopc(0) = mathttiopc(0)\n mathttdiopc2(0) = mathttiopc(0)\n mathttdiopc1(0) = mathttiopc(0)\n mathttfrsn(0)=082\n mathttaiopc(0) = mathttiopc(0)\n mathttfcfpc(0) = mathttfcapc(0)\n mathttfcfpc2(0) = mathttfcapc(0)\n mathttfcfpc1(0) = mathttfcapc(0)","category":"page"},{"location":"world3/#Variable/ODE-system-correspondance","page":"World3 equations and constants","title":"Variable/ODE system correspondance","text":"","category":"section"},{"location":"world3/","page":"World3 equations and constants","title":"World3 equations and constants","text":"# Variable Main ODE system Other ODE systems # ODE systems\n1 pop Pop4.population Agriculture.land_development, Agriculture.land_erosion_urban_industrial_use, Capital.industrial_subsector, Capital.service_subsector, NonRenewable.non_renewable, Pollution.persistent_pollution, Pop4.birth_rate, Pop4.death_rate 9\n2 p1 Pop4.population  1\n3 p2 Pop4.population Capital.job_subsector 2\n4 p3 Pop4.population Capital.job_subsector 2\n5 p4 Pop4.population  1\n6 d1 Pop4.population  1\n7 d2 Pop4.population  1\n8 d3 Pop4.population  1\n9 d4 Pop4.population  1\n10 m1 Pop4.population  1\n11 m2 Pop4.population  1\n12 m3 Pop4.population  1\n13 m4 Pop4.population  1\n14 mat1 Pop4.population  1\n15 mat2 Pop4.population  1\n16 mat3 Pop4.population  1\n17 dr Pop4.death_rate Pop4.population 2\n18 cdr Pop4.death_rate  1\n19 le Pop4.death_rate Pop4.birth_rate,Pop4.population 3\n20 lmf Pop4.death_rate  1\n21 hsapc Pop4.death_rate  1\n22 ehspc Pop4.death_rate  1\n23 lmhs Pop4.death_rate  1\n24 lmhs1 Pop4.death_rate  1\n25 lmhs2 Pop4.death_rate  1\n26 fpu Pop4.death_rate  1\n27 cmi Pop4.death_rate  1\n28 lmc Pop4.death_rate  1\n29 lmp Pop4.death_rate  1\n30 br Pop4.birth_rate Pop4.population 2\n31 cbr Pop4. birth_rate  1\n32 tf Pop4.birth_rate Pop4.population 2\n33 mtf Pop4.birth_rate  1\n34 fm Pop4.birth_rate  1\n35 dtf Pop4.birth_rate  1\n36 cmple Pop4.birth_rate  1\n37 ple Pop4.birth_rate  1\n ple1 Pop4.birth_rate  1\n ple2 Pop4.birth_rate  1\n38 dcfs Pop4.birth_rate  1\n39 sfsn Pop4.birth_rate  1\n40 diopc Pop4.birth_rate  1\n diopc1 Pop4.birth_rate  1\n diopc2 Pop4.birth_rate  1\n41 frsn Pop4.birth_rate  1\n42 fie Pop4.birth_rate  1\n43 aiopc Pop4.birth_rate  1\n44 nfc Pop4.birth_rate  1\n45 fce Pop4.birth_rate  1\n46 fcfpc Pop4.birth_rate  1\n fcfpc1 Pop4.birth_rate  1\n fcfpc2 Pop4.birth_rate  1\n47 fcapc Pop4.birth_rate  1\n48 fsafc Pop4.birth_rate  1\n49 iopc Capital.industrial_subsector Agriculture.land_development, Agriculture.land_erosion_urban_industrial_use, Capital.job_subsector, Capital.service_subsector, NonRenewable.non_renewable, Pop4.birth_rate, Pop4.death_rate 8\n50 io Capital.industrial_subsector Agriculture.agricultural_inputs, Agriculture.land_development, Capital.service_subsector, SupplementaryEquations.supplementary_equations 5\n51 icor Capital.industrial_subsector  1\n52 ic Capital.industrial_subsector Capital.job_subsector 2\n53 icdr Capital.industrial_subsector  1\n54 alic Capital.industrial_subsector  1\n55 icir Capital.industrial_subsector  1\n56 fioai Capital.industrial_subsector  1\n57 fioac Capital.industrial_subsector  1\n58 fioacc Capital.industrial_subsector  1\n59 fioacv Capital.industrial_subsector  1\n60 isopc Capital.service_subsector  1\n61 isopc1 Capital.service_subsector  1\n62 isopc2 Capital.service_subsector  1\n63 fioas Capital.service_subsector Capital.industrial_subsector 2\n64 fioas1 Capital.service_subsector  1\n65 fioas2 Capital.service_subsector  1\n66 scir Capital.service_subsector  1\n67 sc Capital.service_subsector Capital.job_subsector 2\n68 scdr Capital.service_subsector  1\n69 alsc Capital.service_subsector  1\n70 so Capital.service_subsector SupplementaryEquations.supplementary_equations 2\n71 sopc Capital.service_subsector Capital.job_subsector, Pop4.birth_rate, Pop4.death_rate 4\n72 scor Capital.service_subsector  1\n73 j Capital.job_subsector  1\n74 pjis Capital.job_subsector  1\n75 jpicu Capital.job_subsector  1\n76 pjss Capital.job_subsector  1\n77 jpscu Capital.job_subsector  1\n78 pjas Capital.job_subsector  1\n79 jph Capital.job_subsector  1\n80 lf Capital.job_subsector  1\n81 luf Capital.job_subsector  1\n82 lufd Capital.job_subsector  1\n83 cuf Capital.job_subsector Capital.industrial_subsector, Capital.service_subsector 3\n84 lfc Agriculture.land_development  1\n85 al Agriculture.land_development Agriculture.agricultural_inputs, Agriculture.land_erosion_urban_industrial_use, Capital.job_subsector, Pollution.persistent_pollution 5\n86 pal Agriculture.land_development  1\n87 f Agriculture.land_development SupplementaryEquations.supplementary_equations 2\n88 fpc Agriculture.land_development Agriculture.discontinung_land_maintenance, Pop4.death_rate 3\n89 ifpc Agriculture.land_development  1\n90 ifpc1 Agriculture.land_development  1\n91 ifpc2 Agriculture.land_development  1\n92 tai Agriculture.land_development Agriculture.agricultural_inputs 2\n93 fioaa Agriculture.land_development Capital.industrial_subsector 2\n94 fioaa1 Agriculture.land_development  1\n95 fioaa2 Agriculture.land_development  1\n96 ldr Agriculture.land_development  1\n97 dcph Agriculture.land_development Agriculture.investment_allocation_decision 2\n98 cai Agriculture.agricultural_inputs  1\n99 ai Agriculture.agricultural_inputs  1\n100 alai Agriculture.agricultural_inputs Agriculture.investment_allocation_decision 2\n101 aiph Agriculture.agricultural_inputs Agriculture.investment_allocation_decision, Capital.job_subsector, Pollution.persistent_pollution 4\n102 lymc Agriculture.agricultural_inputs Agriculture.investment_allocation_decision 2\n103 ly Agriculture.agricultural_inputs Agriculture.investment_allocation_decision, Agriculture.land_development, Agriculture.land_erosion_urban_industrial_use 4\n104 lyf Agriculture.agricultural_inputs  1\n105 lymap Agriculture.agricultural_inputs  1\n106 lymap1 Agriculture.agricultural_inputs  1\n107 lymap2 Agriculture.agricultural_inputs  1\n108 fiald Agriculture.agricultural_inputs Agriculture.investment_allocation_decision , Agriculture.land_development 3\n109 mpld Agriculture.investment_allocation_decision  1\n110 mpai Agriculture.investment_allocation_decision  1\n111 mlymc Agriculture.investment_allocation_decision  1\n112 all Agriculture.land_erosion_urban_industrial_use  1\n113 llmy Agriculture.land_erosion_urban_industrial_use  1\n114 llmy1 Agriculture.land_erosion_urban_industrial_use  1\n115 llmy2 Agriculture.land_erosion_urban_industrial_use  1\n116 ler Agriculture.land_erosion_urban_industrial_use Agriculture.land_development 2\n117 uilpc Agriculture.land_erosion_urban_industrial_use  1\n118 uilr Agriculture.land_erosion_urban_industrial_use  1\n119 lrui Agriculture.land_erosion_urban_industrial_use Agriculture.land_development 2\n120 uil Agriculture.land_erosion_urban_industrial_use  1\n121 lfert Agriculture.land_fertility_degradation Agriculture.agricultural_inputs, Agriculture.land_fertility_regeneration 3\n122 lfdr Agriculture.land_fertility_degradation  1\n123 lfd Agriculture.land_fertility_degradation  1\n124 lfr Agriculture.land_fertility_regeneration Agriculture.land_fertility_degradation 2\n125 lfrt Agriculture.land_fertility_regeneration  1\n126 falm Agriculture.discontinuing_land_maintenance Agriculture.agricultural_inputs, Agriculture.land_fertility_regeneration 3\n127 fr Agriculture.discontinuing_land_maintenance  1\n128 pfr Agriculture.discontinuing_land_maintenance  1\n129 nr NonRenewable.non_renewable  1\n130 nrur NonRenewable.non_renewable  1\n131 nruf NonRenewable.non_renewable  1\n132 pcrum NonRenewable.non_renewable Pollution.persistent_pollution 2\n133 nrfr NonRenewable.non_renewable  1\n134 fcaor NonRenewable.non_renewable Capital.industrial_subsector 2\n135 fcaor1 NonRenewable.non_renewable  1\n136 fcaor2 NonRenewable.non_renewable  1\n137 ppgr Pollution.persistent_pollution  1\n138 ppgf Pollution.persistent_pollution  1\n ppgf2 Pollution.persistent_pollution  1\n ppgf22 Pollution.persistent_pollution Pollution.adaptive_technological_control_cards 2\n139 ppgio Pollution.persistent_pollution  1\n140 ppgao Pollution.persistent_pollution  1\n141 ppapr Pollution.persistent_pollution  1\n ppapr1 Pollution.persistent_pollution  1\n ppapr2 Pollution.persistent_pollution  1\n ppapr3 Pollution.persistent_pollution  1\n pptd Pollution.persistent_pollution  1\n142 ppol Pollution.persistent_pollution  1\n143 ppolx Pollution.persistent_pollution Agriculture.land_fertility_degradation, Pollution.pollution_damage, Pop4.death_rate 4\n144 ppasr Pollution.persistent_pollution  1\n145 ahlm Pollution.persistent_pollution  1\n146 ahl Pollution.persistent_pollution  1\n ppgf221 Pollution.adaptive_technological_control_cards  1\n ppgf222 Pollution.adaptive_technological_control_cards  1\n pcti Pollution.adaptive_technological_control_cards  1\n plmp Pollution.adaptive_technological_control_cards  1\n plmp1 Pollution.adaptive_technological_control_cards  1\n plmp2 Pollution.adaptive_technological_control_cards  1\n pctcm Pollution.adaptive_technological_control_cards  1\n pctir Pollution.adaptive_technological_control_cards  1\n lmp Pollution.pollution_damage Pollution.adaptive_technological_control_cards 2\n lmp1 Pollution.pollution_damage  1\n lmp2 Pollution.pollution_damage  1\n lfdr Pollution.pollution_damage  1\n lfdr1 Pollution.pollution_damage  1\n lfdr2 Pollution.pollution_damage  1\n147 foa SupplementaryEquations.supplementary_equations  1\n148 foi SupplementaryEquations.supplementary_equations  1\n149 fos SupplementaryEquations.supplementary_equations  1","category":"page"},{"location":"world3/#Constants","page":"World3 equations and constants","title":"Constants","text":"","category":"section"},{"location":"world3/","page":"World3 equations and constants","title":"World3 equations and constants","text":"To be copied from parameters.jl.","category":"page"},{"location":"#Table-of-contents","page":"Table of contents","title":"Table of contents","text":"","category":"section"},{"location":"","page":"Table of contents","title":"Table of contents","text":"Pages = [\"tutorial.md\", \"world3.md\", \"source.md\"]\nDepth = 6","category":"page"},{"location":"#Index-of-functions","page":"Table of contents","title":"Index of functions","text":"","category":"section"},{"location":"","page":"Table of contents","title":"Table of contents","text":"Pages   = [\"source.md\"]\nModules = [WorldDynamics]\nOrder   = [:function]","category":"page"},{"location":"tutorial/#A-WorldDynamics-tutorial","page":"WorldDynamics tutorial","title":"A WorldDynamics tutorial","text":"","category":"section"},{"location":"tutorial/#Replicating-historical-runs","page":"WorldDynamics tutorial","title":"Replicating historical runs","text":"","category":"section"},{"location":"tutorial/","page":"WorldDynamics tutorial","title":"WorldDynamics tutorial","text":"We first have to solve the ODE system, which is constructed in the world3_historicalrun function, included in the world3_historicalrun.jl code file. This ODE system is the one described in the book Dynamics of Growth in a Finite World (1974), and used in Chapter 7 of the book itself.","category":"page"},{"location":"tutorial/","page":"WorldDynamics tutorial","title":"WorldDynamics tutorial","text":"using WorldDynamics\ninclude(\"examples/scenarios/world3_historicalrun.jl\")\nsystem = world3_historicalrun()\nsol = WorldDynamics.solve(system, (1900, 2100))","category":"page"},{"location":"tutorial/","page":"WorldDynamics tutorial","title":"WorldDynamics tutorial","text":"We then have to define the variables that we want to plot. For example, Figure 7-2 of the above book shows the plot of eleven variables in the population sector of the model. In order to easily access to these variables, we first create shortcuts to the subsectors in which they are introduced.","category":"page"},{"location":"tutorial/","page":"WorldDynamics tutorial","title":"WorldDynamics tutorial","text":"@named pop = WorldDynamics.World3.Pop4.population()\n@named br = WorldDynamics.World3.Pop4.birth_rate()\n@named dr = WorldDynamics.World3.Pop4.death_rate()","category":"page"},{"location":"tutorial/","page":"WorldDynamics tutorial","title":"WorldDynamics tutorial","text":"The eleven variables are then defined as follows.","category":"page"},{"location":"tutorial/","page":"WorldDynamics tutorial","title":"WorldDynamics tutorial","text":"fig_7_2_variables = [\n    (pop.pop, 0, 4e9, \"pop\"),\n    (br.cbr, 0, 50, \"cbr\"),\n    (dr.cdr, 0, 50, \"cdr\"),\n    (dr.le, 0, 60, \"le\"),\n    (dr.lmf, 0.75, 1.75, \"lmf\"),\n    (dr.lmp, 0.75, 1.75, \"lmp\"),\n    (dr.lmhs, 0.75, 1.75, \"lmhs\"),\n    (dr.lmc, 0.75, 1.75, \"lmc\"),\n    (br.tf, 0, 8, \"tf\"),\n    (br.dtf, 0, 8, \"dtf\"),\n]\n@variables t","category":"page"},{"location":"tutorial/","page":"WorldDynamics tutorial","title":"WorldDynamics tutorial","text":"For each variable of the model, the above vector includes a quadruple, containing the Julia variable, its range, and its symbolic name to be shonw in the plot (the range and the symbolic name are optional). The time variable t has also to be declared.","category":"page"},{"location":"tutorial/","page":"WorldDynamics tutorial","title":"WorldDynamics tutorial","text":"Finally, we can plot the evolution of the model variables according to the previously computed solution.","category":"page"},{"location":"tutorial/","page":"WorldDynamics tutorial","title":"WorldDynamics tutorial","text":"plotvariables(sol, (t, 1900, 1970), fig_7_2_variables, name=\"Fig. 7-2\", showlegend=true, colored=true)","category":"page"},{"location":"tutorial/#Replicating-the-reference-behaviour","page":"WorldDynamics tutorial","title":"Replicating the reference behaviour","text":"","category":"section"},{"location":"tutorial/","page":"WorldDynamics tutorial","title":"WorldDynamics tutorial","text":"To replicate the figures in Section 7.3 of the above book, we can operate in a similar way by declaring the varibales to be plot and by changing the time range. For example the following code reproduce the plot of Figure 7-7.","category":"page"},{"location":"tutorial/","page":"WorldDynamics tutorial","title":"WorldDynamics tutorial","text":"@named pop = WorldDynamics.World3.Pop4.population()\n@named br = WorldDynamics.World3.Pop4.birth_rate()\n@named dr = WorldDynamics.World3.Pop4.death_rate()\n@named is = WorldDynamics.World3.Capital.industrial_subsector()\n@named ld = WorldDynamics.World3.Agriculture.land_development()\n@named nr = WorldDynamics.World3.NonRenewable.non_renewable()\n@named pp = WorldDynamics.World3.Pollution.persistent_pollution()\nreference_variables = [\n    (nr.nrfr, 0, 1, \"nrfr\"),\n    (is.iopc, 0, 1000, \"iopc\"),\n    (ld.fpc, 0, 1000, \"fpc\"),\n    (pop.pop, 0, 16e9, \"pop\"),\n    (pp.ppolx, 0, 32, \"ppolx\"),\n    (br.cbr, 0, 50, \"cbr\"),\n    (dr.cdr, 0, 50, \"cdr\"),\n]\n@variables t\nplotvariables(sol, (t, 1900, 2100), reference_variables, name=\"Fig. 7-7\", showlegend=true, colored=true)","category":"page"},{"location":"tutorial/#Replicating-the-sensitivity-tests","page":"WorldDynamics tutorial","title":"Replicating the sensitivity tests","text":"","category":"section"},{"location":"tutorial/","page":"WorldDynamics tutorial","title":"WorldDynamics tutorial","text":"In this case, we have to mdoify the parameter or the interpolation table of the varaible with respect to which we want to perform the sensistivity test, we have to solve agian the ODE system, and we can finally plot the resulting evolution of the system.","category":"page"},{"location":"tutorial/#Modifying-a-parameter","page":"WorldDynamics tutorial","title":"Modifying a parameter","text":"","category":"section"},{"location":"tutorial/","page":"WorldDynamics tutorial","title":"WorldDynamics tutorial","text":"In order to reproduce Figure 7-10, in which the nonrenewable resources initial value (that is, the value of the NRI parameter) is doubled, we can modify the value of this parameter by getting the parameter set of the nonrenewable resources sector, and by changing the value of NRI.","category":"page"},{"location":"tutorial/","page":"WorldDynamics tutorial","title":"WorldDynamics tutorial","text":"nonrenewable_parameters_7_10 = WorldDynamics.World3.NonRenewable.getparameters()\nnonrenewable_parameters_7_10[:nri] = 2.0 * nonrenewable_parameters_7_10[:nri]","category":"page"},{"location":"tutorial/","page":"WorldDynamics tutorial","title":"WorldDynamics tutorial","text":"We then have to solve again the ODE system, by specifying which set of paramer values has to be used for the nonrenewable resources sector.","category":"page"},{"location":"tutorial/","page":"WorldDynamics tutorial","title":"WorldDynamics tutorial","text":"system = world3_historicalrun(nonrenewable_params=nonrenewable_parameters_7_10)\nsol = WorldDynamics.solve(system, (1900, 2100))","category":"page"},{"location":"tutorial/","page":"WorldDynamics tutorial","title":"WorldDynamics tutorial","text":"Finally, we can plot the seven variables of Figure 7-10.","category":"page"},{"location":"tutorial/","page":"WorldDynamics tutorial","title":"WorldDynamics tutorial","text":"plotvariables(sol, (t, 1900, 2100), reference_variables, name=\"Fig. 7-10\", showlegend=true, colored=true)","category":"page"},{"location":"tutorial/#Modifying-an-interpolation-table","page":"WorldDynamics tutorial","title":"Modifying an interpolation table","text":"","category":"section"},{"location":"tutorial/","page":"WorldDynamics tutorial","title":"WorldDynamics tutorial","text":"In order to reproduce Figure 7-13, in which the slope of the fraction of industrial output allocated to agriculture is increased, we can modify the two tables FIOAA1 and FIOAA2 by getting the table set of the agriculture sector, and by changing the value of these two tables.","category":"page"},{"location":"tutorial/","page":"WorldDynamics tutorial","title":"WorldDynamics tutorial","text":"agriculture_tables_7_13 = WorldDynamics.World3.Agriculture.gettables()\nagriculture_tables_7_13[:fioaa1] = (0.5, 0.3, 0.1, 0.0, 0.0, 0.0)\nagriculture_tables_7_13[:fioaa2] = (0.5, 0.3, 0.1, 0.0, 0.0, 0.0)","category":"page"},{"location":"tutorial/","page":"WorldDynamics tutorial","title":"WorldDynamics tutorial","text":"We then have to solve again the ODE system, by specifying which set of tables has to be used for the agriculture sector.","category":"page"},{"location":"tutorial/","page":"WorldDynamics tutorial","title":"WorldDynamics tutorial","text":"system = world3_historicalrun(agriculture_tables=agriculture_tables_7_13)\nsol = WorldDynamics.solve(system, (1900, 2100))","category":"page"},{"location":"tutorial/","page":"WorldDynamics tutorial","title":"WorldDynamics tutorial","text":"Finally, we can plot the seven variables of Figure 7-10.","category":"page"},{"location":"tutorial/","page":"WorldDynamics tutorial","title":"WorldDynamics tutorial","text":"plotvariables(sol, (t, 1900, 2100), reference_variables, name=\"Fig. 7-13\", showlegend=true, colored=true)","category":"page"}]
}
