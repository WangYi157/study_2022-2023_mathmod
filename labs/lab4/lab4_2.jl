#variant 70
using Plots 
using DifferentialEquations

T = (0, 31)
u0 = [2, -0.2]
omega = 1
thetta = 17

function Func!(du, u, t, p)
    x, y = u
    du[1] = u[2]
    du[2] = -thetta*u[2] - omega*u[1]
end

pr = ODEProblem(Func!, u0, T)
sol = solve(pr, dtmax=0.05)

xx = [u[1] for u in sol.u]
yy = [u[2] for u in sol.u]
tt = sol.t

plt = plot( layout = (1,2), dpi = 200, legend = false)
plot!(plt[1], tt, [xx, yy], title = "Decision", color = [:red :blue])
plot!(plt[2], xx, yy, title = "Phase portrait", color =:red)
savefig(plt, "lab4_2.png")