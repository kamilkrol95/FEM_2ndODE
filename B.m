function B_w_v = B(w, v, k, n)
%% Wyznacznie wartoœci macierzy B(w,v)
% dane wejœciowe: 
% w - indeks funkcji e_i, w miejsce w
% v - indeks funkcji e_i, w miejsce v
% k - wartoœæ parametru k równania
% n - liczba elementów

syms x;
B_w_v = 0;
B_w_v = B_w_v + integral(@(x) k * calc_de(w,n,x) * calc_de(v,n,x), 0, 1,'ArrayValued',true); % integral(k*w'*v')
B_w_v = B_w_v + integral(@(x) calc_de(w,n,x) * calc_e(v,n,x), 0, 1,'ArrayValued',true); % integral(w'*v)
