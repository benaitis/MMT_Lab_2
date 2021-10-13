% 2 dalis 
% variantas 1 = mod(20162566, 3)
close all
clear all

% load data
load data2;
% turn function to new version as shown in table
y_new = log(yd2'./x2');
figure(3)
% plot values of old and new/changed function values
plot(x2, yd2, '.', x2, y_new, '*')
legend('tikrieji duomenys', 'pakeista funkcija gauti duomenys');

% TLS sprendimas naudojant '\' operatoriu
A2 = [x2' ones(size(x2'))]; % pasidedam x2 reiksmes i nauja masyva
coeficients = A2\y_new; % sprendimas kuris talpinamas i laikina kintamaji

% gauname sprendimus TLS ir lsqcurvefit
a2(1) = exp(coeficients(2));
a2(2) = coeficients(1);
a22 = lsqcurvefit(@f2, [0;0], x2, yd2);

% susigeneruojam duomenu
x = linspace(1,5,100);
% gauname y pagal musu funkcija
y_tls = f2(a2,x);
% gauname y pagal curvefit
y_lsqcurvefit = f2(a22, x);

% atvaizduojame aproksimacija naudojant \ ir curvefit
figure(4)
plot(x2, yd2, '.', x, y_tls, x, y_lsqcurvefit);
legend('tikrieji duomenys', 'TLS sprendimo aproksimacija', 'LSqcurvefit sprendimo aproksimacija');

function y = f2(a,x)
disp(a);
y = a(1).*x.*exp(a(2)*x);
end