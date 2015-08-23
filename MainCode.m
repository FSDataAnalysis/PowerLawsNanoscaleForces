clear all;

%%% Output 

%%%% Structures
%%%% TIP_1 to N  (TIPS and Ac row data and all columns)
%%%% Processed_1  (TIPS and Ac for each tip) where the INFS and NANS have been removed
%%%% Processed_2  (TIPS and Ac for each tip) where the INFS and NANS and outliers for ALL cols have been removed (most rebust)
%%%% Processed_3  (TIPS and Ac for each tip) where the INFS and NANS have been removed and outliers removed for F Ad

load TIPS;

remove_infs_nans=1;
remove_outliers_now=1;
removing_std_away=0.98;
removing_std_away_large_ratios=0.98;
minimum_number_data_points=10;  %% if less than 10 data points it will not exclude points in remove_outliers file

model_noise='normal';


main_dir=pwd;

NameTips = who('Tip*');

Number_Tips=length(NameTips);

for ttt=1:Number_Tips
    
    current_tip_name=NameTips{ttt};
  
    current_name_Acs= fieldnames(eval(current_tip_name));
   
    length_fields=length(current_name_Acs);
    
    for fff=1: length_fields
        
        dummy_name=sprintf('%s', current_tip_name, '.', char(current_name_Acs{fff}));
        
        current_matrix=eval(dummy_name);
        
        if remove_infs_nans==1
            remove_infs_nans_nas;
            Processed_1.(current_tip_name).(char(current_name_Acs{fff}))=current_matrix;
        end
        
      
        
        if remove_outliers_now==1
            
            remove_outliers;
            Processed_2.(current_tip_name).(char(current_name_Acs{fff}))=current_matrix_Out;  % outliers       
            Processed_3.(current_tip_name).(char(current_name_Acs{fff}))=Force_Adhesion_Out;  %% outliers of F ad only
        end
        
       
    end
    
end

save PROCESSSED_TIPS;
