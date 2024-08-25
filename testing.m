% x=0:2:10 ;
% y= [3.8, 3.5, 2.7, 2.1, 1.2, 0.7];
% subplot(4,1,1)
% loglog(x,y)
% 
% subplot(4,1,3)
% semilogy(x,y)
% 
% subplot(4,1,4)
% plot(x,y)
% 
% gtext({'loglog'; 'semilogx'; 'semilogy'; 'linear'});
% 
% polyfit(x,y,1)

% x = 0:0.1:35;
% y = 0.4 * sqrt(1.8.*x);
% g = -6:0.01:6;
% f = [3 2 -100 2 -7 90];
% 
% % 
% plot(x,y, 'g*', g,polyval(f,g),  ':r'), legend('1st','2nd')
% xlabel('Distance in miles'), ylabel('Height (miles)')
% % gtext('sinx')
% gtext([sin(x);cos(x)])
% title('OVHoe')
% 
% xticks([5 10 15 20 25 30 35 40 45 50 55]);
% 
% b = 0:0.5:6;
% yticks(0:0.1:3.5)

% x = -6:0.01:6;
% y = [3 2 -100 2 -7 90];

% plot(x, polyval(y,x));

% x = 10:100:10000 ;
% y = x.^3 ;
% 
% subplot(3,1,1)
% loglog(x,y)
% 
% subplot(3,1,2)
% semilogx(x,y)
% 
% subplot(3,1,3)
% semilogy(x,y)
% 
% gtext({'loglog'; 'semilogx'; 'semilogy'});

% 
% x = 0:0.01:2*pi;
% y =sin(x);
% 
% plot(x,y)
% set(gca, 'XTick', 0:pi/2:2*pi, 'YTick', -1:0.2:1)

% x = 0:0.01:2*pi;
% y = 2*x;
% 
% subplot(1,2,1)
% polarplot(x,y)
% 
% subplot(1,2,2)
% plot(x,y)
% 
% x = -1:0.01:1;
% y = x.^3;
% 
% % plot(x,y)
% % set(gca, 'XTick', -1:0.25:1, 'YTick', -1:.2:1)
% 
% stairs(x,y)
% stem(x,y)
% polarplot(x,y)
% errorbar(x,y)

% x=[1 2 3 4 5] ;
% y=[6 7 8 9 10];
% 
% y1 = sqrt(x);
% 
% plotyy(x,y,x,y1)

% fimplicit(@(x,y) x.^2 - y.^2 -1, [-2 2 -4 4])


% t = 0:pi/50:10*pi;
% x = exp(-0.05*t).*sin(t);
% y= exp(-0.05*t).*cos(t);
% plot3(x,y ,t),
% grid on
 % 
 % [X,Y] = meshgrid(-2:0.1:2);
 % Z = X.*exp(-((X-Y.^2).^2+Y.^2));
% subplot(1,2,1)
% surfc(X,Y,Z)
% 
% subplot(1,2,2)
% contour(X,Y,Z)
% waterfall(X,Y,Z)


% f = @(x,y,z) x.^2 + y.^2 - z.^2;
% 
% interval = [-5 5 -5 5 0 5];
% 
% fimplicit3(f,interval)

% 
x = 0:1:9;
t = [130 115 110 90 89 89 95 100 110 125];
% % 
% subplot(3,1,1)
% semilogy(x,t)
% 
% subplot(3,1,2)
% loglog(x,t)
% 
% subplot(3,1,3)
% plot(x,t)

% x = 1:9;
% t = [5 6 10 20 28 33 34 36 42];
% DRY method *****
% for k = 1:4
%     p = polyfit(x,t,k);
% 
%     if k == 1
%         w = p(1)*x + p(2)
%     elseif k == 2
%         w = p(1)*x.^2 + p(2)*x + p(3)
%     elseif k == 3
%         w = p(1)*x.^3 + p(2)*x.^2 + p(3)*x + p(4)
%     elseif k == 4
%         w = p(1)*x.^4 + p(2)*x.^3 + p(3)*x.^2 + p(4)*x + p(5)
%     end
% 
%     subplot(4,1,k)
%     plot(x,t,'o',x,w)
% end



% % Shorter Version
% for k = 1:4
%      p = polyfit(x,t,k);
%      w = polyval(p,x);
% 
%      subplot(4,1,k)
%      plot(x,t,'o',x,w)
% end


for k = 1:4
    ceoff = polyfit(x,t,k)
    J(k) = sum((polyval(ceoff,x)-t).^2)
