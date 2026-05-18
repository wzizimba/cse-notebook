% Convection-Diffusion: -Du''+u'=1, u(0)=u(1)=0
% Exact solution: u(x) = x-(exp(x/D)-1)/(exp(1/D)-1)

D=1/25;
n_=[10,20,40]; %mesh sizes
x_=linspace(0,1,500);
u_=x_-(exp(x_/D)-1)/(exp(1/D)-1);%exact solution

figure('visible','on');
plot(x_,u_,'k-','LineWidth',2);
xlabel('x');
ylabel('u(x)');
title('Exact Solution, D = 1/25');
grid on;


