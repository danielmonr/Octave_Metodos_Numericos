%Se define la función con los dos valores que regresa y los tres parámetros que recibe
function [x, Error] = puntoFijo(x0, eps, maxit)

	% Se hace la primera iteración para poder tener el primer término de la diferencia entre xi y xi+1
	% La iteración se hace asignandole a xi+1 el valor que regresa la funcion g(xi) que ya debe de estar definida previamente
	x = g(x0);
	% Se crea un contador de iteraciones
	i = 1;
	% Se crea una variable que calcula |xi+1 - xi|
	dif = abs(x-x0);	

	% Este proceso se repite mientras no se pase del número máximo de iteraciones y mientras no se cumpla con el criterio de convergencia
	while (i <= maxit) && (dif > eps),
		% Se le asigna a xi el valor de xi+1
		x0 = x;
		x = g(x0);
		dif = abs(x-x0);
		i = i+1;
	end;
	
	% Si se cumple con el criterio de convergencia error es falso
	if dif < eps,
		Error = 0;

	% De otra forma error es verdadero y no se puede regresar raiz, por lo que se regresa un mensaje
	else
		Error = 1;
		x = 'El metodo no converge';
	end;

end;