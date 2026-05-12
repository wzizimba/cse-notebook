D=1/2; %transition 
x=linspace(0,1,200);
u=x-(exp(x/D)-1)/(exp(1/D)-1); %exact equation solution

%Plot
plot(x,u,'--','LineWidth',2,'Color',[0 0 0]);
xlabel('x');
ylabel('u');
title('Steady Convection-Diffusion')
grid on;
