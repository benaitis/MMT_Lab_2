close all
clear all
% 1 dalis
x = linspace(0, 2, 100);
y = myfunction(x);
plot(x, y);
hold on;

% aproksimuojam funkcija polinomu
% jo eile n-1 kur n = tasku skaicius

% apkroksimuosime funkcija 2, 3, 5, 7, 9 eilemis
% aproksimacijos eile - 2
% todel paduodam 3 taskus
% linspace trecias kintamasis


approximationRows = [2,3,5,7,9];
mse = zeros(3, length(approximationRows));
maxError = zeros(3, length(approximationRows));
for i = 1:length(approximationRows)
    eile = approximationRows(i);
    % lagrange
    x3 = linspace(0,2,eile+1);
    y3 = myfunction(x3);
    [l,L]=lagran(x3,y3); % l - polinomo koeficientas
    % per uzduota skaiciu ivertinam polinoma
    y3lagran = polyval(l, x);
    %chebyshev
    [chebyC, chebyX, chebyY] = cheby('myfunction', eile, 0, 2); % 1 - funkcija, 2 - eile, 3, 4 - ribos
    y3cheby = polyval(chebyC, x);
    % pade and taylor
    [num,den,t] = pade('myfunction', 1, eile, eile, 0, 2);
    x0 = 0;
    y3pade = polyval(num, x-x0)./polyval(den, x-x0);
    y3taylor = polyval(t, x-x0);
    
    % spline
    x5 = linspace(0, 2, eile+1);
    y5 = myfunction(x5);
    y3spln = spline(x5, y5, x);
    
    % show plots
    figure(i);
    % atkomentuoti po apacia, kad pamatyt su teiloro eilute
    % kadangi ji gadina grafikus keistomis reiksmemis
%     plot(x, y, x3, y3, '*', x, y3lagran, chebyX, chebyY, 'o', x, y3cheby, x, y3pade, x, y3spln, x, y3taylor);
    % be teiloro eilutes
    plot(x, y, x3, y3, '*', x, y3lagran, chebyX, chebyY, 'o', x, y3cheby, x, y3pade, x, y3spln);
    hold on;
    title(sprintf('%d eiles aproksimacija', eile));
    legend('real function', 'points', 'lagrange', 'cheby nodes', 'cheby', 'pade', 'splines', 'taylor');
    
    % skaiciuojam klaidas
    % skaiciuojam MSE klaidas
    mse(1, i) = immse(y, y3lagran);
    mse(2, i) = immse(y, y3cheby);
    mse(3, i) = immse(y, y3pade);
    mse(4, i) = immse(y, y3spln);
    % skaicioujam maksimalia paklaida
    maxError(1, i) = max(abs(y-y3lagran));
    maxError(2, i) = max(abs(y-y3cheby));
    maxError(3, i) = max(abs(y-y3pade));
    maxError(4, i) = max(abs(y-y3spln));
end

% MSE Erroru atvaizdavimas
figure(length(approximationRows)+1)
hold on
plot(approximationRows, mse(1,:), 'o-');
plot(approximationRows, mse(2,:), '+-');
plot(approximationRows, mse(3,:), '*-');
plot(approximationRows, mse(4,:), 'o-');
legend('o - Lagrandzo', '+ - Chebyshevo', '* - Pade', 'o - Splainai');
title('MSE klaida');
hold off;

% absoliucios paklaidos atvaizdavimas
figure(length(approximationRows)+2)
hold on
plot(approximationRows, maxError(1,:), 'o-');
plot(approximationRows, maxError(2,:), '+-');
plot(approximationRows, maxError(3,:), '*-');
plot(approximationRows, maxError(4,:), 'o-');
legend('o - Lagrandzo', '+ - Chebyshevo', '* - Pade', 'o - Splainai');
title('Max klaida');
hold off;
