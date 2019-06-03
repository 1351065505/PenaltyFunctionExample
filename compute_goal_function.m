% 
% range = [0 2;  % x1: min, max % - dopuszczalne zakresy analizowanych argumentow
%          0 2]; % x2: min, max
%
% f = @(x)100 * (x(2) - x(1)^2) + (1 - x(1))^2; % - funkcja celu
% g = @(x)x^4; % - funkcja "ograniczajaca"
%
% n - mno¿nik (dzieki niemum mozemy zwiêkszyc kolejne  coraz dalsze wartosci funkcji kary jesli badana funkcja jest dosyc "stroma")
%
function y = compute_goal_function(x, range, f, g, n)
    tmp = zeros(size(x)); % argumenty przekazywane do funkcji celu
    p = 0; % wartosc o jaka zwieszkamy nasza funkcje (jesli przekroczymy badany zakres)

    for i = 1 : size(x, 1) % dla kazdej wzpolrzednej
        if(x(i) < range(i, 1)) % jesli przekroczono minumum (range(i, 1) to minimum)
            distance = x(i) - range(i, 1); % distance informuje jak daleko przekroczono zakres na lewo od minimum
            p = p + n * g(distance); 
            tmp(i) = range(i, 1);
        else
           if(x(i) > range(i, 2)) % jesli przekroczono maksimum (range(i, 2) to maksimum)
               distance = x(i) - range(i, 2);  % distance informuje jak daleko przekroczono zakres na prawo od maksimum
               p = p +  n * g(distance);
               tmp(i) = range(i, 2);
           else % jesli wartosc miesci sie w badanym przedziale
               tmp(i) = x(i);
           end
        end
    end
    
    %y = f(tmp) + p;
    %y = f(x);
    y = p;
end