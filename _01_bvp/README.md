The programs in this folder compute the solution to the boundary value problem:

$$
\begin{cases} 
-u''(x) = f(x) = \sin(\pi x), & x \in (0, 1), \\ 
u(0) = 0, \\ 
u(1) = 0. 
\end{cases}
$$

The analytical solution is: 

\vec{v} = \left( \frac{\sin(x_1\pi)}{\pi^2}, \frac{\sin(x_2\pi)}{\pi^2}, \ldots, \frac{\sin(x_N\pi)}{\pi^2} \right)^T
