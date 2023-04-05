---
title: 'WorldDynamics.jl: A Julia Package for Developing and Simulating Integrated Assessment Models'
tags:
  - Julia
  - Integrated Assessment Model
  - Modeling and Simulation
  - Scientific Computing
authors:
  - name: Pierluigi Crescenzi
    orcid: 0000-0001-8789-3195
    affiliation: "1,2" # (Multiple affiliations must be quoted)
  - name: Emanuele Natale
    orcid: 0000-0002-8755-3892
    #equal-contrib: true  (This is how you can denote equal contributions between multiple authors)
    affiliation: 2
  - name: Aurora Rossi
    orcid: 0009-0001-3302-0468
    corresponding: true # (This is how to denote the corresponding author)
    affiliation: 2
  - name: Paulo Bruno Serafim
    orcid: 0000-0002-5980-8149
    affiliation: 1

affiliations:
 - name: Gran Sasso Science Institute, L’Aquila, Italy
   index: 1
 - name: COATI, INRIA d’Université Côte d’Azur, Sophia Antipolis, France
   index: 2
date: 31/03/2023
bibliography: paper.bib
---

# Summary

\texttt{WorldDynamics.jl} is an open-source Julia package that provides a modern framework for developing, simulating, and investigating Integrated Assessment Models (in short, IAMs). IAMs are numerical models that estimate possible scenarios for the evolution of human society with respect to fundamental aspects such as capital investment, food production, natural resources, population size, and pollution, among others [@Parker2002].  The current version of the package implements the family of IAMs developed by the Club of Rome, which is a non-profit, informal organization of intellectuals and business leaders dedicated to the critical discussion of pressing global issues [@clubofrome2023]. In particular, the library includes Forrester's World1 and World2 models [@Forrester1970; @Forrester1973], the influential World3 model of Meadows et al [@Meadows1974], and its 1994 and 2003 updated versions [@Meadows2004]. These models are typically structured into several sectors, which are, in turn, composed of several differential-algebraic systems of equations (in short, DAEs): this modular structure makes it easy to manipulate the sectors individually and to combine different DAEs into a unique model (see **Figure 1**, which represents the structure of the World3 model). The package benefits from Julia's scientific computing ecosystem, in particular from the efficient solver implementations for various differential equations provided by the \texttt{DifferentialEquations.jl} package [@Rackauckas2017] and from the ability of the \texttt{ModelingToolkit.jl} package to compose differential-algebraic equations [@Ma2021]. \texttt{WorldDynamics.jl} provides also several support functions, which allowed us to convert the original systems of finite-difference equations into DAEs and to easily replicate all the plots included in the above-mentioned references (see, for example, **Figure 2**). It also allows the possibility of easily changing the parameter values and the systems of equations in order to simulate different scenarios. In other words, \texttt{WorldDynamics.jl} facilitates the use of advanced scientific computing approaches for both classical and new models.

# Statement of need
Predicting the evolution of human society is a challenging and pressing question that science has always tried to address. The development of IAMs has been a major step in this direction, and more recently the use of computers has revolutionized the way these models are developed. The World3 model is considered one of the most influential computer simulations of the world-wide socio-economic system ever made. After it, many other models have been proposed, such as the DICE model [@Nordhaus2018], originally proposed in 1992, and the most recent Earth4All model [@Dixson2022; @Randers2022]. However, most of these models are implemented by using proprietary software, so that, even if the model specification is open source, it is not possible to verify how the model itself is simulated since the implementation of the DAE solvers and of the functions used in the model description is not open source.  Moreover, these software usually contain a limited set of solvers and,  in general, they do not take advantage of modern approaches to scientific computing [@Cavana2021]. Therefore, our goal is to fulfill the need for a modern, open-source, flexible, and easy-to-use framework for IAMs that can be used to replicate and compare the results of existing models and to promote in-depth analysis of critical global issues, as well as a source of inspiration for the development of new models.

![The World3 model [@Meadows1974]. The model contains 5 sectors: agriculture (red), population (blue), pollution (green), non-renewable resources (violet), and capital (black). Each circle denotes a DAE and each connection indicates that a variable (labeling the connection) is defined in a DAE (the tail circle) and used in another DAE (the head circle).](images/world3.png)

# Functionality
\texttt{WorldDynamics.jl} comes with a tutorial which introduces the main functionalities of the package. In particular, the tutorial presents the following main features of \texttt{WorldDynamics.jl}.

- Replication of all the figures of the books describing the World1, World2, and World3 models.

- Execution of sensitivity analysis by modifying initial values of variables.

- Analysis of alternative scenarios obtained by modifying the parameters of a model or the interpolation tables (used to approximate non-linear functions by means of linear segments).

- Comparative analysis of performances and solutions obtained by different solvers.

- Implementation of all modules necessary to integrate a new model into the framework.

![An example of the reproduction of a figure 7-7, World 3 reference run, included in [@Meadows1974]. The colored curves, which are generated by our package, have been superimposed on the original plots of the book (dotted, dashed, and one-character curves).](images/fig_7_7.png)

# Related packages and implementations
Besides the official implementations on Vensim and Stella, which are two of the most popular system dynamics simulation environment, World2 and World3 have been repeatedly implemented in several different programming languages and simulation environments, such as Simulink and Modelica. Here, we mention some implementations of these models in three popular programming languages. In Python, there are several repositories whose code implements some of the IAMs proposed by the Club of Rome: in our opinion, the most complete description of the World2 and World3 models and of their implementation is given in [@Vanwynsberghe2021]. An implementation of World2 in R is described in [@Mignan2020], while an implementation of the same model in C++ is given in [@Hay2021]. In the Julia ecosystem, there are some IAMs implemented using the Mimi framework [\texttt{Mimi.jl}](https://www.mimiframework.org), such as the one included in [\texttt{MimiPAGE2009.jl}](https://github.com/anthofflab/MimiPAGE2009.jl), a package that implements a model for estimating the social cost of carbon emissions [@Moore2018]. [\texttt{ClimateMARGO.jl}](https://github.com/ClimateMARGO) is an idealized framework for optimizing climate control strategies implementing the MARGO model [@Drake2021].


# Future work
The current version of the package could be enhanced in various ways. The package will be extended in order to include other more recent IAMs, such as the Earth4All model [@Dixson2022]. Moreover, a wide range of tools available in the Julia ecosystem could be used to improve the quality of the models, such as the addition of global sensitivity analysis algorithms [@Dixit2022], the use of data-driven differential equations to automatically discover the models [@Martensen2021], and optimizing parameter values for some aspects of the models using the optimization package JuMP.jl [@Lubin2023].

# Acknowledgments
This work has been supported by the French government through the UCAJEDI and UCA DS4H "Investments in the Future" projects managed by the National Research Agency (ANR) with reference numbers ANR-15-IDEX-0001 and ANR-17-EURE-0004. 
This project has also been funded by the AAP2-2022 of the Laboratoire d'Informatique, Signaux et Systèmes de Sophia Antipolis (I3S) of the Université Côte d'Azur (UCA) and the authors are grateful to the OPAL infrastructure from Université Côte d'Azur for providing resources and support.
# References
