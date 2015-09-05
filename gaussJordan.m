% Funcion principal
function [x,A,d,Solucion] = gaussJordan(A,b,op)
% correr proceso que se desea
	if(op == 1)
		[x, Solucion] = sistema(A,b);
		d = 0;
	else if(op == 2)
		d = det(A);
			if(d == 0)
% si el determinante es 0 no hay inversa
			Solucion = 0;
			x = 0;
			else
			A = calculo(A);
			x = 0;
			Solucion = 2;
			end;
	end;

end;

% funcion para gauss-Jordan
function [x,s] = sistema(A,b)
%se recorren todas las columnas para igualar los elementos a 0
for j = 1:(size(A,2))
	%se escoge el pivote
	pivote = j;
	max = abs(A(j,j));
	for i = j:size(A,1)
		if(A(i, j) > abs(max))
			max = A(i,j);
			pivote = i;
		end;
	end;
	
% se hacen los cambios de linea si son necesarios
	if(pivote != j && j != size(A,1))
		temp = A(j, 1:size(A,2));
		A(j,1:size(A,2)) = A(pivote,1:size(A,2));
		A(pivote,1:size(A,2)) = temp;
		tempb = b(j);
		b(j) = b(pivote);
		b(pivote) = tempb;
	end;


	
	for l = 1:(size(A,1) )
% Se igualan a cero todos los elementos de la columna seleccionada
		if (l != j)
			c =(- A(l, j)/A(j, j)) ; 
			for k= 1:size(A,1)
				A(l,k) = c * A(j,k) + A(l,k);
			end;
			b(l) = (c * b(j)) +b(l);
		end;
	end;
end;
	
% se hace la división para obtener las x
	for z = 1:size(A,1)
		if (A(z,z) != 0)
			x(z) = b(z) / A(z,z);
			s = 1;
		else 
			x = 0;
			s = 0;
		end;
	end;
end;
end;

% funcion para sacar la inversa derivada de la anterior
function x = calculo(A)

% se inizializa la matriz identidad
b = zeros(size(A,2),size(A,2));

for y = 1:size(A,2)
	b(y,y) = 1;
end;


for j = 1:(size(A,2))
	pivote = j;
	max = abs(A(j,j));
	for i = j:size(A,1)
		if(A(i, j) > abs(max))
			max = A(i,j);
			pivote = i;
		end;
	end;
	
	% se aplican las operaciones a todos los elementos de la matriz identidad tambien
	if(pivote != j && j != size(A,1))
		temp = A(j, 1:size(A,2));
		A(j,1:size(A,2)) = A(pivote,1:size(A,2));
		A(pivote,1:size(A,2)) = temp;
		tempb = b(j, 1:size(b,2));
		b(j,1:size(b,2)) = b(pivote,1:size(b,2));
		b(pivote,1:size(b,2)) = tempb;
	end;
	
	for l = 1:(size(A,1) )
		if (l != j)
			c =(- A(l, j)/A(j, j)) ; 
			for k= 1:size(A,1)
				A(l,k) = c * A(j,k) + A(l,k);
				b(l,k) = (c * b(j,k)) +b(l,k);
			end;
		end;
	end;
end;
	% en este caso solo se regresa la matriz resultante
x = b;
	
end;
