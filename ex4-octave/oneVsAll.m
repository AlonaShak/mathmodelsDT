function [all_theta] = oneVsAll(X, y, num_labels, lambda)
%   [all_theta] = ONEVSALL(X, y, num_labels, lambda) навчає класифікатори
%   логістичної регресії num_labels і повертає кожен із цих класифікаторів
%   у матрицю all_theta, де i-й рядок all_theta відповідає класифікатору
%   для мітки i

% Ініціалізація додаткових змінних
m = size(X, 1);
n = size(X, 2);

% Вам потрібно правильно повернути наступні змінні
all_theta = zeros(num_labels, n + 1);

% % Додавання вектора вільних членів до X
X = [ones(m, 1) X];

% ====================== Ваш код ======================
% Інструкції:  Ви повинні завершити наведений нижче код,
% щоб навчити класифікатори логістичної регресії num_labels
% з параметром регуляризації лямбда.
%

%
% Приклад коду для fmincg:
%
%     % Означення початкових значень theta
%     initial_theta = zeros(n + 1, 1);
%
%     % Означення початкових налаштувань для fminunc
%     options = optimset('GradObj', 'on', 'MaxIter', 50);
%
%     % Запуск fmincg для отримання оптимальних параметрів
%     % Ця функція поверне параметри та значення функції якості

%  [all_theta(c,:), cost] = ...
%        fmincg (@(t)(lrCostFunction(t, X, (y == c), lambda)), ...
%                initial_theta, options);

%
% =========================================================================


end