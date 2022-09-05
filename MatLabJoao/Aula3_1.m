% Aula 3 - Matlab
% João Vitor Garcia Carvalho

%% limpeza geral

close all
clc
clear all

%% criar um vetor com ruido

% awgn (add white gaussian Noise to signal)
t = 0:0.001:10;
T = 3;
w = pi*2/T;
y = sin(w*t);

SNR = -20;
y_noise = awgn(y,SNR);
figure
hold all;
plot(t,y_noise,'r')
plot(t,y, 'k','LineWidth',3)
M1 = 300;
M2 = 300;
y_mm = movingAverage(y_noise,M1,M2);
plot(t,y_mm,'b','LineWidth',2)






%% Convolução

h = ones(1,M1+M2+1)/(M1+M2+1);
y_conv = conv(y_noise, h,'same');
hold all
plot(t,y_conv,'c','LineWidth',2)
legend('Sinal com ruído', 'Sinal sem ruído', 'Filtro - Média Móvel', 'Convolução');


%% residuo: Original menos o filtrado
figure
residuo = y - y_conv;
plot(t,residuo);
ylabel('Erro')
xlabel('tempo')

%energia do erro, soma do sinal quadrado
e = sum(residuo.^2);


%%
function y = movingAverage(x,M1,M2)

N = length(x);
y = zeros(N,1);

for n = M1+1:N-M2
    soma = sum(x(n-M1:n+M2));
    y(n) = soma/(M1+M2+1);
end
end