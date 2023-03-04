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