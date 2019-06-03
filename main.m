% konfiguracja

range = [0 2;  % x1: min, max
         0 2]; % x2: min, max
f = @(x)100 * (x(2) - x(1)^2) + (1 - x(1))^2;
g = @(x)x^4;
n = 100;

t = -2:0.1:4; % okresla wspolrzedne w ktorych rysowane sa punkty

% przyklad uzycia

x=t;
y=t;
z=zeros(length(t));

for i=1 : length(t)
    for j=1 : length(t)
        arguments = [x(j); y(i)];
        z(i, j) = compute_goal_function(arguments, range, f, g, n);
    end
end

surf(x, y, z);