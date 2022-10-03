%% clear

close all
clc
clear all

%% exemplo recursão

u = [0 1 1 1 1 1 1 1 1 1 1 1];
N = length(u);

x = zeros(N,1);
for ni=1:N
  x(ni) = u(ni) * (0.5)^(ni-2);
end



y = zeros(N,1);
y(1) = 8; %C.I

for ni=1:N-1
y(ni+1) = 0.25*y(ni) + x(ni+1);
end

n = -1:(N-2);

%figure
%subplot(2,1,1)
%plot(n,x);
%xlabel('n');
%ylabel('x[n]');
%stem(n,x,'filled','r');
%grid on
%ylim([0 2])


figure
subplot(2,1,1)
plot(n,y);
title('Recursão');
xlabel('n');
ylabel('y[n]');
stem(n,y,'filled','k');
grid on
ylim([0 8])

%% comparação

y_ex = zeros(N,1);


for ni=1:N
    y_ex(ni) = (1*((0.25)^(ni-2)) + 2*((0.5)^(ni-2)));
end


subplot(2,1,2)
title('Exercício')
xlabel('n');
ylabel('y[n]');
stem(n,y_ex,'filled','r');
grid on
ylim([0 9])


