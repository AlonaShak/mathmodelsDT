%% Математичні моделі для цифрових двійників промислових об'єктів
%% Лабораторна робота №2. Лінійна регресія

%  Інструкції
%  ------------
%
% Цей файл містить код, який допоможе навчитися вирішувати задачі лінійної регресії.
% У ЛР Вам потрібно буде доповнити наступні функції:
%
%     plotData.m
%     gradientDescent.m
%     computeCost.m
%
% У цій ЛР вам не потрібно змінювати код у цьому файлі.
%
% x відноситься до чисельності населення в 10 000 осіб
% y відноситься до прибутку в 10 000 доларів США
%

%% Ініціалізація
clear ; close all; clc

%% ======================= Частина 1: Відображення даних =======================
fprintf('Побудова діаграми ...\n')
data = load('ex2data1.txt');
X = data(:, 1); y = data(:, 2);
m = length(y); % кількість навчальних прикладів

% Побудова діаграми розсіювання
% Примітка: Потрібно доповнити код у файлі plotData.m
plotData(X, y);

fprintf('Програму призупинено. Натисніть enter, щоб продовжити.\n');
pause;

%% ========== Частина 2: Функція якості та метод градієнтного спуску ===========

X = [ones(m, 1), data(:,1)]; % додати до матриці X одиничий стовпець
theta = zeros(2, 1); % задання початкових значень параметрів лінійної регресії (коефіцієнтів регресії)
% Деякі налаштування градієнтного спуску
iterations = 1500;  %кількість ітерацій
alpha = 0.01;       %швидкість навчання

fprintf('\nТестування функції якості ...\n')
% обчислити та відобразити початкове значення функції якості
J = computeCost(X, y, theta);
fprintf('При theta = [0 ; 0]\nРозраховане значення функції якості = %f\n', J);
fprintf('Очікуване значення функції якості (приблизно) 32.07\n');

% подальше тестування функції якості
J = computeCost(X, y, [-1 ; 2]);
fprintf('\nПри theta = [-1 ; 2]\nРозраховане значення функції якості = %f\n', J);
fprintf('Очікуване значення функції якості (приблизно) 54.24\n');

fprintf('Програму призупинено. Натисніть enter, щоб продовжити.\n');
pause;

fprintf('\nРобота методу градієнтного спуску ...\n')
% запустити градієнтний спуск
[theta,J_history] = gradientDescent(X, y, theta, alpha, iterations);

% вивести значення параметрів регресії
fprintf('Параметри регресії, знайдені градієнтним спуском:\n');
fprintf('%f\n', theta);
fprintf('Очікувані значення параметрів (приблизно)\n');
fprintf(' -3.6303\n  1.1664\n\n');

% Побудувати графік лінійної моделі
hold on; % залишити попередню діаграму
plot(X(:,2), X*theta, '-')
legend('Навчальна множина', 'Лінійна регресія')
hold off % не накладати більше графіків у цьому вікні

% Прогнозовані значення для чисельності населення 35 000 і 70 000
predict1 = [1, 3.5] *theta;
fprintf('Для чисельності = 35,000, передбачається прибуток %f\n',...
    predict1*10000);
predict2 = [1, 7] * theta;
fprintf('Для чисельності = 70,000, передбачається прибуток %f\n',...
    predict2*10000);

fprintf('Програму призупинено. Натисніть enter, щоб продовжити.\n');
pause;

%% ============= Частина 3: Візуалізація J(theta_0, theta_1) =============
fprintf('Візуалізація J(theta_0, theta_1) ...\n')

% Сітка, за якою буде обчислюватися J
theta0_vals = linspace(-10, 10, 100);
theta1_vals = linspace(-1, 4, 100);

% ініціалізувати J_vals нульовою матрицею
J_vals = zeros(length(theta0_vals), length(theta1_vals));

% заповнити J_vals
for i = 1:length(theta0_vals)
    for j = 1:length(theta1_vals)
	  t = [theta0_vals(i); theta1_vals(j)];
	  J_vals(i,j) = computeCost(X, y, t);
    end
end


% Через те, як сітки працюють у команді surf,
% потрібно транспонувати J_vals перед викликом surf,
% інакше осі будуть перевернуті
J_vals = J_vals';
% графік поверхні
figure;
surf(theta0_vals, theta1_vals, J_vals)
xlabel('\theta_0'); ylabel('\theta_1');

% контурний графік
figure;
% відображення J_vals як 15 контурів, розташованих логарифмічно від 0,01 до 100
contour(theta0_vals, theta1_vals, J_vals, logspace(-2, 3, 20))
xlabel('\theta_0'); ylabel('\theta_1');
hold on;
plot(theta(1), theta(2), 'rx', 'MarkerSize', 10, 'LineWidth', 2);
