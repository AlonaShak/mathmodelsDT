function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT виконує градієнтний спуск для пошуку theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) оновлює значення theta,
%   роблячи градієнтні кроки num_iters зі швидкістю навчання альфа

%  Ініціалізація додаткових змінних
m = length(y); % кількість навчальних прикладів
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== Ваш код ======================
    % Інструкції: Виконайте один крок градієнтного спуску
    % залежно від вектора параметрів theta.



    % ============================================================

    % Збереження функції якості J на кожній ітерації
    J_history(iter) = computeCost(X, y, theta);

end

end
