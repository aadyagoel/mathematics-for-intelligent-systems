A = [1 1 ; 1 -1];
B = kron(A,A); %creates basis matrix 
BT = 0.5*B; %normalizing the matrix by /2 because the sqrt(sum(squared(col vector elements))) 
x = [1 2 3 4]';%transpose of x signal
X = BT*x %basis matrix * x signal = X coefficients 