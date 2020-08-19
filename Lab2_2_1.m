wo = 0.2*pi;
b = 0.1;
w1 = 0.05*pi;
Hww = @(w) (j.*b.*sin(w))./(cos(w)-cos(wo)+j.*b.*sin(w));
w = linspace(0,pi,1000);
Hmag = abs(Hww(w));
w0Out = abs(Hww(wo));
w1Out = abs(Hww(w1));
dbleft = (cos(wo)+(b.*sqrt((b^2) + (sin(wo))^2)))./(1+(b^2));
dbright = (cos(wo)-(b.*sqrt((b^2) + (sin(wo))^2)))./(1+(b^2));
dbleftout = abs(Hww(dbleft));
dbrightout = abs(Hww(dbright));

figure;
plot(w./pi,Hmag)
grid on
hold on
plot(wo./pi,w0Out,'ro')
hold on
plot(w1./pi,w1Out,'rs')
hold on
plot(dbleft./pi, dbleftout,'bo') %got the wrong answer
hold on
plot(dbright./pi, dbrightout,'blacko')
xlabel('w/pi')
ylabel('magnitude')
title('peak filter, w_1 = 0.05pi')
legend('|H(w)|','peak','side','dBLeft','dBRight')