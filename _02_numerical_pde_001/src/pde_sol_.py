from numpy import *
import matplotlib.pyplot as plt

# analytical constants from boundary conditions of system
c1=(1-cos(2))/4
c2=11/4

N_=2**arange(2,11)
errors=[]

for N in N_:
    h=1.0/(N+1)
    x=arange(1,N+1)*h
    n=N

    # stiff matrix
    e=ones(n)
    A=(diag(-e[:-1],-1)+diag(2*e,0)+diag(-e[:-1],1))/h**2

    # system [Au = f] and boundary condition implementation
    f=cos(2*x)
    f[0]+=3.0/h**2
    f[-1]+=3.0/h**2

    u=linalg.solve(A,f)
    u_=cos(2*x)/4+c1*x+c2

    # discrete L2 error
    errors.append(sqrt(h*sum((u-u_)**2)))
errors = array(errors)

# log-log plot for convergence rate 
p = polyfit(log(N_),log(errors),1)
slope = p[0]

# plot
fig,ax = plt.subplots(figsize=(7,5))
ax.loglog(N_,errors,'ro-',markersize=7,linewidth=1.8,markerfacecolor='steelblue',label=r'$L^2$ error')
ax.loglog(N_,exp(polyval(p,log(N_))),'k--',linewidth=2.0,label=f'Fit: slope = {slope:.3f}')
plt.title(f"$L^2$ Norm Decay for -u''(x)=cos(2x)")
ax.set_xlabel('N (number of grid intervals)',fontsize=13)
ax.set_ylabel(r'$L^2$ Error', fontsize=13)
ax.legend(loc='lower left', fontsize=13)
ax.grid(True,which='both',alpha=0.4)
plt.tight_layout()
plt.show()
