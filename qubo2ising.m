function [h J] = qubo2ising(Q)
%QUBO formulation to Isisng
%
[n] = size(Q);

J = triu(Q/4,1);

for i=1:n;  h(i) = 0.25*(sum(Q(i,i:n)) + sum(Q(1:i,i))); end
