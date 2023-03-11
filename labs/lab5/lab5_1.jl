using Plots
using DifferentialEquations

a = -0.47
b = 0.021
c = 0.57
d = -0.044

T = (0.0, 60.0)
u0 = [12.0, 37.0]

function Func!(du, u, p, t)
    du[1] = a*u[1] + b*u[1]*u[2]
    du[2] = c*u[2] + d*u[1]*u[2]
end

prob = ODEProblem(Func!, u0, T)
sol = solve(prob, dtmax=0.05)

xx = []
yy = []
tt = sol.t

for u in sol.u
    x,y = u
    push!(xx, x)
    push!(yy, y)
end

plt = plot(layout=(1,2), dpi = 200, size =(1000, 500))
plot!(plt[1], tt, [xx, yy], color =[:green :red], xlabel="time", label = ["x(t)"  "y(t)"])
plot!(plt[2], xx, yy, color=:black)

savefig(plt, "lab-1-jl.png")