%% Математичні моделі для цифрових двійників промислових об'єктів
%% Лабораторна робота №4. Багатокласова класифікація
%  Інструкції
%  ------------
%
% Цей файл містить код, який допоможе навчитися виконувати багатокласову класифікацію.
% У ЛР Вам потрібно буде доповнити наступні функції:
%
%     lrCostFunction.m (функція якості логістичної регресії)
%     oneVsAll.m
%     predictOneVsAll.m
%
% У цій ЛР вам не потрібно змінювати код у цьому файлі.
%

%% Ініціалізація
clear ; close all; clc

%% Налаштування параметрів, які будуть використовуватись в цій частині
input_layer_size  = 400;  % 20x20 Вхідні зображення цифр
num_labels = 10;          % 10 міток від 1 до 10
                          % (зверніть увагу, що "0" зіставлено з міткою 10)

%% =========== Частина 1: Завантаження та візуалізація даних =============
% Ми починаємо лабораторну із завантаження та візуалізації набору даних.
% Ви працюватимете з набором даних, який містить рукописні цифри.
%

% Завантаження навчальних даних
fprintf('Завантаження та візуалізація даних ...\n')

load('ex4data1.mat'); % навчальні дані, що зберігаються в масивах X, y
m = size(X, 1);

% Довільний вибір 100 точок даних для відображення
rand_indices = randperm(m);
sel = X(rand_indices(1:100), :);

displayData(sel);

fprintf('Програму призупинено. Натисніть enter, щоб продовжити.\n');
pause;

%% ============ Частина 2a: Векторизація логістичної регресії ============


% Тестовий приклад для lrCostFunction
fprintf('\nТестування lrCostFunction() з регуляризацією');

theta_t = [-2; -1; 1; 2];
X_t = [ones(5,1) reshape(1:15,5,3)/10];
y_t = ([1;0;1;0;1] >= 0.5);
lambda_t = 3;
[J grad] = lrCostFunction(theta_t, X_t, y_t, lambda_t);

fprintf('\nФункція якості: %f\n', J);
fprintf('Очікуване значення функції якості: 2.534819\n');
fprintf('Градієнти:\n');
fprintf(' %f \n', grad);
fprintf('Очікуване значення градієнтів:\n');
fprintf(' 0.146561\n -0.548558\n 0.724722\n 1.398003\n');

fprintf('Програму призупинено. Натисніть enter, щоб продовжити.\n');
pause;
%% ============ Частина 2b: One-vs-All Навчання ============
fprintf('\nНавчання логістичної регресії One-vs-All...\n')

lambda = 0.1;
[all_theta] = oneVsAll(X, y, num_labels, lambda);

fprintf('Програму призупинено. Натисніть enter, щоб продовжити.\n');
pause;


%% ======== Частина 3: Прогнозування за класифікацією One-Vs-All ===============

[prob,pred] = predictOneVsAll(all_theta, X);

fprintf('\nТочність навчання: %f\n', mean(double(pred == y)) * 100);

