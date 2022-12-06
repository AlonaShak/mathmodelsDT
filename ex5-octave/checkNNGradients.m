function checkNNGradients(lambda)
%CHECKNNGRADIENTS Створює невеличку нейронну мережу для перевірки похідних
%алгоритму зворотного поширення помилки
%

if ~exist('lambda', 'var') || isempty(lambda)
    lambda = 0;
end

input_layer_size = 3;
hidden_layer_size = 5;
num_labels = 3;
m = 5;


Theta1 = debugInitializeWeights(hidden_layer_size, input_layer_size);
Theta2 = debugInitializeWeights(num_labels, hidden_layer_size);

X  = debugInitializeWeights(m, input_layer_size - 1);
y  = 1 + mod(1:m, num_labels)';


nn_params = [Theta1(:) ; Theta2(:)];


costFunc = @(p) nnCostFunction(p, input_layer_size, hidden_layer_size, ...
                               num_labels, X, y, lambda);

[cost, grad] = costFunc(nn_params);
numgrad = computeNumericalGradient(costFunc, nn_params);


disp([numgrad grad]);
fprintf(['Наведені вище два стовпці мають бути дуже схожими.\n' ...
         '(Зліва-розрахункові значення похідних, Справа-аналітичні значення похідних)\n\n']);


diff = norm(numgrad-grad)/norm(numgrad+grad);

fprintf(['Якщо ваша реалізація зворотного поширення помилки правильна, тоді\n' ...
         'відносна різниця буде невеликою (менше 1e-9).\n' ...
         '\nВідносна різниця: %g\n'], diff);

end
