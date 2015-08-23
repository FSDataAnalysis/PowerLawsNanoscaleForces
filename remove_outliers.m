current_matrix_Out=current_matrix;
Force_Adhesion_Out=current_matrix;

current_matrix_indices=[];
L_s=size(current_matrix);
LLL=L_s(1);

Current_Raw=1;


while Current_Raw<(LLL+1)
    

    Data_input=current_matrix_Out(Current_Raw,:);   %%% first force of adhesion

    %%% First round of cleaning 

    dumb_normality_test=jbtest(Data_input);

    while dumb_normality_test~=0

        Data_input=log(abs(Data_input));
        dumb_normality_test=jbtest(Data_input);

    end

    av=mean(Data_input);
    stnd=std(Data_input);
    L=length(Data_input);   
    tst = icdf(model_noise,removing_std_away,0,1);   %std_deviations_away 4*L   ; 1-1/(4*L)
    tst_data=(Data_input-av)/stnd;


    [RR,C]=find(abs(tst_data)>tst);
    excluded=Data_input(C);
    current_matrix_indices=[current_matrix_indices, C]; % indices to delete 


    dummy_length1=length(current_matrix_Out(Current_Raw,:));
    dummy_length2=length(C);


    if (dummy_length1-dummy_length2)> minimum_number_data_points

        current_matrix_Out(:,C)=[];
        
        if Current_Raw==1  %% force of adhesion
        
             Force_Adhesion_Out(:,C)=[];
        end
    end
    
    

    Current_Raw=Current_Raw+1;
end

