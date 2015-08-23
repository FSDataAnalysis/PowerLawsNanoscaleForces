
Ldumb=size(length(current_matrix));


[row, col]=find(isinf(current_matrix)); 
    
current_matrix(:, col)=[];

[row, col]=find(isnan(current_matrix)); 
    
current_matrix(:, col)=[];


