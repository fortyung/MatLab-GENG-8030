%
% Last year's questions

% --------------------------------------------------
%  QUESTION 1
% --------------------------------------------------

% 1.) Suppose it is known that the graph of the function y = ax3 + bx2 + cx + d 
% passes through four given points （xi,yi)，i=1,2,3,4.
% Write a user-defined function that accepts these four points and computes the 
% coefficients a, b, c, and d. The function should solve four linear equations in terms of the four unknowns a, b, c, and d.
% Test your function for the case where (xi, yi) = (-2, -20), (0,4), (2,68), and (4,508), whose answer
% is a = 7, b = 5, c = -6 and d = 4.

%Q1 answer ---> we can simply use polyfit() for this

x = [-2,0,2,4];
y = [-20,4,68,508];
cof = [ 7 5 -6 4];

function [a,b,c,d] = coefff(x_values, y_values)

antt = polyfit(x_values,y_values,3); % Gives the coeff a, b, c and d



% Assigning variables to each coeff
a = antt(1);
b = antt(2);
c = antt(3);
d = antt(4);

end

% TEST CASE
[a11,b11,c11,d11] = coefff(x,y)


% --------------------------------------------------
%  QUESTION 2
% --------------------------------------------------

% 2.) The following data give the drying time T of a certain paint as a function of the amount of a certain additive A.
% a.Find the first-, second-, third-, and fourth-degree polynomials that fit the data, and plot each polynomial with the data.
% Determine the quality of the curve fit for each by computing J, S, and r2.
% b. Use the polynomial giving the best fit to estimate the amount of additive that minimizes the drying time.


% Q2 answer ---> Frist we test to see what kind of fuction this is (loglog, power, liner)

% given data
A = 0:1:9;
T = [130 115 110 90 89 89 95 100 110 125];
% --------------------------------------------------
% Testing for function
% subplot(3,1,1)
% plot(A,T)
% 
% subplot(3,1,2)
% semilogy(A,T)
% 
% subplot(3,1,3) % This cant be an option because f(0) != 0
% loglog(A,T)

% Results -- plot looks better then the rest, not sure how but yea. It looks
% more straight than the rest. Hence it's a linear function
% --------------------------------------------------


% Finding the 1st-4th degree polynomials that fit the data.
for i = 1:4 % Loops 4 times
    p = polyfit(A,T,i);
    w = polyval(p,Ap);

    subplot(1,4,i)
    % figure

    plot(A,T,'o',Ap,w)
    xlabel('Additive (oz)')
    ylabel('Time (sec)')
    title(sprintf('Degree %d', i)) % Titles each graph 1 - 4

    % J, S, and r2
    J(i) = sum((polyval(p,A) - T).^2);
    S(i) = sum((T - mean(T)).^2);
    R2(i) = 1 - ( J(i)/S(i) );
end


% --------------------------------------------------
%  QUESTION 3
% --------------------------------------------------

% 3.) The following table shows how many hours in process reactors A and B are 
% required to produce 1 ton each of chemical products 1, 2, and 3. The two reactors 
% are available for 35 and 40 hrs per week, respectively.

% Let x,y, z be the number of tons each of products 1, 2, and 3 that can be produced in one week.
% a. Use the data in the table to write two equations in terms of x, y, and z. Determine 
% whether a unique solution exists. If not, use MATLAB to find the relations between x, y, and z.
% b. Note that negative values x, y, and z have no meaning here. Find the allowable ranges for x, y, and z.
% c. Suppose the profits for each product are $200, $300, and $100 for products 1, 2, and 3,
% respectively. Find the values of x, y, and z to maximize the profit.
% d. Suppose the profits for each product are $200, $500, and $100 for products 1, 2, and 3,
% respectively. Find the values of x, y, and z.

% Q3 answer ---> [6x + 2y + 10z = 35] -- [3x + 5y + 2z =40]
%
% 6 2 10 | 35
% 3 5 2  | 40


A = [6 2 10; 3 5 2];
b = [35 40]';

% testing for uniquness
rank(A)
rank([A b])

% rank(A) == rank([A b]) and rank(A) < n there infinite many solutions
% exists, and the matrix does not have unique solutions. 2 free variables
% that can be expresses in terms of the other variable.

% Using RREF to view this relationship
rref([A,b])

% ans =

%      1.0000         0    1.9167    3.9583
%      0    1.0000   -0.7500    5.6250

% x + 1.92z = 3.96 ---> x = 3.96 - 1.92z
% y - 0.75z = 5.63 ---> y = 5.63 + 0.75z



pot = pinv(A)*b;


% B.)

% B = [200 300 100];
% rank(A)
% rank([A B])
