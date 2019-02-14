function B_w_v = B(w, v, k, n)
%% Wyznacznie warto�ci macierzy B(w,v)
% dane wej�ciowe: 
% w - indeks funkcji e_i, w miejsce w
% v - indeks funkcji e_i, w miejsce v
% k - warto�� parametru k r�wnania
% n - liczba element�w

syms x;
B_w_v = 0;
B_w_v = B_w_v + integral(@(x) k * calc_de(w,n,x) * calc_de(v,n,x), 0, 1,'ArrayValued',true); % integral(k*w'*v')
B_w_v = B_w_v + integral(@(x) calc_de(w,n,x) * calc_e(v,n,x), 0, 1,'ArrayValued',true); % integral(w'*v)
