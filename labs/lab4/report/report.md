---
## Front matter
title: "Отчёт по лабораторной работе №4"
subtitle: "Модель гармонических колебаний"
author: "Ван И"

## Generic otions
lang: ru-RU
toc-title: "Содержание"

## Bibliography
bibliography: bib/cite.bib
csl: pandoc/csl/gost-r-7-0-5-2008-numeric.csl

## Pdf output format
toc: true # Table of contents
toc-depth: 2
lof: true # List of figures
lot: true # List of tables
fontsize: 12pt
linestretch: 1.5
papersize: a4
documentclass: scrreprt
## I18n polyglossia
polyglossia-lang:
  name: russian
  options:
	- spelling=modern
	- babelshorthands=true
polyglossia-otherlangs:
  name: english
## I18n babel
babel-lang: russian
babel-otherlangs: english
## Fonts
mainfont: PT Serif
romanfont: PT Serif
sansfont: PT Sans
monofont: PT Mono
mainfontoptions: Ligatures=TeX
romanfontoptions: Ligatures=TeX
sansfontoptions: Ligatures=TeX,Scale=MatchLowercase
monofontoptions: Scale=MatchLowercase,Scale=0.9
## Biblatex
biblatex: true
biblio-style: "gost-numeric"
biblatexoptions:
  - parentracker=true
  - backend=biber
  - hyperref=auto
  - language=auto
  - autolang=other*
  - citestyle=gost-numeric
## Pandoc-crossref LaTeX customization
figureTitle: "Рис."
tableTitle: "Таблица"
listingTitle: "Листинг"
lofTitle: "Список иллюстраций"
lotTitle: "Список таблиц"
lolTitle: "Листинги"
## Misc options
indent: true
header-includes:
  - \usepackage{indentfirst}
  - \usepackage{float} # keep figures where there are in the text
  - \floatplacement{figure}{H} # keep figures where there are in the text
---

# Подготовил
### Ван И 
### Группа НФИбд-02-20
### Студ. билет 1032198069

# Цель работы

Изучить уравнение гармонического осцилятора.

# Теоретическое введение
Движение грузика на пружинке, маятника, заряда в электрическом контуре, а
также эволюция во времени многих систем в физике, химии, биологии и других
науках при определенных предположениях можно описать одним и тем же
дифференциальным уравнением, которое в теории колебаний выступает в качестве
основной модели. Эта модель называется линейным гармоническим осциллятором. [@esystem-lab3]

Уравнение свободных колебаний гармонического осциллятора имеет следующий вид:
$$\ddot{x}+2\gamma\dot{x}+\omega_0^2=0$$

где $x$ - переменная, описывающая состояние системы (смещение грузика, заряд конденсатора и т.д.), $\gamma$ - параметр, характеризующий потери энергии (трение в механической системе, сопротивление в контуре), $\omega_0$ - собственная частота колебаний.
Это уравнение есть линейное однородное дифференциальное  уравнение второго порядка и оно является примером линейной динамической системы.

При отсутствии потерь в системе ( $\gamma=0$ ) получаем уравнение консервативного осциллятора энергия колебания которого сохраняется во времени.
$$\ddot{x}+\omega_0^2x=0$$

Для однозначной разрешимости уравнения второго порядка необходимо задать два начальных условия вида
 
$$
 \begin{cases}
	x(t_0)=x_0
	\\   
	\dot{x(t_0)}=y_0
 \end{cases}
$$

Уравнение второго порядка можно представить в виде системы двух уравнений первого порядка:

$$
 \begin{cases}
	x=y
	\\   
	y=-\omega_0^2x
 \end{cases}
$$

Начальные условия для системы примут вид:

$$
 \begin{cases}
	x(t_0)=x_0
	\\   
	y(t_0)=y_0
 \end{cases}
$$

Независимые	переменные	$x, y$	определяют	пространство,	в	котором «движется» решение. Это фазовое пространство системы, поскольку оно двумерно будем называть его фазовой плоскостью.
Значение фазовых координат $x, y$ в любой момент времени полностью определяет состояние системы. Решению уравнения движения как функции времени отвечает гладкая кривая в фазовой плоскости. Она называется фазовой траекторией. Если множество различных решений (соответствующих различным 
начальным условиям) изобразить на одной фазовой плоскости, возникает общая картина поведения системы. Такую картину, образованную набором фазовых траекторий, называют фазовым портретом.

# Задание

## Формулировка задания
 Вариант №70

Постройте фазовый портрет гармонического осциллятора [@ocszill] и решение уравнения
гармонического осциллятора для следующих случаев
1. Колебания гармонического осциллятора без затуханий и без действий внешней силы
$\ddot{x}+14.4x=0$
2. Колебания гармонического осциллятора c затуханием и без действий внешней силы
$\ddot{x}+17\dot{x}+x=0$
3. Колебания гармонического осциллятора c затуханием и под действием внешней силы
$\ddot{x}+15\dot{x}+x=0.7\sin{3t}$
На итнтервале $t \in [ 0;31 ]$, шаг 0.05, $x_0=2, y_0=-0.2$


