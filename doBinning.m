function [newx,newy,remainx,remainy] = doBinning(x,y,n)
% This function do binning along the x and y axis per group of n points

% INPUTS
% x: double 1xN
% y: double 1xN
% n: group of points

% OUTPUTS
% newx: double 1xm, where m is the number of groups of n points
% newy: double 1xm, where m is the number of groups of n points
% remainx: points that have not been binned
% remainy: points that have not been binned

% If size of x and y are Nx1 instead of 1xN
if size(x,2) == 1
    x = x';
end
if size(y,2) == 1
    y = y';
end

N = length(x);
if length(y) ~= N
    error('x and y must have the same size')
end

m = floor(N/n); % Number of groups
% Extract the m groups of n points
X = x(1:m*n);
Y = y(1:m*n);
% Calculate the means
newx = mean(reshape(X,n,[]));
newy = mean(reshape(Y,n,[]));

% If the total number of points N is not a multiple of n
if m*n < N % Points that have not been binned
    remainx = x((m*n+1):end);
    remainy = y((m*n+1):end);
else
    remainx = [];
    remainy = [];
end

end