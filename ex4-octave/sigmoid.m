function g = sigmoid(z)
%SIGMOID Обчислює сигмоїдну функцію
%   g = SIGMOID(z) обчислює значення сигмоїдної функції від z.

g = 1.0 ./ (1.0 + exp(-z));
end
