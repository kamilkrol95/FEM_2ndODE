function de_i = calc_de(i, n, x)
%% Wyznaczanie funkcji bazowej e_i'
% dane wejœciowe:
% i - indeks funkcji bazowej
% n - liczba elementów
% x - wartoœæ x 
i = i-1; % poniewa¿ np. funkcja de_2 powinna byæ na przedziale (0, 2/n)
h = 1/n;
%%  wartoœæ funkji bazowej w zale¿noœci od x i numeru funkcji
if ((x >= (i-1)*h) && (x < i*h))
	de_i = n;
elseif ((x >= i*h) && (x < (i+1)*h))
	de_i = -n;
else
	de_i = 0;
end