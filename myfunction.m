% clear all
% % my variant is 4 = mod(20162566, 6)
% 
% x = [0:5:100];
% 
% y = get_y(x);
% 
% [l,L]=lagran(x,y);


% plot function in different file
function y = myfunction(x)
    y = 1./(1+(x.^3));
end

% kaip aproksimacijos eile susijusi su tasku skaicium eileje?
% tasku skaicius turi buti 1 daugiau nei polinomo eile
% 2 skaiciai - 1 polinomo eile
% 3 skaiciai - 2 polinomo eile (parabole)

% polyval?