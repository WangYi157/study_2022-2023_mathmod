using Plots
using DifferentialEquations

alfa = 0.7
betta = 0.3
T = (0.0, 30.0)
N = 14041
I0 = 131
R0 = 71
I_1 = 150
I_2 = 100
S0 = N - I0 - R0
u0 = [S0, I0, R0]

function F!(du, u, p, t)
    if u[2] > I_2
        du[1] = -alfa*u[1]
        du[2] = alfa*u[1] - betta*u[2]
    else 
        du[1] = 0
        du[2] = -betta*u[2]
    end
    du[3] = betta * u[2]
end 

pr1 = ODEProblem(F!, u0, T)
sol = solve(pr1, dtmax=0.2)

ss1 = []
ii1 = []
rr1 = []
tt1 = sol.t 

for u in sol.u 
    s, i, r = u
    push!(ss1, s)
    push!(ii1, i)
    push!(rr1, r)
end 

plt1 = plot(dpi=150, size = (800, 400))
plot!(plt1, tt1, [ss1, ii1, rr1], color = [:red :green :blue], xlabel="time", label = ["S(t)" "I(t)" "R(t)"])
savefig(plt1, "img2jl.png")
