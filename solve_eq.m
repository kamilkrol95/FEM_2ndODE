function solve_eq(n,k)      % ctrl + r to use as script 
% n =3; k = 2;              % ctrl + t to use as script
%% Metoda element�w sko�czonych dla r�wnania: u'(x) - ku''(x) = 5x - 10
%% Sta�e wprowadzane do programu
if ((n == 0) )
    n = 10;      % liczba element�w
%     k = 1;      % sta�a w r�wnaniu
    warning('There must be at least one elemnt!\n\t\t\tSolving default case: N = %d',n)
end
%% Przygotowanie srodowiska
h = 1/n;
B_mat = zeros(n+1, n+1);
W_vec = zeros(n+1, 1);
L_vec = zeros(n+1, 1);
v1(1:n) = 0;
v1(n+1) = 1;

%% Wyznaczenie macierzy B(w,v)
% warto�� macierzy na poz. (1,1), ze wzgl�du na warunek brzegowy
B_mat(1, 1) = 1;
% warto�ci w wierszu 1 i kolumnie 1 s� ju� zerami, dlatego wyznaczanie
% warto�ci przeprowadzone od indeksu 2

% wyznaczanie warto�ci w pozosta�ych kom�rkach macierzy B
for i = 2:n+1
    for j = 2:n+1
        B_mat(i,j) = B(j,i,k,n);
    end
end

%% Wyznaczenie wektora L(v)
% warto�� w pierwszym wierszu, ze wzg�du na warunek brzegowy
L_vec(1) = 0;

% wyznacznie warto�ci w pozosta�ych wierszach
for i = 2:n+1
    L_vec(i) = L(i,k,v1(i),n);
end

%% Obliczenie wektora W
% z r�wnania B * W = L -> W = B^(-1) * L
W_vec = B_mat^(-1) * L_vec;

%% Obliczenie rozwi�zania r�wnania
% rozwi�zanie otrzymujemy zgodnie ze wzorem:
% w = w1*e1 + w2*e2 + ... + w_n+1*e_n+1

x = 0:h:1;              % wektor punkt�w ca�kowania
u = zeros(1,length(x)); % wektor rozwi�za� w pkt. ca�kowania 
for i = 1:length(x)
    % wyliczenie rozwi�zania w
    w = 0; 
    for j = 1:n+1
		w = w + calc_e(j,n,x(i)) * W_vec(j); 
    end
    % wyznczenie warto�ci u, uwzgl�dniaj�c shift (u* = -5x + 5)
    u(i) = -5 * (x(i)) + 5 + w;
end

%% Rysowanie rozwi�zania u
% kre�lenie wykresu
plot(x, u, 'k', 'LineWidth', 2);
hold on; grid on;
plot(x, u, '+r', 'LineWidth', 2);
% opis 
plotTitle = sprintf('Equation: u`(x) - %.1fu``(x) = 5x-10; n = %d', k, n);
title(plotTitle, 'Color', 'r', 'FontWeight', 'bold');
xlabel('x', 'FontWeight', 'bold');
ylabel('u(x)', 'FontWeight', 'bold');