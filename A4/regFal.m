function regFal()
a = 4; %upper bound
f1 = myfunc(a);
b = 0.1; %lower bound since 0 is also a root i cant use it
f2 = myfunc(b);

error = 10; %initial error is big

while error >1e-10
    %loop 
    c = b - f2*(a-b)/(f1-f2);
    %re-evaluate f at c
    fr = myfunc(c);
    if sign(fr)==sign(f1)
        a = c;
        f1 = fr;
    else
        b = c;
        f2 = fr;
    end
    %recompute the error else the loop wont stop
    error = abs(fr); 
end
c
function output = myfunc(x)
output = (x-1)^2*sin(x);