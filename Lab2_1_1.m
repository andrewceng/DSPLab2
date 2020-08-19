w1 = 0.05*pi;   %Value of w1
w2 = 0.1*pi;    %Value of w2
w3 = 0.2*pi;    %Value of w3
syms b1 b2 b3
Bw1 = 2*b1*cos(2*w1) + 2*b2*cos(w1) + b3 == 0;
Bw2 = 2*b1*cos(2*w2) + 2*b2*cos(w2) + b3 == 1;
Bw3 = 2*b1*cos(2*w3) + 2*b2*cos(w3) + b3 == 0;
solution = solve([Bw1, Bw2, Bw3], [b1, b2, b3]);
Bw1Val= double(solution.b1);
Bw2Val = double(solution.b2);
Bw3Val = double(solution.b3);
solution = [Bw1Val, Bw2Val, Bw3Val]
