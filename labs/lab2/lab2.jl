# var 70
# len 25
# speedDif 6

#libs
using Plots
using DifferentialEquations

const len = 25
const speedDif = 6

# r1 = 25/(6+1) = 25/7
# r2 = 25/(6-1) = 25/5 = 5
const r1 = len/(speedDif + 1)
const r2 = len/(speedDif -1)

const t1 = (0, 2*pi)
const t2 = (-pi, pi)

function F(u, p, t)
    return u/ sqrt(speedDif*speedDif + 1)
end

#our problem
pr = ODEProblem(F, r1, t1)

#solve the problem
res = solve(pr, abstol=1e-8, reltol=1e-8)

R = rand(1:size(res.t)[1])
angs = [res.t[R] for i in 1:size(res.t)[1]]

#our plot 1
plot1 = plot(proj=:polar,
            aspect_ratio=:equal,
            dpi=1200,
            legend=true,
            bg=:white)

plot!(plot1,
    xlabel="theta",
    ylabel="r(t)",
    title="Chase curve",
    legend=:outerbottom)

plot!(plot1,
    [0.0,0.0],
    [len,r1],
    label="Start moving",
    color=:yellow,
    lw=0.2)
scatter!(
    plot1,
    [0.0],
    [len],
    label="",
    mc=:yellow,
    ms=0.2)

plot!(plot1,
    [angs[1],angs[2]],
    [0.0,res.u[size(res.u)[1]]],
    label="Way of boat",
    color=:red,
    lw=0.2)
scatter!(
    plot1,
    res.u,
    [len],
    label="",
    mc=:red,
    ms=0.005)

plot!(plot1,
    res.t,
    res.u,
    xlabel="theta",
    ylabel="r(t)",
    label="Way of launch",
    color=:blue,
    lw=0.2)
scatter!(
    plot1,
    res.u,
    [len],
    label="",
    mc=:blue,
    ms=0.005)

savefig(plot1, "lab2fig001.png")

#our problem
pr = ODEProblem(F, r2, t2)

#solve the problem
res = solve(pr, abstol=1e-6, reltol=1e-6)

R = rand(1:size(res.t)[1])
angs = [res.t[R] for i in 1:size(res.t)[1]]

#our plot 2
plot2 = plot(proj=:polar,
            aspect_ratio=:equal,
            dpi=1200,
            legend=true,
            bg=:white)

plot!(plot2,
    xlabel="theta",
    ylabel="r(t)",
    title="Chase curve",
    legend=:outerbottom)

plot!(plot2,
    [0.0,0.0],
    [len,r1],
    label="Start moving",
    color=:yellow,
    lw=0.2)
scatter!(
    plot1,
    [0.0],
    [len],
    label="",
    mc=:yellow,
    ms=0.2)

plot!(plot2,
    [angs[1],angs[2]],
    [0.0,res.u[size(res.u)[1]]],
    label="Way of boat",
    color=:red,
    lw=0.2)
scatter!(
    plot2,
    res.u,
    [len],
    label="",
    mc=:red,
    ms=0.005)

plot!(plot2,
    res.t,
    res.u,
    xlabel="theta",
    ylabel="r(t)",
    label="Way of launch",
    color=:blue,
    lw=0.2)
scatter!(
    plot2,
    res.u,
    [len],
    label="",
    mc=:blue,
    ms=0.005)

savefig(plot2, "lab2fig002.png")