end
% p1 = polyfit(x,t,1);
% p2 = polyfit(x,t,2);
% p3 = polyfit(x,t,3);
% p4 = polyfit(x,t,4);
% 
% w1 = p1(1)*x + p1(2);
% w2 = p2(1)*x + p2(2);
% w3 = p3(1)*x + p3(2);
% w4 = p4(1)*x + p4(2);
% 
% subplot(4,1,1)
% plot(x,t,'o',x,w1,'b')
% 
% subplot(4,1,2)
% plot(x,t,'o',x,w2)
% 
% subplot(4,1,3)
% plot(x,t,'o',x,w3)
% 
% subplot(4,1,4)
% plot(x,t,'o',x,w4)


% 
% func= p(1)*x+p(2);
% plot(x,t,'o',x,func)


% time = [0 620 2266 3482];
% temp = [145 130 103 90];
% temp = temp - 68;
% 
% subplot(3,1,1)
% semilogy(time,temp)
% 
% subplot(3,1,2)
% loglog(time,temp)
% 
% subplot(3,1,3)
% plot(time,temp)
% 
% p = polyfit(time, log10(temp), 1);
% 
% m = p(1);
% b = 10^p(2);

% T-68 = b(10)^mt
% 
% t_120 = (log10(120-68) - log10(b))/m;
% 
% t = 0:10:4000;
% T = 68 + b*(10).^(m*t);
% 
% subplot(2,2,3)
% plot(t,T-68,time, temp, 'o',t_120,120-68,'+')
% 
% subplot(2,2,4)
% plot(t,T,time, temp+68, 'o',t_120,120,'+')


% x = 0:5;
% y = [0 1 60 40 41 47];
% log_x = log10(x);

% for k =1:4
    % p = polyfit(log10(x), log10(y), k);
    % 
    % log_scale = polyval(p, log_x);
    % w = 10.^log_scale;
    % 
    % subplot(4,1,k)
    % loglog(x,w)
% end
% x = 1:9;
% y = [5 6 10 20 28 33 34 36 42];
% my = mean(y);
% 
% for k = 1:4
%     ceof = polyfit(x,y,k);
%     J(k) = sum((polyval(ceof,x)-y).^2);
% 
%     S(k) = sum((y -my).^2);
%     R(k) = 1 - J(k)/S(k);
% end

% x = [0 5 10];
% y = [0.4 9.7 20];
% 
% p = polyfit(x,y,1);
% 
% polyval(p,x)
% 
% w = p(1)*x + p(2);
% 
% plot(x,y,'o',x,w)

% y=[243 236 389 628 143 417 205 ...
%     404 464 605 137 123 372 439 497 ...
%     500 535 577 441 231 675 132 196 ...
%     217 660 569 865 725 457 347];
% figure
% histogram(y,'Binwidth',50)
% ylabel ('Absolute frequency')
% xlabel ('bin widths')
% title('absolute frequency histogram')
% 
% figure
% histogram(y,'Binwidth',100)
% ylabel ('Absolute frequency')
% xlabel ('bin widths')
% title('absolute frequency histogram')
% 
% figure
% histogram(y,'Binwidth',200)
% ylabel ('Absolute frequency')
% xlabel ('bin widths')
% title('absolute frequency histogram')
% 
% %finding the better bin width using mean and standard deviation (std)
% ymean=mean(y);
% ystd=std(y);
% xlower = ymean - ystd;
% xupper = ymean + ystd;
% std_lower= ymean - (2*ystd);
% std_upper= ymean + (2*ystd);


% t = [0 620 2266 3482];
% T = [145 130 103 90];
% 
% Temp = T - 68;
% % 
% % figure
% % plot(t,Temp)
% % 
% % figure
% % semilogy(t,Temp)
% 
% p = polyfit(t,log10(Temp), 1);
% 
% w = p(1)*t + (10.^p(2));


% x = 0:0.01:2*pi;
% y = 2*x.^2;
% polarplot(x, y, 'r._x')
% title('Polar plot of 2x^2')
% ylabel ('2x^2')
% xlabel('x_axis')

% f1 + 0 + 0 + f4 = 300
% f1 + f2 + 0 + 0 = 500
% 0 + f2 + f3 + 0= 1000
% 0 + 0 +f4 + f3 = 800

% A = [1 0 0 1; 1 1 0 0; 0 1 1 0; 0 0 1 1];
% b =[300 500 1000 800]';
% 
% rank(A)
% rank([A b])
% 
% det(A) % zero
% 
% answer = pinv(A)*b;
% 
% 
% mu = 69.3;
% std = 1.96;
% 
% b = 68;
% 
% % P(men <= b)
% p = 0.5*( 1 + erf((b-mu)/(std*sqrt(2))));
% 
% 
% % P(a2<= men <=a1)
% a1 = mu + 3;
% a2 = mu - 3;
% 
% p1 = 0.5 * (erf((a1 - mu)/(std*sqrt(2))) - erf(((a2 - mu)/(std*sqrt(2)))));


