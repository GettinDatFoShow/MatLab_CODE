function result = kth_derivative_sin(x, k)
%
% kth_derivative_sin(x,k)
%
% compute the kth derivative of sin(x) 
% 
% x- the input to sin(x)
% k- the order of the derivative d(k)/dx
%
% result- the d(k)/dx [sin(x)]
%

%
% useful constants/vars
%
SIN_DERIVATIVE_CYCLE = 4;
ret = 0;

ZERO = 0;
ONE= 1;
TWO = 2;
THREE = 3;

%
% d(k)/dx [sin(x)] cycles modulo 4
% so, check which derivative we have
%
whichDDx = mod(k, SIN_DERIVATIVE_CYCLE);

%
% select the functional form based on
% which position in mod 4 arithmetic
% describes the derivative
%
switch whichDDx
    case ZERO
       ret = sin(x);
       
    case ONE
       ret = cos(x);
       
    case TWO
       ret = -sin(x)
       
    case THREE
        ret = -cos(x)
end

result = ret;

