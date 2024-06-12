clear
clc
%------------------------------------
% Question 2
%------------------------------------

% Values
a = 4; b = 24; c = 100; % You can change the values

ROOT1 = -b + (sqrt(b^2 - (4*a*c)) / (2*a));
ROOT2 = -b - (sqrt(b^2 - (4*a*c)) / (2*a));

% Identify the real and imaginary numbers
if isreal(ROOT1) && isreal(ROOT2)
    disp(['Root 1 and 2 are real numbers: ',...
        num2str(ROOT1),',',num2str(ROOT2)])

elseif ~isreal(ROOT1) || ~isreal(ROOT2)
    disp(['Complex number(s) Found in the root: ',...
        num2str(ROOT1),',',num2str(ROOT2)])
else
end % This can be further broken-down to find the individual complex roots 

%------------------------------------
% Question 9
%------------------------------------

PRICE_A = [19,18,22,21,25,19,17,21,27,29]; 
PRICE_B = [22,17,20,23,24,18,16,25,28,27];

DAYS = PRICE_A < PRICE_B;
DAYS_BELOW = length(find(DAYS));

%------------------------------------
% Question 16
%------------------------------------

function y = popp (x)
if x < -1
    y = exp(x + 1);
elseif x >= -1 && x <5
    y = 2 + (cosd (x*pi)); % cosd() in degrees
elseif x >= 5
    y = (10 * (x-5)) + 1;

end 
end

x1= popp (-5); % Calling the function
x2 = popp (3);
% disp(['Vlaue for -5:', numstr (x1)]); --- Uncomment to view answer
% disp(['Vlaue for 3:', num2str(x2) ]); --- Uncomment to view answer

%------------------------------------
% Question 21
%------------------------------------
function [ANSWER] = func_xy(x,y)
    if (x >= 0) && (y >= 0)
        ANSWER = x + y;
    elseif (x >= 0) && (y <= 0)
        ANSWER = x - y;
    elseif (x < 0) && (y >= 0)
        ANSWER = (-x.^2).*y;
    elseif (x < 0) && (y <0)
        ANSWER = (-x.^2).*y.^2;
    end

end

a = func_xy(3,4); % Calling the Function
% disp(a) --- Uncomment to view answers

%------------------------------------
% Question 28
%------------------------------------
% a)

A = [3 5 -4; -8 -1 33; -17 6 -9];
for k = 1:size(A,1)
    for i = 1:size(A,2)
        D = A(k,i);
        if D >= 1
            b = log(A(k,i)) + 20;
            A(k,i) = b;
        end
    end
end

% disp(A) --- Uncomment to view answers

% b)
B = [3 5 -4; -8 -1 33; -17 6 -9];
C = (B >= 1);
B(C) = log(B(C)) + 20;
% disp(B) --- Uncomment to view answers