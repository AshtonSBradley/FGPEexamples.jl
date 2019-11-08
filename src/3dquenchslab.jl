
using FourierGPE

#--- parameters
L = (30.,30.,8.)
N = (128,128,32)
sim = Sim(L,N)
@unpack_Sim sim;


#--- Initialize simulation
γ = 0.05
μ = 25.0
tf = 2.5/γ
Nt = 200
t = LinRange(0.,tf,Nt)

# potential
import FourierGPE.V
V(x,y,z,t) = 4*z^2


#--- random initial state
x,y,z = X
ψi = randn(N)+im*randn(N)
ϕi = kspace(ψi,sim)

@pack_Sim! sim;

#--- Evolve in k space
@time sol = runsim(sim); # will take a few minutes to run.

#--- Density isosurface
using Makie, AbstractPlotting

function dense(phi)
    ψm = xspace(phi,sim)
    density = abs2.(ψm)
    pmax = maximum(density)
    return density/pmax
end

function densityfilm(sol,Nt;file="3dquenchtrap.gif")
    saveto=joinpath("media",file)
    scene = Scene()
    tindex = Node(1)
    scene = volume(lift(i -> dense(sol[i]), tindex),
    algorithm = :iso,
    color = (:mediumseagreen,0.25),
    show_axis=false,
    isovalue=3f0(.15))

    R = 210
    eyeat = Vec3f0(R,R,0)
    lookat = Vec3f0(0,0,-50)

    record(scene, saveto, 1:Nt) do i
        update_cam!(scene, eyeat, lookat)
        rotate_cam!(scene, 0., -0.4, 0.)
        tindex[] = i
    end
    p = scene[end];
    return
end

p = densityfilm(sol,Nt,file="3dquenchslab3.gif")
