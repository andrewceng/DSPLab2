wo = 0.2*pi;
b = 0.1;
w1 = 0.3*pi;
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
title('peak filter, w_1 = 0.3pi')
legend('|H(w)|','peak','side','dBLeft','dBRight')


t = @(w) (-1./w).*atan((cos(w)-cos(wo))./(b*sin(w)));
tw = t(w);
figure;
plot(w./pi,tw,'Color','b');
w0n = t(wo);
w1n = t(w1);
hold on
grid on
plot(wo/pi,w0n,'ro');
plot(w1/pi,w1n,'rs');
axis([0 1, -12 4]);
title('phase delay, T(w) = -arg(H(w))/w');
xlabel('w/pi');
ylabel('T(w)');
legend('T(w)','peak','side','Location','southeast');


bb = (b/(1+b)).*[1,0,-1];
a = [1, -2*cos(wo)/(1+b), (1-b)/(1+b)];
n = linspace(0,100,150);
x = @(n) sin(w1.*n);
xn = x(n);
y = filter(bb,3*a,x(n));
figure;
stem(n,xn,'.','color','blue')
hold on
stem(n,y,'.','color','red')
legend('x(n)','y(n)','location','south')
title('input and output signals')
xlabel('time samples, n')
axis([0 100, -1.2 1.2])


figure;
plot(n,xn,'color','blue')
grid on
hold on
plot(n,y,'color','red')
legend('x(n)','y(n)','location','south')
title('input and output signals')
xlabel('time samples, n')
axis([0 100, -1.2 1.2])

tww = t(w1)