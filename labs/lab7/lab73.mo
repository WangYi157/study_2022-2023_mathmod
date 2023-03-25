model lab73
  constant Real a1 = 0.196;
  constant Real a2 = 0.669;
  constant Integer N = 1170;
  constant Integer n0 = 7;
  Real n(time);
initial equation
  n = n0;
equation
  der(n) = (a1*sin(time) + a2*cos(time)*n)*(N - n);
end lab73;