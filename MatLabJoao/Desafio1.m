% Desafio 1 - Matlab
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

figure
plot(t,y, 'k--')
grid on

hold all
t = 0:0.01:2;
A = 2;
f = 1; %Hz
w = 2*pi*f;
fi = 0;
B = 0;
y = A*sin(w*t + fi) + B;
plot(t,y, 'r')

ylim([-3 3])


t = 0:0.01:2;
A = 0.5;
f = 1; %Hz
w = 2*pi*f;
fi = 0;
B = 0;
y = A*sin(w*t + fi) + B;
plot(t,y, 'b')

legend({'x(t) = sen(2πt)', 'x(t) = 2sen(2πt)', 'x(t) = 0.5sen(2πt)'})
title('Mudança de Escala: y = a*x')
ylabel('Amplitude')
xlabel('Tempo (s)')