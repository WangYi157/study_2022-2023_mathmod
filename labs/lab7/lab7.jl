using Plots
using DifferentialEquations

a1 = 0.895
a2 = 0.0000433

N = 1170
u0 = [7]

T1 = (0.0, 10.0)

function F!(du, u, p, t)
    du[1] = (a1 + a2*u[1])*(N - u[1])
end

p1 = ODEProblem(F!, u0, T1)
s1 = solve(p1)

plt1 = plot(s1, dpi = 150, size = (800, 400), xlabel = "time", ylabel = "n(t)")
savefig(plt1, "img_lab_71_lj.png")

a1 = 0.0000145
a2 = 0.295

T2 = (0.0, 0.02)

p2 = ODEProblem(F!, u0, T2)
s2 = solve(p2)

plt2 = plot(s2, dpi = 150, size = (800, 400), xlabel = "time", ylabel = "n(t)")
savefig(plt2, "img_lab_72_lj.png")

function Ft!(du, u, p, t)
    du[1] = (a1 * sin(t) + a2* cos(t) * u[1])*(N - u[1])
end

a1 = 0.196 
a2 = 0.699

T3 = (0.0, 0.1)

p3 = ODEProblem(Ft!, u0, T3)
s3 = solve(p3)

plt3 = plot(s3, dpi = 150, size = (800, 400), xlabel = "time", ylabel = "n(t)")
savefig(plt3, "img_lab_73_lj.png")




