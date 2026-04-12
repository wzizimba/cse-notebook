% Solution to boundary value problem:
%               -u''(x) = sin(x.pi), x mem (0,1)
%                u(0) = 0, u(1) =0
% Compared with analytic solution u(x) = (1/pi^2)(sin(x.pi))
%
%                            ---
clc;
% Parameters
N = 70; % grid intervals
h = 1/N; % grid spacing
x = (h:h:1-h)'; % column vector of inner grid points (x_i)

%% For system Au = f

% Matrix A
n = N-1; % interior points
e = ones(n,1);
A = (1/h^2)*spdiags([-e, 2*e, -e], [-1, 0, 1], n, n);

% Function
f = sin(pi*x);
u_ = sin(pi*x)/pi^2; %% Analytic sol

%% System sol
u = A \ f;

%% Plot
figure('visible','on')
xp = [0;x;1];
up = [0;u;0];
u_p = [0;u_;0];
plot(xp, u_p,  'k-', 'LineWidth', 2.5); hold on;
plot(xp, u_p, 'r--', 'LineWidth', 1.5);
xlabel('x', 'FontSize', 13); ylabel('u(x)', 'FontSize', 13);
title(sprintf('Analytical and Numerical Solution (N = %d)', N),'FontSize', 13)
legend({'Analytical: sin(\pix)/\pi^2', ...
        sprintf('Numerical FD (h = 1/%d)', N)}, ...
        'Location', 'NorthEast', 'FontSize', 11);
grid on;
set(gca, 'FontSize', 11)
