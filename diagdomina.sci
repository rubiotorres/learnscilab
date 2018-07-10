    // Funcao para testar se matriz quadrada eh diagonal dominante. 

function [dd] = diagdomina(A)
    if size(A,"r") ~= size(A,"c") then 
        error( "A matriz nao eh quadrada" )
    end
    dg = abs(diag(A)); // vector with diagonal |elements|
    outdg = sum(abs(A), "c") - dg; // sum of out-diagonal |elements| 
    dd = and(dg > outdg);
endfunction
