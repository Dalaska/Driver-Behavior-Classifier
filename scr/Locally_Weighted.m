function [ ref ] = Locally_Weighted( x,y, r )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
 
yy = smooth(x,y,r,'loess');

[xx,ind] = sort(x);

plot(xx,yy(ind),'g-','LineWidth',2)
ref=[xx,yy(ind)];


end

