function [p,m] = proyD(matriz) 
prom = [];
mayor = 0;
menor = 0;
m = [];
est = [];
M = size(matriz,2);
N = size(matriz,1);
menores = [];

for i = 1:N
	prom = [prom; (sum(matriz(i,:))/M)];
	est = [est; std(matriz(i,:))];
end;
p = [prom est];

for i = 1:M
	for n = 1:N
		if matriz(n,i) > mayor
			mayor = matriz(n,i);
		end;
	end;
	m = [m mayor];
end;

for i = 1:M
	menor = matriz(1,M);
	for n = 1:N
		if matriz(n,i) < menor
			menor = matriz(n,i);
		end;
	end;
	menores = [menores menor];
end;
m = [m;menores];

end;