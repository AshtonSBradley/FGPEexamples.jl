# FGPEexamples.jl 
Simple examples of using the [FourierGPE](https://github.com/AshtonSBradley/FourierGPE.jl) library for solving the Gross-Piteavskii equation in julia.

## Dark Soliton

A dark soliton is a non-trivial solution of the Gross-Piteavskii equation involving a localized density dip, and associated phase jump. 
For replusive interactions the soliton will be in general gray, with a velocity determined by the depth; When the depth drops to zero, the velocity vanishes. 

If we phase and density imprint a dark soliton onto a BEC in a harmonic trap, the soliton position undergoes simple harmonic motion.

[1d harmonic potential: imprinting a dark soliton](https://ashtonsbradley.github.io/FGPEexamples.jl/html/1dharmonic.html)

<img src="/media/soliton.gif" width="500" height="200"> 

## Quench in a 3D periodic box
The same code will generate 3D, 2D, 1D systems (n-D is also available).

Here a 3D quench from random initial conditions exhibits proliferation of vortices at short times giving way to eventual relaxation to the quiescent ground state.

<img src="/media/3dquenchiso.gif" width="600" height="350">

## Quench in a 3D harmonic trap

More experimentally relevant, a quench in an oblate 3D parabolic trap nucleates a quantum vortex aligned with the tight axis that eventually decays by migrating to the outer superfluid boundary. Physically, the dissipation is modelling coupling to a thermal cloud at rest in the laboratory frame. We can also observe the formation of a higher energy vortex aligned along the weak axis that damps out on a much shorter timescale.

<img src="/media/3dtrap.gif" width="600" height="350">
