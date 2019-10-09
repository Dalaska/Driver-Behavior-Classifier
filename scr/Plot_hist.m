function [   ] = Plot_hist( F )
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

    figure()
    subplot(2,2,1)
    hist(F(:,1));
    subplot(2,2,2)
    hist(F(:,2))
    subplot(2,2,3)
    hist(F(:,3))
    subplot(2,2,4)
    hist(F(:,4))
end

