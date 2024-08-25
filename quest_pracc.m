clc, clear
% Data Input
x = [1 , 2 ,3 , 5 , 15 ,25 , 40 ,60 ];
x_range = 1:0.01:60; % Not necessary but for better results

y1 = [0.5 ,0.3 ,0.8 , 1 ,1.5 ,0.5 , 1 , 2];
y2 = [45 , 46 , 44.5 , 45 , 44.8 , 45.5 , 45 , 48];

y2_scaled = y2 / min(y2);



% User defined Input

% -------------------------------------------------------------------------------

user_PE = input('Please select 1 for Polynomial or 2 for Exponential fitting: \n');


user_order = input('Please select the order of the polynomial degree (1 or 2): \n');


% -------------------------------------------------------------------------------


if user_PE == 1 && (user_order == 1 || user_order == 2 ) % Ensures users give valid inputs

    %  Case 1 Polynomial
    [J1, J2, S1, S2, R1, R2, R2u] = polyyy(x, y1, y2, y2_scaled, x_range, user_order)

    elseif user_PE == 2 && (user_order == 1 || user_order == 2 ) % Ensures users give valid inputs

    %  Case 2 Exponential
    [J1, J2, S1, S2, R1, R2, R2u] = exxpo(x, y1, y2, (y2_scaled), x_range, user_order)
    % I added small error (1e+6) to the y2 scaled to avoid the log(0) error from
    % the scaled value

end


% Function for the polynomial
function [J1, J2, S1, S2, R1, R2, R2u] = polyyy(x, y1, y2, y2_scaled, x_range, order)
    
    % This function plots the 1st or 2nd order of the given set 1 & set 2 polynomial
    % and returns their J, S and R^2 values. 



    % Fitting Set1 
    p1 = polyfit(x, y1, order);
    w1 = polyval(p1, x_range); 


    % Fitting Set2 scaled
    p2 = polyfit(x, y2_scaled, order);
    w2 = polyval(p2, x_range);

    %  Note that you can use just x instead of x_range
    % Whatever option you decided to go with you MUST plot with that option.


    % Plotting

    % Set 1:
    subplot(1,2,1)
    plot(x, y1, 'o', x_range, w1);
    xlabel('x values');
    ylabel('Set 1 values')
    title(['Degree ' num2str(order) ' Polynomial: Set 1 vs x']);

    % Set 2 Scaled:
    subplot(1,2,2)
    plot(x, y2_scaled, 'o', x_range, w2)
    xlabel('x values')
    ylabel('Set 2 values')
    title(['Degree ' num2str(order) ' Polynomial: Set 2 vs x']);


    % getting the J, S and R^2 values for set 1 and set 2 (scaled) and R^2
    % for the unscaled.

    % set 1
    J1 = sum((polyval(p1, x) - y1).^2); 
    S1 = sum((y1 - mean(y1)).^2);
    R1 = 1 - J1/S1;
    % Note that we didn't use w1 because we used x_range in w1
    % Instead we used polyval(p1, x)
    

    % Scaled set 2
    J2 = sum((polyval(p2, x) - y2_scaled).^2);
    S2 = sum((y2_scaled - mean(y2_scaled)).^2); 
    R2 = 1 - J2/S2;
    % Note that we didn't use w2 because we used x_range in w2
    % Instead we used polyval(p2, x)


    % UnScaled set 2
    p2u = polyfit(x, y2, order); % Fitting Set2  Unscaled

    J2u = sum((polyval(p2u, x) - y2).^2);
    S2u = sum((y2 - mean(y2)).^2); 
    R2u = 1 - J2u/S2u;  

end


% Function for Exponential
function [J1, J2, S1, S2, R1, R2, R2u] = exxpo(x, y1, y2, y2_scaled, x_range, order)
    
    % This function plots the 1st or 2nd order Exponential for set 1 and 2
    % and returns their J, S and R^2 values. 


    % Fitting Set1 
    p1 = polyfit(x, log10(y1), order);
    w1 = polyval(p1, x_range);
    w1 = 10.^w1;

    % Fitting Set 2
    p2 = polyfit(x, log10(y2_scaled), order);
    w2 = polyval(p2, x_range);
    w2 = 10.^w2;

    % Note that you can use just x instead of x_range
    % Whatever option you decided to go with you MUST plot with that option.


    % Plotting

    % Set 1
    subplot(1,2,1)
    plot(x, y1, 'o', x_range, w1);
    xlabel('x values');
    ylabel('Set 1 values')
    title(['Degree ' num2str(order) ' Exponential: Set 1 vs x']);

    % Set 2 Scaled
    subplot(1,2,2)
    plot(x, y2_scaled, 'o', x_range, w2)
    xlabel('x values')
    ylabel('Set 2 values')
    title(['Degree ' num2str(order) ' Exponential: Set 2 vs x']);



    % Scaled set 1
    ww1 = 10.^(polyval(p1, x));
    J1 = sum( (ww1- y1).^2 ); 
    S1 = sum((y1 - mean(y1)).^2);
    R1 = 1 - J1/S1;
    
    % Scaled set 2
    ww2 = 10.^polyval(p2, x);
    J2 = sum((ww2 - y2_scaled).^2);
    S2 = sum((y2_scaled - mean(y2_scaled)).^2); 
    R2 = 1 - J2/S2;
        
    % UnScaled set 2
    p2u = polyfit(x, log10(y2), order);
    ww3 = 10.^polyval(p2u, x);

    J2u = sum(( ww3- y2).^2);
    S2u = sum((y2 - mean(y2)).^2); 
    R2u = 1 - J2u/S2u;  

    end


    % Feel free to adjust the functions to your liking 
