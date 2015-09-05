function res = punto(a,b)
% verificar las dimensiones de los vectores
	res = 0;
	
	for i= 1:size(a)
		res = res + a(i)*b(i);
	end;
end;