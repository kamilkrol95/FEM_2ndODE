function e_i = calc_e(i, n, x)
%% Wyznaczanie funkcji bazowej e_i
% dane wejœciowe:
% i - indeks funkcji bazowej
% n - liczba elementów
% x - wartoœæ x 
i = i-1; % poniewa¿ np. funkcja e_2 powinna byæ na przedziale (0, 2/n)
h = 1/n;
%% wartoœæ funkji bazowej w zale¿noœci od x i numeru funkcji
if ((x >= (i-1)*h) && (x < i*h))
	e_i = (x - (i-1) * h)/h;
elseif ((x >= i*h) && (x < (i+1)*h))
	e_i = ((i+1) * h - x)/h;
else
	e_i = 0;
end