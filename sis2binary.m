function [B]=sis2binary(A,R0,R);
%  Transform a system Ax=y into a binary system Bq=y
%  where each variabale  x_i = sum(q_{i,r} 2^(-r)) and r = R0:R.
%
[lin col] =size(A);

kcont =1;

for k=1:col
    
    for l=R0:(R0+R-1);
        
    B(:,kcont) = 2^(-l) * A(:,k) ;
    
    kcont =kcont+1;
    
    end
    
end



