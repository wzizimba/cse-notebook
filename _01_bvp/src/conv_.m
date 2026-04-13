% Computes L^2 error of bvp for second order convergence of the
% central finite difference

clc;
% Grid size ranges
N_ = 2 .^(2:10);
c = length(N_);
errors = zeros(c, 1);

for idx = 1:c
  N = N_(idx);
  h = 1/N;
  x = (h:h:1-h)';

  % stiffness matrix
  n = N-1;
  e = ones(n, 1);
  A = (1/h^2)*spdiags([-e, 2*e, -e], [-1, 0, 1], n, n);

  % function and analytic sol
  f = sin(pi*x);
  u_ = sin(pi*x)/(pi^2);
  u = A\f; % numerical sol
  errors(idx) = sqrt((1/N)*sum((u-u_).^2)); %L^2 errors
end

p = polyfit(log(N_(:)), log(errors), 1);
slope = p(1);

%Log plot
figure('visible', 'on');
loglog(N_, errors, 'ro-', 'MarkerFaceColor', 'b', ...
       'MarkerSize', 6, 'LineWidth', 1.5);
hold on;
fitLine = exp(polyval(p, logN));
loglog(N_, fitLine, 'k--', 'LineWidth', 2);
xlabel('N (number of grid intervals)', 'FontSize', 13);
ylabel('L^2 Error', 'FontSize', 13);
title('L^2 Norm Decay for -u'''' = sin(πx)', 'FontSize', 13);
legend({'L2 error', sprintf('Fit: slope = %.3f', slope)}, ...
       'Location', 'SouthWest', 'FontSize', 11);
grid on;


% Slope
text(N_(end)*0.4, errors(end)*10, ...
     sprintf('Slope = %.3f\n', slope), ...
     'FontSize', 11, 'Color', 'b', 'BackgroundColor', 'white');
