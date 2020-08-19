w = linspace(0, 0.25*pi);
Hw = @(w) exp(-2.*j.*w).*(2.*Bw1Val.*cos(2.*w) + 2.*Bw2Val.*cos(w)+ Bw3Val);
w1out = abs(Hw(w1));
w2out = abs(Hw(w2));
w3out = abs(Hw(w3));
Hwmag = abs(Hw(w));
plot(w./pi,Hwmag)
grid on
xlim([0, 0.25]);
hold on
plot(w1/pi,w1out,'ro')
hold on
plot(w2/pi,w2out,'ro')
hold on
plot(w3/pi,w3out,'ro')
ylim([0 4]);
title('FIR notch filter')
xlabel('w/pi')
ylabel('magnitude')
legend('|H(w)|','w1,w2,w3')