% Aula 1 - Matlab
% João Vitor Garcia Carvalho

%% limpeza geral

close all
clc
clear all

%% Declarar uma função

t = 0:0.01:2; % de 0 até 2 de 0.01 em 0.01
A = 4;
f = 1; %Hz
w = 2*pi*f;
fi = 0;
B = 0;
y = A*sin(w*t + fi) + B;

figure
subplot(2,1,1)
plot(t,y, 'r*--')
grid on

t = 0:0.01:2; % de 0 até 2 de 0.01 em 0.01
A = 6;
f = 1; %Hz
w = 4*pi*f;
fi = 0;
B = 0.76;
y = A*sin(w*t + fi) + B;
subplot(2,1,2)
plot(t,y, 'y^--')
ylim([-7 45])
grid on


hold all
plot(t,y.^2)

legend({'Função 1: sen(t)', 'Função 2: sen^2(t)'})
title('Título dahora')
ylabel('Amplitude')
xlabel('Tempo (s)')


