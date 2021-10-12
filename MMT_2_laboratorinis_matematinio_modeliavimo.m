% 1 dalis
x = linspace(0, 2, 100);
y = myfunction(x);
plot(x, y);

% aproksimuojam funkcija polinomu
% jo eile n-1 kur n = tasku skaicius

% apkroksimuosime funkcija 2, 3, 5, 7, 9 eilemis
% aproksimacijos eile - 2
% todel paduodam 3 taskush
% linspace trecias kintamasis


approximationRows = [2,3,5,7,9];
for i = 1:length(approximationRows)
   eile = approximationRows(i);
   x3 = linspace(0,2,eile+1);
    y3 = myfunction(x3);
    [l,L]=lagran(x3,y3); % l - polinomo koeficientas
    % per uzduota skaiciu ivertinam polinoma
    y3lagran = polyval(l, x);
    [chebyC, chebyX, chebyY] = cheby('myfunction', eile, 0, 2); % 1 - funkcija, 2 - eile, 3, 4 - ribos
    y3cheby = polyval(chebyC, x);
    [num,den,t] = pade('myfunction', 1, eile, eile, 0, 2);
    x0 = 0;
    y3pade = polyval(num, x-x0)./polyval(den, x-x0);
    y3taylor = polyval(t, x-x0);
    subplot(2,3,i);
    plot(x, y, x3, y3, '*', x, y3lagran, chebyX, chebyY, 'o', x, y3cheby, x, y3pade, x, y3taylor);
    title(sprintf('%d eiles aproksimacija', eile));
    legend('real function', 'points', 'lagrange', 'cheby nodes', 'cheby', 'pade', 'taylor');
end

% aproksimacijos eile - 3
% x4 = linspace(0,2,4);
% y4 = myfunction(x4);
% [l,L]=lagran(x4,y4); % l - polinomo koeficientas
% y4lagran = polyval(l, x);
% plot(x, y, x4, y4, '*', x, y4lagran);
% legend('real function', 'points', 'lagrange')
% y4chebyshev = cheby(y3,)

% atskirk visas aproksimacijos eiles i skirtingas diagramas
% you will get 25 functions









% 2 dalis 
% variantas 1 = mod(20162566, 3)



