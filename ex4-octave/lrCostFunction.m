function [J, grad] = lrCostFunction(theta, X, y, lambda)
%LRCOSTFUNCTION Обчислює функцію якості та градієнти функції якості
%для логістичної регресії з регуляризацією
%   J = LRCOSTFUNCTION(theta, X, y, lambda) обчислює функцію якості застосування theta
%   як параметрів логістичної регресії та градієнта функції якості
%   відносно кожного параметра theta.

% Ініціалізація додаткових змінних
m = length(y);% кількість навчальних прикладів
% Вам потрібно правильно повернути наступні змінні
J = 0;
grad = zeros(size(theta));

% ======================  Ваш код ======================
% Інструкції:
% Обчисліть функцію якості при конкретних theta
% Ви повинні змінній J присвоїти значення функції якості
% Обчисліть частинні похідні функції якості
% та змінній grad присвойте частинні похідні відносно кожного параметра theta
%
% Підказка: обчислення функції вартості та градієнтів
% можна ефективно векторизувати. Наприклад,
%
%           sigmoid(X * theta)
%

%




% =============================================================

grad = grad(:);

end