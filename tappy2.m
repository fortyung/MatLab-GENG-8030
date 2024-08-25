R_range = linspace(0.01,5,100); % This range could be anything since it wasn't specified
[R_min, A_min] = fminbnd(@Areaa, 0.01, 5); % This range could be anything since it wasn't specified
h = (3*10)/(pi * R_min.^2);

V_value = (1/3)* pi * R_range.^2 * h;

plot(R_range,V_value); xlabel('r'), ylabel('V(r)')

% --------------
% 10 percent answer
% We have the minium value of R and A 
% Lets find the Amin x 10% increase

A_min_10percent = A_min * 1.1; % or Amin x 1.1
R_max_10percent = (R_min * A_min_10percent)/A_min;

% ------------ A(r) <= A10%
% so the min and max value of a that will not exceed A10%

disp(['Maxium radius for 10% increase: ', num2str(R_max_10percent)])
disp(['Minimum radius for 10% increase: ', num2str(R_min)])
