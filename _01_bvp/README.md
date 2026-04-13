The programs in this folder compute the solution to the boundary value problem:

$$
\begin{cases} 
-u''(x) = f(x) = \sin(\pi x), & x \in (0, 1), \\ 
u(0) = 0, \\ 
u(1) = 0. 
\end{cases}
$$

The analytical solution is: 

$$ \vec{v} = \left( \frac{\sin(x_1\pi)}{\pi^2}, \frac{\sin(x_2\pi)}{\pi^2}, \ldots, \frac{\sin(x_N\pi)}{\pi^2} \right)^T $$

The boundary value problem solver $\texttt(sol\_.m)$ dicretises the $N$ interior grid points and a second-order central difference produces a tridiagonal system $A\vec{u} = \vec{f}$

The discrete error between the numerical and analytical solutions obeys $\text{error}_2 \propto N^{-2}$, so the method is second-rder convergent. 

This is confirmed visually: as the log-log plot gives a straight line with slope -2. ![Error Convergence](plots/l2_error.jpg)

