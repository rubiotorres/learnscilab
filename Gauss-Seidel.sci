function [dd, x , err , niter ] = gaussSeidel (A ,b ,x0 , tol , maxiter )
    if size(A,"r") ~= size(A,"c") then 
        error( "A matriz nao eh quadrada" )
    end
    dg = abs(diag(A)); // vector with diagonal |elements|
    outdg = sum(abs(A), "c") - dg; // sum of out-diagonal |elements| 
    dd = and(dg > outdg);
 err = %inf ;
 niter = 1;
 D = diag ( diag (A) );
 T = A - D;
 while err >= tol & niter < maxiter ,
    x1 = D \(b -T * x0 );
	x = D \(b -T * x1 );
	err = max ( abs (x - x0 ));
	x0 = x;
	niter = niter +1;
 end
 if niter == maxiter then
	disp ('Numero maximo de iteracoes atingido ');
	disp ('iteracoes ', niter , 'Condicao max_k |x(k) - x0(k)| nao atingida apos ');
	break ;
 end
endfunction
