function solve_eq(n,k)      % ctrl + r to use as script 
% n =3; k = 2;              % ctrl + t to use as script
%% Metoda elementów skoñczonych dla równania: u'(x) - ku''(x) = 5x - 10
%% Sta³e wprowadzane do programu
if ((n == 0) )
    n = 10;      % liczba elementów
%     k = 1;      % sta³a w równaniu
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
% wartoœæ macierzy na poz. (1,1), ze wzglêdu na warunek brzegowy
B_mat(1, 1) = 1;
% wartoœci w wierszu 1 i kolumnie 1 s¹ ju¿ zerami, dlatego wyznaczanie
% wartoœci przeprowadzone od indeksu 2

% wyznaczanie wartoœci w pozosta³ych komórkach macierzy B
for i = 2:n+1
    for j = 2:n+1
        B_mat(i,j) = B(j,i,k,n);
    end
end

%% Wyznaczenie wektora L(v)
% wartoœæ w pierwszym wierszu, ze wzgêdu na warunek brzegowy
L_vec(1) = 0;

% wyznacznie wartoœci w pozosta³ych wierszach
for i = 2:n+1
    L_vec(i) = L(i,k,v1(i),n);
end

%% Obliczenie wektora W
% z równania B * W = L -> W = B^(-1) * L
W_vec = B_mat^(-1) * L_vec;

%% Obliczenie rozwi¹zania równania
% rozwi¹zanie otrzymujemy zgodnie ze wzorem:
% w = w1*e1 + w2*e2 + ... + w_n+1*e_n+1

x = 0:h:1;              % wektor punktów ca³kowania
u = zeros(1,length(x)); % wektor rozwi¹zañ w pkt. ca³kowania 
for i = 1:length(x)
    % wyliczenie rozwi¹zania w
    w = 0; 
    for j = 1:n+1
		w = w + calc_e(j,n,x(i)) * W_vec(j); 
    end
    % wyznczenie wartoœci u, uwzglêdniaj¹c shift (u* = -5x + 5)
    u(i) = -5 * (x(i)) + 5 + w;
end

%% Rysowanie rozwi¹zania u
% kreœlenie wykresu
plot(x, u, 'k', 'LineWidth', 2);
hold on; grid on;
plot(x, u, '+r', 'LineWidth', 2);
% opis 
plotTitle = sprintf('Equation: u`(x) - %.1fu``(x) = 5x-10; n = %d', k, n);
title(plotTitle, 'Color', 'r', 'FontWeight', 'bold');
xlabel('x', 'FontWeight', 'bold');
ylabel('u(x)', 'FontWeight', 'bold');