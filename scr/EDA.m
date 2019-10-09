%==========================================================================
%                       Exploratory Data Analysis
%
% visulize the features vs average speed
%==========================================================================
 
 
% group feature vectors
fb = [f1;f3;f5;f7;f9;f11;f13]; % Good 
fg = [f2;f4;f6;f8;f10;f12;f14]; % Bad
ft = [fb;fg]; % Total

% F1: deceleration vs average speed
figure(1)
hold on
scatter(fb(:,4),fb(:,5),'or')
scatter(fg(:,4),fg(:,5),'^b')
ref1 = Locally_Weighted( ft(:,4),ft(:,5),0.9 );
legend('bad','good','average')
xlabel('average speed (mph)')
ylabel('F1 brake level')

% F2: coasting time vs average speed
figure(2)
hold on
scatter(fb(:,4),fb(:,6),'or')
scatter(fg(:,4),fg(:,6),'^b')
ref2 = Locally_Weighted( ft(:,4),ft(:,6),0.9 );
xlabel('average speed (mph)')
ylabel('F2 coasting time')
legend('bad','good','average')

% F3: unneeded acceleration vs average speed
figure(3)
hold on
scatter(fb(:,4),fb(:,7),'or')
scatter(fg(:,4),fg(:,7),'^b')
ref3 = Locally_Weighted( ft(:,4),ft(:,7),0.98 );
xlabel('average speed (mph)')
ylabel('F3 frequency of unneeded acceleration')
legend('bad','good','average')

% F4: energy index vs average speed
figure(4)
hold on
scatter(fb(:,4),fb(:,8),'or')
scatter(fg(:,4),fg(:,8),'^b')
ref4 =Locally_Weighted( ft(:,4),ft(:,8),0.7 );
xlabel('average speed (mph)')
ylabel('F4 kinetic energy index')
legend('bad','good','average')