# Выполнение лабораторной работы

1. Начинаем работу с OpenModelica, так как он быстрее работает. [@openmodelicaODE]
Для первого случая написали следующий код:
```
model lab4_1
parameter Real x0 = 2;
parameter Real y0 = -0.2;
parameter Real omega = 14.4;
Real x(start=x0);
Real y(start=y0);
equation
der(x) = y;
der(y) = -omega*x;
end lab4_1;
```
В симуляции получили сначала решение уравнения гармонического осциллятора (рис. @fig:001), и так же фазовый портрет (рис. @fig:002).

![Решение уравнения гармонического осциллятора первого уравнения](image/l4_11.png){#fig:001 width=70%}

![Фазовый портрет первого уравнения](image/l4_12.png){#fig:002 width=70%}

Далее написали код для второго случая:
```
model lab4_2
parameter Real x0 = 2;
parameter Real y0 = -0.2;
parameter Real omega = 1;
parameter Real thetta = 17;
Real x(start=x0);
Real y(start=y0);
equation
der(x) = y;
der(y) = -thetta*y - omega*x;
end lab4_2;
```
В результате получили так же решение уравнения гармонического осциллятора (рис. @fig:003), и фазовый портрет (рис. @fig:004).

![Решение уравнения гармонического осциллятора первого уравнения](image/l4_21.png){#fig:003 width=70%}

![Фазовый портрет первого уравнения](image/l4_22.png){#fig:004 width=70%}

Для третьего уравнения написали следующий код
```
model lab4_3
parameter Real x0 = 2;
parameter Real y0 = -0.2;
parameter Real omega = 1;
parameter Real thetta = 15;
Real x(start=x0);
Real y(start=y0);
equation
der(x) = y;
der(y) = -thetta*y - omega*x + 0.7 * sin(3*time);
end lab4_3;
```
В результате получили сначала решение уравнения гармонического осциллятора (рис. @fig:005), и так же фазовый портрет (рис. @fig:006).

![Решение уравнения гармонического осциллятора первого уравнения](image/l4_31.png){#fig:005 width=70%}

![Фазовый портрет первого уравнения](image/l4_32.png){#fig:006 width=70%}

2. Далее пишем код на языке Julia [@juliaODE]. Код программы для первого уравнения выглядит следующим образом:
```julia
#variant 70
using Plots 
using DifferentialEquations

T = (0, 31)
u0 = [2, -0.2]
omega = 14.4

function Func!(du, u, t, p)
    x, y = u
    du[1] = u[2]
    du[2] = -omega*u[1]
end

pr = ODEProblem(Func!, u0, T)
sol = solve(pr, dtmax=0.05)

xx = [u[1] for u in sol.u]
yy = [u[2] for u in sol.u]
tt = sol.t

plt = plot( layout = (1,2), dpi = 200, legend = false)
plot!(plt[1], tt, [xx, yy], title = "Decision", color = [:red :blue])
plot!(plt[2], xx, yy, title = "Phase portrait", color =:red)
savefig(plt, "lab4_1.png")
```

В результате работы программы создались следующие графики (рис. @fig:007):

![Графики Julia для первого уравнения](image/lab4_1.png){ #fig:007 width=50% height=50% }

Код программы для второго уравнения выглядит следующим образом:
```julia
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
```
В результате работы программы создались следующие графики (рис. @fig:008):

![Графики Julia для второго уравнения](image/lab4_2.png){ #fig:008 width=50% height=50% }

Код программы для третьего уравнения выглядит следующим образом:
```julia
#variant 70
using Plots 
using DifferentialEquations

T = (0, 31)
u0 = [2, -0.2]
omega = 1
thetta = 17

function F(du, u, p, t)
    x, y = u
    du[1] = u[2]
    du[2] = -thetta*u[2] - omega*u[1] + 0.7 * sin(3*t)
end

pr = ODEProblem(F, u0, T)
sol = solve(pr, dtmax=0.05)

xx = [u[1] for u in sol.u]
yy = [u[2] for u in sol.u]
tt = sol.t

plt = plot( layout = (1,2), dpi = 200, legend = false)
plot!(plt[1], tt, [xx, yy], title = "Decision", color = [:red :blue])
plot!(plt[2], xx, yy, title = "Phase portrait", color =:red)
savefig(plt, "lab4_3.png")
```

В результате работы программы создались следующие графики (рис. @fig:009):

![Графики Julia для третьего уравнения](image/lab4_3.png){ #fig:009 width=50% height=50% }

# Выводы
Мы рассмотрели модель гармонических колебаний, провели анализ и вывод дифференциальных уравнений, а так жк построили графики зависимости наших переменных от времени и фазовые графики зависимостей.

# Список используемой литературы {.unnumberd}

