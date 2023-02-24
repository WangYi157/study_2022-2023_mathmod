#variant 50
using Plots
using DifferentialEquations

x0 = 80000
y0 = 60000

a = -0.267
b = -0.687
c = -0.349
h = -0.491

P(t) = abs(sin(2*t))
Q(t) = abs(2*cos(t))

function F(du, u, p, t)
    x,y = u
    du[1] = a*u[1] + b*u[2] + P(t)
    du[2] = c*u[1]*u[2] + h*u[2] + Q(t)
end

u0 = [x0,y0]
tspan = (0.0, 0.002)
pr = ODEProblem(F, u0, tspan)
sol = solve(pr)

xx = [u[1] for u in sol.u]
yy = [u[2] for u in sol.u]
T = [t for t in sol.t]
plott = plot(dpi=500, title = "Combat model", legend=true)
plot!(plott, T, xx, label = "X army size", color=:brown)
plot!(plott, T, yy, label = "Y army size", color=:green)

savefig(plott, "lab3_2jl.png")