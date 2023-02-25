model lab3_1
parameter Integer x0 = 80000;
parameter Integer y0 = 60000;

parameter Real a = -0.21;
parameter Real b = -0.855;
parameter Real c = -0.455;
parameter Real h = -0.32;
Real x(start=x0);
Real y(start=y0);
equation
der(x) = a*x + b*y + sin(time) + 2;
der(y) = a*x + b*y + cos(time) + 2;
end lab3_1;