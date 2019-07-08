clear all; 

sigma=10; b=8/3; %r=28; y0=[1, 4, 1, 3, 2, 1.5];
r = 28 + rand()*2-1 ; y0=rand(1,6)*10-5;

ep = 0:0.20:20; % coupling strength
throw = 10^4; % transients
keep = 4096; % data to keep

for i = 1:length(ep)
if i > 1
    M = csvread('lorenz_data11.csv');
else 
    M = [];
end

%y(1)=x1,y(2)=y1,y(3)=z1, y(4)=x2,y(5)=y2,y(6)=z2
lorenz = @(t,y) [sigma*(y(2)-y(1))+ ep(i)*(y(4)-y(1));
                 r*y(1)-y(2)-y(1)*y(3);
                 y(1)*y(2)-b*y(3);
                 sigma*(y(5)-y(4));
                 r*y(4)-y(5)-y(4)*y(6);
                 y(4)*y(5)-b*y(6)];
             
[t,y] = ode45(lorenz, 0:0.005:(throw+keep-1)*0.03, y0); 
csvwrite('lorenz_data11.csv', [M y(6*throw:6:end,1) y(6*throw:6:end,4)]); 

%to change precision use dlmwrite
%%dlmwrite('lorenz_data11.csv', [M y(6*throw:6:end,1) y(6*throw:6:end,4)], 'delimiter', ',', 'precision',10);

end