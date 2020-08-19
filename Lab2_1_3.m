n = linspace(1,100);
s = @(n) sin(w2*n);
v = @(n) sin(w1*n)+sin(w3*n);
x = @(n) s(n)+v(n);
h = [Bw1Val,Bw2Val,Bw3Val,Bw2Val,Bw1Val];
y = filter(h,1,x(n));
figure;
plot(n,x(n),'--','color','green')
hold on;
plot(n,s(n),'color','blue')
plot(n,y,'color','red')
grid on;
title('input and output signals')
xlabel('time samples, n')
axis([0 100, -3 3])
legend('x(n)','s(n)','y(n)','location','south')

s2 = @(n) sin(w2*(n-2)).*(n>=2);
n = 0:1:9;
sdata=s(n);
s2data=s2(n);
ydata = filter(h,1,x(n));
vdata=v(n);
yvdata=filter(h,1,v(n));
all = [n;sdata;s2data;ydata;vdata;yvdata];
fprintf('n\ts(n)\ts(n-2)\t  y(n)\t\tv(n)\t  y_v(n)\n')
fprintf('-----------------------------------------------------------------\n')
fprintf('%d\t%1.4f\t%1.4f\t  %3.4f\t%2.4f\t %3.4f\n',all)