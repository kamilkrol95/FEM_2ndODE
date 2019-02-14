function e_i = calc_e(i, n, x)
%% Wyznaczanie funkcji bazowej e_i
% dane wej�ciowe:
% i - indeks funkcji bazowej
% n - liczba element�w
% x - warto�� x 
i = i-1; % poniewa� np. funkcja e_2 powinna by� na przedziale (0, 2/n)
h = 1/n;
%% warto�� funkji bazowej w zale�no�ci od x i numeru funkcji
if ((x >= (i-1)*h) && (x < i*h))
	e_i = (x - (i-1) * h)/h;
elseif ((x >= i*h) && (x < (i+1)*h))
	e_i = ((i+1) * h - x)/h;
else
	e_i = 0;
end