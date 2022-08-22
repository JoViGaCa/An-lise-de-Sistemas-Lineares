% Aula 2 - Matlab
% João Vitor Garcia Carvalho

%% limpeza geral

close all
clc
clear all

%% Declarar uma função

t = 0:0.01:2; % de 0 até 2 de 0.01 em 0.01
A = 1;
f = 1; %Hz
w = 2*pi*f;
fi = 0;
B = 0;
y = A*sin(w*t + fi) + B;

w = 3*t - 3 ;

subplot(2,1,1)
plot(t,y, 'r')
hold all
plot(t,w,'b');
legend({'x1(t) = sen(2πt)', 'x2(t) = 3t -3'})
title('Adição: y = x1 + x2')
ylabel('Amplitude')
xlabel('Tempo (s)')
ylim([-3 3])
yticks(-3:1:3)
grid on

% segundo gráico

z = y+w;

subplot(2,1,2)
plot(t, z, 'k');
hold all
plot(t,y, 'r--')
hold all
plot(t,w,'b--');

legend({'y(t) = X1 = x2','x1(t) = sen(2πt)', 'x2(t) = 3t -3'})
ylabel('Amplitude')
xlabel('Tempo (s)')
ylim([-3 3])
yticks(-3:1:3)
grid on



