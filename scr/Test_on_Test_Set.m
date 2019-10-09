%==========================================================================
%                      Test on test set  
%==========================================================================

%% Part .1 Test on Microtrips
% inicialize
features = fa_test_x;
labels = fa_test_y;
prob = zeros(size(features,1),1);

% go through the feature vectors
for n=1:size(features,1)
    ftr = features(n,5:8); % feature
    %find speed
    speed = features(n,4);
    v_ind = floor(speed/5)-2; % speed index
    v_ind = min(v_ind,7); % truncate if exeed 7
    v_ind = max(v_ind,0); % truncate if less than 0
    switch v_ind
        case 0 % 10-15 mph
            N =Nm0; % normalization parameter
            theta=theta_0; % classification coefficient
        case 1 % 15 -20 mph
            N =Nm1;
            theta=theta_1;
        case 2 % 20 -25 mph
            N =Nm2;
            theta=theta_2;
        case 3  % 25 -30 mph
            N =Nm3;
            theta=theta_3;
        case 4  % 30 -35 mph
            N =Nm4;
            theta=theta_4;
        case 5  % 35-45 mph
            N =Nm5;
            theta=theta_5;
        case 6  % 35-45 mph
            N =Nm6;
            theta=theta_6;
        case 7  % 45 up mph
            N =Nm6;
            theta=theta_6;
    end
    
    % Normailize features
    x_test = zeros(1,size(ftr,2));
    for m=1:size(ftr,2)
        x_test(m) = Normalize_Feature( ftr(m),N(m,1),N(m,2));
    end
    
    % Test
    prob(n) = Test( x_test,theta );

end
%  confusion matrix
[ cm ] = Confusion_Matrix( prob,labels );
% accuracy 
p = (cm(1)+cm(4))/(cm(1)+cm(2)+cm(3)+cm(4));


%% Part .2 Test on an entire trip

% inicialization
trip_prob=[features(:,1),prob];
prob_sum = 0;
prob_count = 0.001; % to prevent 0/0
p_result = []; % result

% go through the scores
for k=2:size(prob,1)
    if (trip_prob(k,1)==1) && (trip_prob(k-1,1)~=1) 
       % (the current trip # is 1) and ( previous trip # is not 1)
       % a new trip starts
       % write the result
         p_result = [p_result;[prob_sum/(prob_count),labels(k)]];    
       % inicialize 
         prob_sum = 0;
         prob_count = 0;
    else
       % adding the driver score
         prob_sum = prob_sum+prob(k);
         prob_count = prob_count+1;
    end    
end
% handle the last trip
p_result = [p_result;[prob_sum/(prob_count),labels(k)]];

% confusion matrix
[ cm ] = Confusion_Matrix( p_result(:,1),p_result(:,2) );
% accuracy
p = (cm(1)+cm(4))/(cm(1)+cm(2)+cm(3)+cm(4));

% Plot classification results
figure()
hold on
plot(p_result(:,1),'-o','LineWidth',1)
plot(p_result(:,2),'LineWidth',1)
plot([1 32],[0.5 0.5],'LineWidth',1)
axis([1,32, -0.01, 1.01])
xlabel('trip #')
ylabel('driver score')
legend('driver socre','driver class','decision boundary')

%% Part .3 Test on each speed segments
% inicialization
result_0 = [];
result_1 = [];
result_2 = [];
result_3 = [];
result_4 = [];
result_5 = [];
result_6 = [];
result_7 = [];

for k=1:size(features,1)
    speed = features(k,4);
    v_ind = floor(speed/5)-2; % speed index
    v_ind = min(v_ind,7); % truncate if exeed 7
    v_ind = max(v_ind,0); % truncate if less than 0
    switch v_ind
        case 0 % 10-15
            result_0 = [result_0;[prob(k),labels(k)]];
        case 1 % 15 -20
            result_1 = [result_1;[prob(k),labels(k)]];
        case 2 % 20 -25
            result_2 = [result_2;[prob(k),labels(k)]];
        case 3  % 25 -30
            result_3 = [result_3;[prob(k),labels(k)]];
        case 4  % 30 -35
            result_4 = [result_4;[prob(k),labels(k)]];
        case 5  % 35-45
            result_5 = [result_5;[prob(k),labels(k)]];
        case 6  % 35-45
            result_5 = [result_5;[prob(k),labels(k)]];
        case 7  % 45 up
            result_6 = [result_6;[prob(k),labels(k)]];
    end
end  


