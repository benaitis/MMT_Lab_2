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
    figure(i)
%     plot(x, y, x3, y3, '*', x, y3lagran, chebyX, chebyY, 'o', x, y3cheby, x, y3pade, x, y3taylor);
    plot(x, y, x3, y3, '*', x, y3lagran, chebyX, chebyY, 'o', x, y3cheby, x, y3pade);
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







% % 2 dalis 
% % variantas 1 = mod(20162566, 3)
% close all
% clear all
% 
% load data2;
% y_changed = log(yd2'./x2');
% figure(3)
% plot(x2, yd2, '.', x2, y_changed, '*')
% 
% A2 = [x2' ones(size(x2'))];
% a2_tmp = A2\y_changed;
% % perkaiciuojame koeficientus
% a2(1) = exp(a2_tmp(2));
% a2(2) = a2_tmp(1);
% 
% 
% a22 = lsqcurvefit(@f2, [0;0], x2, yd2);
% x = linspace(1,5,100);
% y_linear = f2(a2,x);
% y_curvefit = f2(a22, x);
% figure(4)
% plot(x2, yd2, '.', x, y_linear, x, y_curvefit);
% 
% function y = f2(a,x)
% disp(a);
% y = a(1).*x.*exp(a(2)*x);
% end



