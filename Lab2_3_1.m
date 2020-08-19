t = linspace(0,2);
xat = @(t) cos(2*pi*t) + 2*cos(8*pi*t);
xt = @(t) cos(2*pi*t) + cos(8*pi*t) + cos(12*pi*t);
xtt = xt(t);
xatt = xat(t);
sample = 0:0.1:2;
sampleOut = xat(sample);
figure;
plot(t,xtt,'--','color','red')
grid on
hold on
plot(t,xatt,'color','blue')
axis([0 2,-4 4])
title('f_s = 10kHz')
xlabel('t (msec)')
ylabel('x(t),x_a(t)')
hold on
plot(sample,sampleOut,'o','MarkerFaceColor','black')
legend('original','aliased','samples','location','south')
