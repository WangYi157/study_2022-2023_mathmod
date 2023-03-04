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