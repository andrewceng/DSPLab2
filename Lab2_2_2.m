t = @(w) (-1./w).*atan((cos(w)-cos(wo))./(b*sin(w)));
tw = t(w)
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