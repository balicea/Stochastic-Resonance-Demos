[NOISE,y,z] = three-phase-noise(m,n)

%% creates a three-phase noisy signal from white noise (zero-mean sine wave) and black noise (rectified, 
%% idealized model -- 1/f^3).
%% m = number of timepoints for white and black noise.
%% n = power of black noise model (can change for other types of 1/f noise).

x = 1:m;
   for i = 1:m
   x(i) = x(i)^n;
end

%% black noise generation.

y = 1./x;
z = sin(1:1000);

%% white noise generation.

y = shake(y);
z = shake(z);

%% events are independent w.r.t. time. Use with shake.m.

NOISE = conv(y,z);
t1 = 1:m;
t2 = 1:length(NOISE);

%% create three-phase noisy timeseries.

plot(t1,y)
plot(t1,z)
plot(t2,NOISE)

%% plot all noise timeseries.