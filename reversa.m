function y = reversa(a)
y = [];
indice = 1;
while indice <= length(a)
y = [a(indice) y];
indice = indice + 1;
end;
end;