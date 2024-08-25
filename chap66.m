% clc,clear
% % Chpater 6 solutions
% % -----------------------------------------------------------
% 1) 
% -----------------------------------------------------------
f = [0, 2.40 5.87 8.36];
y = [12 18.3 26.9 32.8];

x = y - 12;

% since f(0) != 0 therefore it cant be a power function.

p = polyfit(f,x,1);
fprintf('The relationship of f to x is `y = mx + c`\n');
fprintf('g(x) = %.4fx + %.4f\n', p(1), p(2))

% -----------------------------------------------------------
% 2)
% -----------------------------------------------------------
function plott(x,y) % Function to plot linear, exp and log functions

figure
% subplot(3,1,1) % linear
plot(x,y,'o',x,y)
title('linear')

figure
% subplot(3,1,2) % exponential
semilogy(x,y,'o',x,y)
title('exponential')

figure
% subplot(3,1,3) % log (power)
loglog(x,y,'o',x,y)
title('log')
end
% -----------------------------------------------------------
% 2a)
% -----------------------------------------------------------
x_a = 25:5:45;
y_a = [5 260 480 745 1100];

X_a = 25:0.01:45; % Range for plotting the fitted function

% plott(X,Y) % a is linear

% therefore
p_a = polyfit(x_a,y_a,1);

% fprintf('linear function ==> f(x) = %.4fx + %.4f\n', p_a(1), p_a(2))
% w = polyval(p,x_a);

W = polyval(p_a,X_a); % more data points


% plot(x_a,y_a,'o',X_a,W)
% -----------------------------------------------------------
% 2b) 
% -----------------------------------------------------------
x_b = [2.5, 3, 3.5, 4, 4.5, 5, 5.5, 6, 7, 8, 9, 10];
y_b = [1500, 1220, 1050, 915, 810, 745, 690, 620, 520, 480, 410, 390];

% Range for plotting the fitted function
X_b = 2:0.01:10;


% Fitting for power function
p_b = polyfit(log10(x_b), log10(y_b), 1);

% y=bx^m  b=log10(p_b(2)), m_b = p_b(1)
b_b = 10^p_b(2);
m_b = p_b(1);

% option 1 ------------------------------
y_new = b_b * x_b.^m_b;  % Using the fomular of a power function.


% option 2 ------------------------------
% Evaluate the power fit (in log space) and transform back
w_b = polyval(p_b, log10(x_b));
W_b = 10.^w_b; % Transform back to original scale 

% Ploting the fitted values:
% plot(x_b,y_b,'o', x_b, y_new, '+', x_b, W_b)

% displaying answer
% fprintf('Power function ==> f(x) = %.4fx^(%.4f)\n', b, m_b)
% -----------------------------------------------------------
% 2c)
% -----------------------------------------------------------
x_c = [550, 600, 650, 700, 750];
y_c = [41.2, 18.62, 8.62, 3.92, 1.86];

% Range for plotting the fitted function
X_c = 550:0.01:750;

% Testing for type of function
% plott(x_c,y_c) % Exponential function

% Fitting for Exponential function
p_c = polyfit(x_c, log10(y_c), 1);

% y=be^mx  b=log10(p_c(2)), m = p_c(1)
b_c = 10^p_c(2);
m_c = p_c(1);

% displaying answer
% fprintf('Exponential function ==> f(x) = %.4fe^(%.4f)x\n', b_c, m_c)

% Evaluate the polynomial fit (in log space) and transform back
w_c = polyval(p_c, X_c);
W_c = 10.^w_c; % Transform back to original scale

% Ploting the fitted values:
plot(x_c,y_c,'o',X_c,W_c)

% -----------------------------------------------------------
% 3)
% -----------------------------------------------------------
x3 = 2015:2020;
mu = min(x3);
x3 = x3 - mu;

y3 = [15 16.35 17.55 18.90 20.70 22.35];

% plott(x3,y3)

% % linear case
% p3 = polyfit(x3,y3,1);
% 
% % 30 = mx + b, x = (30-b)/m
% 
% X3 = (30 - p3(2))/ p3(1);
% X3 = X3 + mu;
% % fprintf('The answer is aprox 2025')


% Exponential case
p3 = polyfit(x3,log10(y3),1);

m3 = p3(1);
b3 = 10^p3(2);

yy = b3 * 10.^(m3* x3);

% plot(x3,y3,'o', x3, yy)
% 
% 30 = be^mx , log10(30) = log(b) + mx, log10(30/b)/m == x
X33 = log10(30/b3)/m3; 

X33 = X33 + mu;
% % fprintf('The answer is aprox 2024')

plot(x3,y3,'o', x3, yy)