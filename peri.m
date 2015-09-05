function [r,t] = peri(t,a,p)
if strcmp(t, “rectangulo”)
r=a+a+p+p;
t=a*p;
else if strcmp(t, “circulo”)
r= 2*pi*a;
t= pi*a*a;
end
end