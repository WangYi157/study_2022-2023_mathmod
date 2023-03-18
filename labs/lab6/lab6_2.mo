model lab6_2
  constant Real alfa = 0.7;
  constant Real betta = 0.3;
  constant Integer N = 14041;
  constant Integer I_1 = 100;
  Real S(time);
  Real I(time);
  Real R(time);
initial equation
  I = 131;
  R = 71;
  S = N - I - R;
equation
  if I > I_1 then
    der(S) = -alfa*S;
    der(I) = alfa*S - betta*I;
  else 
    der(S) = 0;
    der(I) = -betta*I;
  end if;
  der(R) = betta*I;
end lab6_2;