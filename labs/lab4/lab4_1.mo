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