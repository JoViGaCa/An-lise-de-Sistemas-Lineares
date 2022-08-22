% Aula 2 - Matlab
% João Vitor Garcia Carvalho

%% limpeza geral

close all
clc
clear all

%% Declarar uma função

t = 0:0.001:2;
A = 1;
f = 1; %Hz
w = 2*pi*f;
fi = 0;
B = 0;
y = A*sin(w*t + fi) + B;


figure
plot(t,y)
th = 0.5;
y = ceifar(y,th);

hold on
plot(t,y,'--k')

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


