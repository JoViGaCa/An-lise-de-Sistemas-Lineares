% Aula 2 - Matlab
% João Vitor Garcia Carvalho

%% limpeza geral

close all
clc
clear all


%%
w = pi/2;
A = 1;
a = 0.1;
t = 0:0.001:30;
z = zeros(length(t), 1)

x1 = exponencial(w,A,a)
figure
plot(t,x1,'--k')
hold on
plot(t,z,'k')
x2 = exponencialDisc(w,A,a)
hold on
t2= 0:1:30
stem(t2,x2,'r','filled')

%%
function y=exponencialDisc(w,A,a)
t = 0:1:30;

y = A*sin(w*t).*exp(-a*t);

end

%%
function y=exponencial(w,A,a)

t = 0:0.001:30;

y = A*sin(w*t).*exp(-a*t);

end