# FGPEexamples.jl
Simple examples of using the [FourierGPE](https://github.com/AshtonSBradley/FourierGPE.jl) library for solving the Gross-Piteavskii equation in julia.

Some of the larger media files are not tracked by this repository. To run them locally, first 

```julia
using Pkg;pkg"add https://github.com/AshtonSBradley/FGPEexamples.jl"
```

then edit `/src/weaveall.jl` to choose which examples to run (by defaults runs all in `flist`, will take ~15 minutes), and which output to generate (`html` by default, but also `.pdf`, `.ipynb` can be enabled). Note you will also need to remove some `eval=false` statements to make compute-intesive cells evaluate. 

Then either

```julia
using FGPEexamples
```

or from the repo directory

```julia
include("./src/weaveall.jl")
```

The chosen output  will be generated in the `docs` directory.

## Bright soliton

The bright soliton is an eigenstate of the GPE with attractive interactions.

The [bright soliton example](https://ashtonsbradley.github.io/FGPEexamples.jl/html/1dbrightsoliton.html) thus provides a simple test of periodicity for a Fourier method, and that the dispersion and interactions balance correctly.

<img src="/media/brightsoliton.gif" width="600">

## Dark Soliton

A dark soliton is a non-trivial solution of the Gross-Piteavskii equation involving a localized density dip, and associated phase jump.
A moving dark soliton has depth related to its velocity. When the depth drops to zero, the velocity vanishes.

If we phase and density imprint a dark soliton onto a BEC in a harmonic trap, the soliton position undergoes simple harmonic motion.

In the [dark soliton example](https://ashtonsbradley.github.io/FGPEexamples.jl/html/1dharmonic.html) we find a ground state of a harmonic trap and the imprint a dark soliton in the trap center, observing simple harmonic motion:

<img src="/media/darksoliton.gif" width="500">

## Vortex precession in a 2D harmonic trap

A quantum vortex will precess at a frequency that is known analytically providing a simple test of both GPE evolution and vortex imprinting methods.

In the [vortex precession example](https://ashtonsbradley.github.io/FGPEexamples.jl/html/2dharmonic.html) we find a ground state, imprint a vortex, evolve in real time:

<img src="/media/vortex.gif" width="500">

The frequency compares well with the analytical result.

## Quench in a 3D periodic box
The same code will generate 3D, 2D, 1D systems (n-D is also available).

Here a [3D quench from random initial conditions](https://ashtonsbradley.github.io/FGPEexamples.jl/html/3dquenchiso.html) exhibits proliferation of vortices at short times giving way to eventual relaxation to the quiescent ground state.

<img src="/media/3dquenchiso.gif" width="600">

## Quench in a 3D harmonic trap

More experimentally relevant, a [quench in an oblate 3D parabolic trap](https://ashtonsbradley.github.io/FGPEexamples.jl/html/3dquenchtrap.html) nucleates a quantum vortices preferentially aligned with the tight axis that eventually decay due to dissipation by migrating to the outer superfluid boundary. Physically, the dissipation is modelling coupling to a thermal cloud at rest in the laboratory frame. We can also observe the formation of a higher energy vortex aligned along the weak axis that damps out on a much shorter timescale.

<img src="/media/3dquenchtrap.gif" width="600">


## Quench in 3D into planar confinement

A [3D quench into planar confinement](https://ashtonsbradley.github.io/FGPEexamples.jl/html/3dquenchslab.html) shows some of the rich dynamics as vortices are nucleated, interact with each other and with phonons, and decay. Download this repository and run the examples to see the Kibble-Zurek mechanism in action!

<img src="/media/3dquenchslab.gif" width="700">


## Quench in 3D into tube confinement

A [3D quench into tube confinement](https://ashtonsbradley.github.io/FGPEexamples.jl/html/3dquenchtube.html) reveals how much more fragile the lower dimensional excitations are. Without the topological stability of vortices, dark solitons are free to decay. The stable remnant of the phase transition in this case is a persistent current. 

<img src="/media/3dquenchtube.gif" width="700">
