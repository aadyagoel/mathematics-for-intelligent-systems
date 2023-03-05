clear all, close all, clc

figure
set(gcf, 'Position', [1500 200 2000 1200])

%domain
L = pi; 
N = 1024;
dx = 2*L/(N-1); 
x = -L:dx:L; %defines a vector x going from -pi to pi with an interval of dx 

%hat function 
f = 0*x; %defines all elements of f as 0; *x so the number of elements of x = size of f 

f(N/4:N/2) = 4*(1:N/4+1)/N % defines f's domain from 1/4 of 1024 (256) to 512 as positive slope of 4 into N from 1:(N/4)+1

f(N/2+1:3*N/4) = 1-4*(0:N/4-1)/N % defines f's domain from 1/2 of 1024 +1 (513) to 3/4 of 1024 (768)s negative slope with N going from 0 to (N/4)-1 as usual

%the N in 4*(1:N/4+1)/N is so that f's value goes up, 4 is the slope and N keeps getting larger. 
% N changes uniformly when its going up in function 1 and when its going down in function 2 

% The second equation of f is defined as 1-4*(N-values) and not -4*(N-values) so that when the function starts going down it starts from
% the highest value (which is positive) and decrements with -4 as the slope; just -4*(N) would equal a negative value which would take f
% to the negative quadrant instead of it staying in the positive quadrant. 1 - the f value makes it positive, but decreasing. 
% 1-4*N here works because that is the highest point this graph reaches; - it's the highest point because both functions are divided by 
% 1024 - thus normalized (highest number will be (4*N/4)/N=1). If it wasn't normalized, the second equation would be 1024 - 4*(N) 

plot(x,f,'-k','LineWidth',3.5), hold on 
%this defines 0 to (1/4)-1 points of f as 0, 1/4 to 3/4 as the fs above and
%(3/4)+1 to 4/4 as 0 

%fourier series 
CC = jet(20) %this returns a colormap with 20 colors
A0 = sum(f.*ones(size(x)))*dx/pi %the first Ak A0 coefficient, B0 = 0 since sin(0) = 0 
%why f*vector x of ones? since ans will be f anyway. 

fFS = A0/2; 

for k=1:20
    A(k) = sum(f.*cos(pi*k*x/L))*dx/pi; %this returns the sum of the elements of the vector : f*cos; a scalar value since this is an inner product 
    B(k) = sum(f.*sin(pi*k*x/L))*dx/pi; 
    fFs = fFs + A(k)*cos(k*pi*x/L) + B(k)*sin(k*pi*x/L)%this is the final equation scaling the cos and sine functions 
    plot(x,fFs,'-','Color',CC(k,:),'LineWidth',2) %this plots each iteration of frequency k in a different color
    pause(.1) 
end 
