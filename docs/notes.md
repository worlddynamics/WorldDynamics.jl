## TODO

RAMP function (currently used in ppolx (not used, but will be used...)): 
How does it work?
# Implementation details

In the following [DUM] is the [Dynamo User's Manual][DUM], and [DGFW] is the book [Dynamics of growth in a finite world][DGFW].

## DYNAMO's idiosyncrasies

### On the time variable $t$
Time is assumed to start at $0$ unless specified otherwise. See Sec 2.3.6 (pag 26) of the [DUM].

### On the precision of plots in [DGFW]
Values are calculated every 5 years. 

### On initializations
It appears that DYNAMO is not able to infer certain variable initializations from the system equations (this should be further investigated in [DUM]).  
E.g. $\mathtt{frsn}$ is initialized to $0.82$ but its definining equation already provide a different value at time $0$. 

### On DYNAMO's syntax
The type `X` means that the previous line is continuing on this line. 



<!-- References -->
[DUM]: http://archive.org/details/dynamousersmanua00pugh "A. L. Pugh, DYNAMO user’s manual. 1963. Accessed: Nov. 17, 2021."
[DGFW]: http://archive.org/details/dynamicsofgrowth0000unse "Dynamics of growth in a finite world. Cambridge, Mass. : Wright-Allen Press, 1974. Accessed: Nov. 17, 2021."