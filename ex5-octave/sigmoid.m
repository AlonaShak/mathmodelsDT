function g = sigmoid(z)
%SIGMOID Обчислення сигмоїдної функції

g = 1.0 ./ (1.0 + exp(-z));
end
