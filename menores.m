function y = menores(a, m)
y = [];
indice =1;
while a(indice) < m,
y = [y a(indice)];
indice++;
end;
end;