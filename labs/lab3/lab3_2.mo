model lab3_2
parameter Integer x0 = 80000;
parameter Integer y0 = 60000;

parameter Real a = -0.267;
parameter Real b = -0.687;
parameter Real c = -0.349;
parameter Real h = -0.491;
Real x(start=x0);
Real y(start=y0);
equation
der(x) = a*x + b*y + abs(sin(2*time));
der(y) = a*x*y + b*y + abs(2*cos(time));
end lab3_2;