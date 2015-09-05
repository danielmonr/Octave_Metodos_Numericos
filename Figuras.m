function [p,a] = Figuras(tipo,x,y)
if strcmp(tipo,"rectangulo")
p = x+x+y+y;
a = x*y;
else if strcmp(tipo,"circulo")
p = 2*pi*x;
a = pi*x*x;
else
disp("no esta disponible");
end
end