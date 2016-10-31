function root = modNew(fname,fdname,x,xtol,ftol,n_max, display)
% modified Newton's Method.
%
% input:  fname is a string that names the function f(x).
%         fdname is a tring that names the derivative f'(x).
%         x is the initial point,x0
%         xtol and ftol are termination tolerances
%         n_max is the maximum number of iteration
%         display = 1 if step-by-step display is desired,
%                 = 0 otherwise
% output: root is the computed root of f(x)=0
%
m = 2;
n = 0;
fx = feval(fname,x);
if display 
   disp('   n             x                    f(x)')
   disp('------------------------------------------------------')
   fprintf('%4d %23.15e %23.15e\n', n, x, fx)
end
if abs(fx) <= ftol
   root = x;
   return
end
for n = 1:n_max
    fdx = feval(fdname,x);
    d = fx/fdx;
    x = x - m*d;
    fx = feval(fname,x);
    if display 
       fprintf('%4d %23.15e %23.15e\n', n, x, fx), end
    if abs(d) <= xtol || abs(fx) <= ftol
       root = x;
       return
    end
end
root = x;