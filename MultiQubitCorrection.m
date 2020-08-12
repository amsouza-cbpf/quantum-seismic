function solutions = MultiQubitCorrection(startsample,struc);
% Implementation of the MQC algorithm (ArXiv:1801.04849 and ArXiv:1910.00626v2) 
% startsample is a matrix containing the solutions obtained in a D-Wave machine;
% struc.embedding  is a structure containing the ising model embeded into the quantum hardware. (Obtained with find_embeding)  

[aa Nmax] = size(startsample);

run1 = startsample(:,1);

for k=2:(Nmax);
    
    run2 = startsample(:,k);
  
    sample1 = find(run1 ~= run2);
    
    sample2 = find(run1 == run2 & run1 ~= 3);
    
    A = struc.embedding.J(sample1,sample1);  
   
    G =graph(A+A');
    
    tunnel = conncomp(G, 'OutputForm', 'cell');
 
    for m=1:length(tunnel)
        
        spins_tunnel = sample1(tunnel{m});
        
        II = sum(struc.embedding.h(spn1ins_tunnel).*run1(spins_tunnel)) + ...
             (run1(spins_tunnel)') * struc.embedding.J(spins_tunnel,sample2) *run1(sample2);
        
        if II > 0; run1(spins_tunnel) = -run1(spins_tunnel); end
        
    end
end
        
solutions  = run1;
    