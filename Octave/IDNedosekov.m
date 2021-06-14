% Исходная проверхность
[x, y, z] = ndgrid(-5:0.1:5, -5:0.1:5, -5:0.1:5);
f = 8*x.^2 - 2*x.*y - 4*y.^2 + 2*x.*z - 2*y.*z + 3*z.^2 + 7*x + 8*y + 9*z - 10;

% Построение графика
subplot (1, 2, 1);
title ("Original surface");
isosurface(f, 0);

% Составляем матрички
A = [8 -1 1; -1 -4 -1; 1 -1 3];
a = [7; 8; 9];
a0 = -10;

% Получение собственных значений и векторов
[ev, eval] = eigs(A);
ST = transpose(ev);
a1 = ST*a;

% Отрисовка новой поверхности
f = eval(1,1)*x.^2 + eval(2,2)*y.^2 + eval(3,3)*z.^2 + a1(1)*x + a1(2)*y + a1(3)*z + a0;
subplot (1, 2, 2);
title ("Canonical surface");
isosurface(f, 0);
