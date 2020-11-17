function [lambda,T,a1, a2] = ftir_metrics(inputArg1,inputArg2)
clear; clc; close all;

A = readmatrix('PCM-Filter.CSV');
lambda = A(:,1);
T = A(:,2); % transmittance

% Find the half max value.
halfMax = (min(T) + max(T)) / 2;
% Find where the data first drops below half the max.
index1 = find(T >= halfMax, 1, 'first');
% Find where the data last rises above half the max.
index2 = find(T >= halfMax, 1, 'last');
%fwhm = index2-index1 + 1; % FWHM in indexes.
% OR, if you have an x vector
fwhmx = lambda(index2) - lambda(index1);

% Maximum transmittance
maxT = max(T);
minT = min(T);

% Find the center wavelength
lambda1 = lambda(index1); lambda2 = lambda(index2);
lambda0 = 2*lambda1*lambda2/(lambda1 + lambda2); % center wavlength

for i = 1:find(T == maxT)
    if T(i) > 0.1
       a1 = lambda(i-1); 
       break
    end
end
for i = find(T == maxT) + 1: length(T)
    if T(i) <= 0.1
        a2 = lambda(i);
        break
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Plotting
plot(lambda, T,'k');
xlim([min(A(:,1)), 4]);
xlabel('Wavelength ({\mu}m)');
ylabel('% Transmittance'); hold on;

plot(lambda(T == maxT),maxT,'or'); % peak transmittance

plot([lambda0 lambda0], [minT maxT],'b'); % center wavelength

plot([a1, a1], [0 maxT],'g'); % attenuation
plot([a2, a2], [0 maxT],'g'); % attenuation

% FWHM
plot([lambda1 lambda1], [minT T(lambda == lambda1)],'m') % First half-max
plot([lambda2 lambda2], [minT T(lambda == lambda2)],'m') % Second half-max

legend('Transmittance',['Peak Transmittance: ', num2str(maxT), '%'],...
    ['Center Wavlength: ', num2str(lambda0), ' {\mu}m'], 'Attenuation',...
    '','FWHM: 0.065 {\mu}m','')
end

