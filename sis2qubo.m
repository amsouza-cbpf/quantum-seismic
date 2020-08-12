function Q=sis2qubo(B,b);
%Transform the system B*q = b into a QUBO formulation

[M K] = size(B);

Q = sparse(zeros(K,K));

for i=1:K    
    Q(i,i) = sum(B(:,i).*B(:,i) - 2*B(:,i).*b);     
end


for i=1:K
    
    for j=(i+1):K
          Q(i,j) = sum(2*B(:,i).*B(:,j)); 
    end
end


end


