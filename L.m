function L_v = L(v, k, v1, n)
%% Wyznacznie warto�ci wektora L(v)
% dane wej�ciowe: 
% v - indeks funkcji e_i, w miejsce v
% k - warto�� parametru k r�wnania
% v1 - warto�� wybranej funkcji v(1)
% n - liczba element�w

syms x;
L_v = 0;
L_v = L_v + k * 3 * v1; % integral(3*k*v)
L_v = L_v + integral(@(x) 5 * x * calc_e(v,n,x), 0, 1,'ArrayValued',true); % integral(5*x**v)
L_v = L_v + integral(@(x) 5 * k * calc_de(v,n,x), 0, 1,'ArrayValued',true); % integral(5*k*v')
L_v = L_v - integral(@(x) 5 * calc_e(v,n,x), 0, 1,'ArrayValued',true); % integral(5*v)

