%%
close all
clear

%% variavel simbólica

syms x;
syms pi;
syms f3(t);
syms u(t);
%A)
 f3(t) = 0.2*sin(2*t)+1;
 fplot(f3,[0 20])

%B)
A = laplace(f3(t));

[n,d] = numden(A);
Atf =  tf(sym2poly(n),sym2poly(d));

figure
impulse(Atf,10);

%C)
H = tf([0 5], [1 1 2]);

figure
impulse(H,10, 'k')
hold
step(H,10)

%D)
figure
pzmap(H);

%E-F)
Y = H*Atf;
figure
impulse(Atf, 100)
hold
impulse(Y,100, 'r')

%G)
figure
bode(H,'k')

%H)
figure
bode(Y)
