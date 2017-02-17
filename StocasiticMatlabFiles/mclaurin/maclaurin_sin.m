function result = maclaurin_sin(x,n)
%
%  maclaurin_sin(x,n)
%
%  computes the Maclaurin series approximation for
%  sin(x) where the largest term is n
%
%  x- the domain for the approximation of sin(x)
%  n- the largest term in the Maclaurin series
%
%  result- the Maclaurin series approximation of sin(x) computed
%          up to the largest term being the n-th  (n-th derivative,
%          n!, x^n)
%

sum = 0;

%
% useful temp variables
%
factorialTerm = 0;
polynomialTerm = 0;
derivativeTerm = 0;

partialSum = 0;

%
% loop over each term in the Maclaurin Series
%
for k=0:1:n,
    
    factorialTerm = factorial(k);
    
    polynomialTerm = power(x,k);    
    
    derivativeTerm = kth_derivative_sin(0,k);    
    
    partialSum = (polynomialTerm/factorialTerm) * derivativeTerm;
   
    sum = sum +  partialSum;    
end

result = sum;

