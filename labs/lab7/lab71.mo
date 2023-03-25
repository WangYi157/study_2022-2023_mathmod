model lab71
  constant Real a1 = 0.895;
  constant Real a2 = 0.0000433;
  constant Integer N = 1170;
  constant Integer n0 = 7;
  Real n(time);
initial equation
  n = n0;
equation
  der(n) = (a1 + a2*n)*(N - n);
end lab71;