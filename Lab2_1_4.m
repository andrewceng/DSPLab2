w = linspace(0,pi);
Hwmag = abs(Hw(w));
figure;
plot(w/pi,Hwmag)
grid on
hold on
plot(w1/pi,w1out,'ro')
hold on
plot(w2/pi,w2out,'ro')
hold on
plot(w3/pi,w3out,'ro')
axis([0 1, 0 800])
title('FIR notch filter')
xlabel('w/pi')
ylabel('magnitude')
legend('|H(w)|','w1,w2,w3')


b = [0.984011, -3.535954, 5.113142, -3.535954, 0.984011];
a = [1, -3.557832, 5.093644, -3.487380, 0.960788];
w = linspace(0,pi,10000);
Hmag1 = abs(freqz(b,a,w));
figure;
plot(w/pi,Hmag1)
grid on
title('cascade of IIR notch filters')
hold on
plot(w1/pi,w1out,'ro')
hold on
plot(w2/pi,w2out,'ro')
hold on
plot(w3/pi,w3out,'ro')
axis([0 1, 0 800])
xlabel('w/pi')
ylabel('magnitude')
legend('|H(w)|','w1,w2,w3')
axis([0 1, 0 2])


n = 1:600;
s = @(n) sin(w2*n);
v = @(n) sin(w1*n)+sin(w3*n);
x = @(n) s(n)+v(n);
h = [Bw1Val,Bw2Val,Bw3Val,Bw2Val,Bw1Val];
h = impz(b,a,301);
y = filter(h,1,x(n));
figure;
plot(n,x(n),'--','color','green')
hold on;
plot(n,s(n),'color','blue')
plot(n,y,'color','red')
grid on;
title('input and output signal')
xlabel('time samples, n')
axis([0 300, -3 3])
legend('x(n)','s(n)','y(n)','location','south')


figure;
plot(n,v(n),'--','color','green')
yvn = filter(h,1,v(n));
hold on
plot(n,yvn,'color','red')
title('filtered interference')
xlabel('time samples, n')
legend('v(n)','y_v(n)')
axis([0 600, -3 3])


n40 = log(0.01)/log(max(abs(roots(a)))) 
%This value of 460.5267 agrees with yv(n)
h = impz(b,a,601);
summationHsquare = sum(h.^2);
noiseRatio = sqrt(summationHsquare)
%The noise ratio is close to 1. This means it's constant and it does not
%amplify the signal at all