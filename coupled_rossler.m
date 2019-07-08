clear all; 
alpha=6; y0=rand(1,6)*10-5;  %y0 = [1,4,1,3,2,5]

C = 0:0.1:8; % coupling strength
throw = 10^4; % transients
keep = 4096; % data to keep

for i = 1:length(C)

if i > 1
    M = csvread('rossler_data11.csv');
else 
    M = [];
end

    
%y(1)=x1,y(2)=x2,y(3)=x3, y(4)=y1,y(5)=y2,y(6)=y3
rossler = @(t,y) [-alpha*(y(2)+y(3));
                 alpha*(y(1)+0.2*y(2));
                 alpha*(0.2+y(3)*(y(1)-5.7));
                 10*(-y(4)+y(5));
                 28*y(4)-y(5)-y(4)*y(6)+C(i)*y(2)^2;
                 y(4)*y(5)-(8/3)*y(6)];

[t,y] = ode45(rossler, 0:0.005:(throw+keep-1)*0.03, y0); 
csvwrite('rossler_data11.csv', [M y(6*throw:6:end,2) y(6*throw:6:end,5)]); 
end