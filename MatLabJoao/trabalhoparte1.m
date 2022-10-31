% Trabalho de Análise de Sistemas Lineares
% João Vitor Garcia Carvalho
% Iago
% Guilherme

%% limpeza geral

close all
clc
clear all

%%
%ler os audios e armazenar em um vetor
[audio, SampleA] = audioread('Audio.wav');
[ruido, SampleR] = audioread('Ruido.wav');

audio = audio(:,1);
dt = 1/SampleA;
t = 0:dt:(length(audio)*dt)-dt;

ruido = ruido(:,1);
dr = 1/SampleR;
r = 0:dr:(length(ruido)*dr)-dr;

% plotar os gráficos
figure
subplot(3,1,1);
plot(t, audio,'r');
grid on;
xlim([0 10]);
title('Audio limpo')
ylabel('Amplitude')
xlabel('Tempo (s)')


subplot(3,1,2);
plot(r,ruido,'--k');
grid on;
xlim([0 10]);
title('Ruido')
ylabel('Amplitude')
xlabel('Tempo (s)')

%Soma
N = length(audio);
result = zeros(N, 1);
for i=1:N
    result(i) = audio(i) + ruido(i);
end

noise = zeros(N,1);
for i=1:N
    noise(i) = ruido(i);
end

Snr = snr(result,noise);

subplot(3,1,3);
plot(t,result,'b');
grid on;
xlim([0 10])
%sound(result,SampleA);
title(sprintf('Audio Limpo + Ruido, SNR: %.2f', Snr))
ylabel('Amplitude')
xlabel('Tempo (s)')


%% modular o sinal

%multiplicar por uma função
t = 0:10/(length(result)):10-(10/length(result));

mult = 5*sin(t-2);

mod_sig = zeros(N,1);
for i=1:N
    mod_sig(i) = mult(i) * result(i);
end

figure
subplot(4,1,1);
plot(t,mod_sig, 'y--');
%sound(mod_sig,SampleA);
grid on
hold all
title('Resultado x Função Senoide')
ylabel('Amplitude')
xlabel('Tempo (s)')


%limitar amplitude

lim = zeros(N,1);
max = 0.4;

for i=1:N
    lim(i) = result(i);
    if(lim(i) > max)
        lim(i) = max;
    end
    if (lim(i) < -max)
        lim(i) = -max;
    end
end
subplot(4,1,2);
plot(t,lim, 'g--');
%sound(lim,SampleA);
grid on
hold all
title('Audio Limitado')
ylabel('Amplitude')
xlabel('Tempo (s)')

%inverter

inv = zeros(N,1);
for i=1:N
    inv(i) = result(N - i +1);
end

subplot(4,1,3);
plot(t,inv, 'r--');
%sound(inv,SampleA);
grid on
hold all
title('Audio Invertido')
ylabel('Amplitude')
xlabel('Tempo (s)')

%echo

echo = zeros(N,1);
for i=1:N
    if(i>14000)
        echo(i) = result(i) + 0.5*result(i-14000);
    end
end

subplot(4,1,4);
plot(t,echo, 'k--');
%sound(echo,SampleA);
grid on
hold all
title('Audio Ecoado')
ylabel('Amplitude')
xlabel('Tempo (s)')

%% Fitlragem do Áudio com ruído utilizando Média Móvel

h = medial_movel(5);
filtered_signal = conv(h,result);
time1 = 1 : 161801;

figure
subplot(2,1,1);
plot(t,result,'b');
grid on;
xlim([0 10])
%sound(result,SampleA);
title(sprintf('Audio Limpo + Ruido, SNR: %.2f', Snr))
ylabel('Amplitude')
xlabel('Tempo (s)')

subplot(2,1,2)
plot(time1, filtered_signal,'r');
grid on
xlim([0 17*10^4])
ylim([-1 1])
title('Média móvel aplicada no Áudio + Ruído')
ylabel('Amplitude')
xlabel('Tempo (s)')
%sound(filtered_signal,SampleA);


%% Otimização do filtro

M = 50:10:5000;
res = zeros(length(M), 1);
k = 1;
E = zeros(length(M),1);

for i=M
    fprintf('%d\n', i);
    h = medial_movel(i);
    filtered_signal = conv(h,result);
    for j=1:length(result)
        res(j) = result(j)-filtered_signal(j);
    end
    E(k) = sum(res.^2);
    k= k+1;
end

min = min(E);

figure
plot(M, E,'k');
grid on
xlim([0 5000])
ylim([1350 1600])
title(sprintf('Melhor janela de filtro, Melhor = %d', min));
ylabel('Erro (Energia do Residuo)')
xlabel('Tamanho da Janela (M)')


%% espectro de frequência (Fourier) do sinal original
[audio, SampleA] = audioread('Audio.wav');

%sound(audio, SampleA); %reproduz o audio.
L = size(audio,1); %tamanho do vetor
figure
plot(audio)
espectro = abs(fft(audio));
espectro = espectro(1:L/2);
freq = SampleA*(0:(L/2)-1)/L;
plot(freq,espectro); 
grid on
hold all
title('Espectro de frequencia sinal original')
ylabel('Frequencia (Hz)')
xlabel('Espectro')


%% Média móvel
%retorna a reposta ao impulso de um filtro de média móvel
% de ordem N. A partir da respostao ao impulso, calcula a saída
% deste filtro, para qualquer tipo de entrada, usando a operação
% de convolução

function h = medial_movel(N)

    n = 2*N;
    impulse = [1 zeros(1,n)];
    h = [zeros(1,n)];
    h(1) = 1/(N+1);
    h_aux = [zeros(1,n)];
    
    for i = 2:n
        for j = 1:N
            if j < i
                h_aux(i) = impulse(i) + impulse(i-j);
                h(i) = h(i) + h_aux(i);
            else
                break;
            end
        end
    end

    for i = 2:n
        h(i) = h(i)/(N+1);
    end

end