%==========================================================================
%                     % Sort by speed   
%
% 1.sort the features by average trip speed
% 2.ground features in segments accounting to speed
%==========================================================================

% sort by average speed 
[xx,ind] = sort(fa_train_xy(:,5)); 
% xx: ordered array, ind: index

% ordered array of features
fa_xy_ordered = fa_train_xy(ind,:);

% group into segemtns
v_ind = floor(fa_xy_ordered(:,5)/5)-2; % speed index
v_ind = min(v_ind,7); % if index exeed 7 truncate
v_ind = max(v_ind,0); % if index less than 0 truncate

% initialize segments
f_xy0 =[];
f_xy1 =[];
f_xy2 =[];
f_xy3 =[];
f_xy4 =[];
f_xy5 =[];
f_xy6 =[];

% group the features into segments
for n=1:size(v_ind,1)
    switch v_ind(n)
        case 0 % 10-15 mph
            f_xy0 =[f_xy0;fa_xy_ordered(n,:)];
        case 1 % 15 -20 mph
            f_xy1 =[f_xy1;fa_xy_ordered(n,:)];
        case 2 % 20 -25 mph
            f_xy2 =[f_xy2;fa_xy_ordered(n,:)];
        case 3  % 25 -30 mph
            f_xy3 =[f_xy3;fa_xy_ordered(n,:)];
        case 4  % 30 -35 mph
            f_xy4 =[f_xy4;fa_xy_ordered(n,:)];
        case 5  % 35-45 mph
            f_xy5 =[f_xy5;fa_xy_ordered(n,:)];
        case 6  % % 35-45 mph
            f_xy5 =[f_xy5;fa_xy_ordered(n,:)];
        case 7  % % 35-45 mph
            f_xy6 =[f_xy6;fa_xy_ordered(n,:)];
    end
end

% Normalize features
[ f0_train_xn,f0_train_y,Nm0 ] = F_Trans( f_xy0 );
[ f1_train_xn,f1_train_y,Nm1 ] = F_Trans( f_xy1 );
[ f2_train_xn,f2_train_y,Nm2 ] = F_Trans( f_xy2 );
[ f3_train_xn,f3_train_y,Nm3 ] = F_Trans( f_xy3  );
[ f4_train_xn,f4_train_y,Nm4 ] = F_Trans( f_xy4  );
[ f5_train_xn,f5_train_y,Nm5 ] = F_Trans( f_xy5  );
[ f6_train_xn,f6_train_y,Nm6] = F_Trans( f_xy6  );