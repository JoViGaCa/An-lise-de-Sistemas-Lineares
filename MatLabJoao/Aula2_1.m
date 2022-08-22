% Aula 2 - Matlab
% João Vitor Garcia Carvalho

%% limpeza geral

close all
clc
clear all

%% Declarar uma função

t = 0:0.001:2;
f = 1; %Hz
w = 2*pi*f;
x1= sin(w*t);
N = length(x1);
x1_ruido = x1'+randn(N,1)*0.1;


figure
plot(t,x1_ruido)
th = 0.5;
x2 = ceifar(x1,th);

hold on
plot(t,x2,'--k')

%%
function y = ceifar(x, th)

N = length(x)
y = zeros(N,1)

for i=1:N
    if x(i) > th
       y(i) = th;
    elseif x(i) < -th
       y(i) = -th;
    else
       y(i) = x(i);
    end
end
end