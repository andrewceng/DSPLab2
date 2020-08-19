bb = (b/(1+b)).*[1,0,-1];
a = [1, -2*cos(wo)/(1+b), (1-b)/(1+b)];
n = linspace(0,100,150);
x = @(n) sin(w1*n);
xn = x(n);
y = filter(bb,a,x(n));
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