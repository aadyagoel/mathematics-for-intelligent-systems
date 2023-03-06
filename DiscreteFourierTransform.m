N=4;
theta=[0 1 2 3]*2*pi/4;
b0 = cos(0*theta); b0 = b0/norm(b0);
b1 = cos(1*theta); b1 = b1/norm(b1);
b2 = cos(2*theta); b2 = b2/norm(b2);
b3 = sin(1*theta); b3 = b3/norm(b3);
B = [b0;b1;b2;b3]; %basis vectors are in rows which implies forward transform
B'*B %this is basis vector matrix transpose into basis vector matrix = identity matrix
%which proves this square matrix is orthogonal & orthonormal
%basis matrices have to be orthogonal+normal

%forward transform: 
%vector being converted into linear combination of basis
%vectors, so it finds the transform coefficients. X = B*x when basis
%vectors are in rows in B. Normally they are in coloumns, so this can be
%written as X = B.T*x 
x = [1;2;3;4]; %column vector of signal
X = B*x %fourier transform coefficients 

%inverse fourier transform
x = B'*X %B transpose * X = x

%the normal equation is x = B*X (inverse transform); to get forward
%transform from this we can do B^-1*x = X; when the basis matrix is
%orthogonal and orthonormal B^-1 = B.T so this can be written as B.T*x = X 
