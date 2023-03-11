model lab5_1
parameter Real a = 0.47;
parameter Real b = 0.021;
parameter Real c = 0.57;
parameter Real d = 0.044;
Real x(start=12.0);
Real y(start=37.0);
equation
der(x) = -a*x + b*x*y;
der(y) = c*y - d*x*y;
end lab5_1;