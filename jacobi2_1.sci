function [x , err , niter ] = jacobi (A ,b ,x0 , tol , maxiter )
 err = %inf ;
 niter = 1;
 D = diag ( diag (A) );
 T = A - D;
 while  ((max ( abs (x - x0 )))/max ( abs (x)))<=err,
	x = D \(b -T * x0 );
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
