% Funcion principal
function [x,A,d,Solucion] = montante(A,b,op)
% correr proceso que se desea
	if(op == 1)
		[x, Solucion] = sistema(A,b);
		d = 0;
	else if(op == 2)
		[A, d] = calculo(A);
		x = 0;
		if(d != 0)
			Solucion = 2;
		else
		Solucion = 0;
		end;
	end;

end;

% funcion para montante
function [x,s] = sistema(A,b)

nueva = A;
sol = b;
pivote = 1;

% Se recorren todas las filas como pivotes
for i = 1:(size(A,2))

	% Se recorren todas las filas para hacer las operaciones necesarias
	for fila = 1:(size(A,1))
		% La fila pivote no se toca
		if (fila != i)
			% Se recorren cada columna y se aplica la operacion
			for columna = 1:(size(A,1))
				nueva(fila,columna) = ((A(fila,columna)*A(i,i)) - (A(fila,i)*A(i,columna)))/pivote;
			end;
			sol(fila) = ((b(fila)*A(i,i)) - (A(fila,i)*b(i)))/pivote;
		end;
	end;

	% Se guarda el pivote anterior
	pivote = A(i,i);

	% Se guarda la nueva matriz en la anterior al igual que el vector
	A = nueva;
	b = sol;
end;

% Se hacen las divisiones y se regresa el resultado
x = zeros(3,1);
for r = 1:(size(A,2))
	x(r) = b(r)/A(r,r);
end;
s = 1;
end;
end;

% funcion para sacar la inversa derivada de la anterior
function [x, d] = calculo(A)

% se inizializa la matriz identidad
b = zeros(size(A,2),size(A,2));
for y = 1:size(A,2)
	b(y,y) = 1;
end;

nueva = A;
sol = b;
pivote = 1;

	
	% Se recorren todas las filas como pivotes
for i = 1:(size(A,2))

	% Se recorren todas las filas para hacer las operaciones necesarias
	for fila = 1:(size(A,1))
		% La fila pivote no se toca
		if (fila != i)
			% Se recorren cada columna y se aplica la operacion
			for columna = 1:(size(A,1))
				nueva(fila,columna) = ((A(fila,columna)*A(i,i)) - (A(fila,i)*A(i,columna)))/pivote;
				sol(fila,columna) = ((b(fila,columna)*A(i,i)) - (A(fila,i)*b(i,columna)))/pivote;
			end;
		end;
	end;

	% Se guarda el pivote anterior
	pivote = A(i,i);

	% Se guarda la nueva matriz en la anterior al igual que el vector
	A = nueva;
	b = sol;
end;

d = A(1,1);
x = b/A(1,1);

end;
