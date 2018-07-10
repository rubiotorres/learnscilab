function x = TriSup(U,b)
// Sistema triangular superior: Substituicao retroativa 
// Input: Matriz triangular superior U, e vetor b
// Output x = solucao de U*x = b.

n = length(b); 
x = zeros(n,1);
x(n) = b(n)/U(n,n);

for i = (n-1):-1:1
    s = b(i);
    for j = (i+1):n 
        s = s - U(i,j)*x(j);
    end
    x(i) = s/U(i,i);
end
endfunction

function x = ElimGauss(A,b)
// Sistema linear: Eliminacao gaussiana (sem pivotacao)  
// Input: Matriz quadrada A, e vetor b
// Output x = solucao de A*x = b por eliminacao gaussiana

n = length(b); 
[m,p] = size(A);
if p ~= m,
   error("A matriz de entrada nao eh quadrada.")
end
if n ~= m,
   error("Matriz e vetor tem dimensoes incompativeis.")
end
Aum = [A,b]; // matriz aumentada
for j = 1:n-1
    for i = j+1:n
        xmult = Aum(i,j)/Aum(j,j); // pivo eh A(j,j)
        Aum(i,j:n+1) = Aum(i,j:n+1)-xmult*Aum(j,j:n+1);
        // alteramos toda a linha i de Aum
    end
end
x = TriSup(Aum(:,1:n), Aum(:,n+1)) 
endfunction
