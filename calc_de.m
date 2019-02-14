function de_i = calc_de(i, n, x)
%% Wyznaczanie funkcji bazowej e_i'
% dane wej�ciowe:
% i - indeks funkcji bazowej
% n - liczba element�w
% x - warto�� x 
i = i-1; % poniewa� np. funkcja de_2 powinna by� na przedziale (0, 2/n)
h = 1/n;
%%  warto�� funkji bazowej w zale�no�ci od x i numeru funkcji
if ((x >= (i-1)*h) && (x < i*h))
	de_i = n;
elseif ((x >= i*h) && (x < (i+1)*h))
	de_i = -n;
else
	de_i = 0;
end