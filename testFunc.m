% This function is used to run a local search on some data many, many
% times. It returns the completeness and average run time.

% Loads 'data.mat'. 'data.mat' has a vector in it containing a 1-D search
% space where the value indicates cost.
load data

plot( data ) % Plot the data
title( 'Plot of 1-D search space' ); % Create a title on the last open plot

N = 1000; % Run the search this many times

% The following is how MATLAB handles function pointers. There are no
% pointers to memory addresses. 'fPtrSearch' is the string of the name of
% the function that MATLAB will look for when the function pointer is
% dereferenced.
fPtrSearch = 'hillClimb';  

% Technically you do not need to initialize stuff in MATLAB. It is always a
% vector of type double. Though, if you know the size of your array
% beforehand it helps with speed because MATLAB will preallocate.
times = zeros( 1, N );         % Initialize double array
completions = false( 1, N );   % Initialize logical array

% MATLAB for loops can iterate over a range of values. It has the format
%   for i = L:M:N
% where i i the iterator, L is the starting integer value, M is the step
% size, and N is the stop limit (inclusive). A step size of M=1 is assumed
% if you omit this. So you can replace the index below with:
%   for i = 1:N
for run = 1:1:N
    % Normally white space does not matter in MATLAB (it's kind of like C++
    % in that way, except for end-of-line. If your intend for a line to be
    % a continuation of a previous line you need to end the first line with
    % '...'
    %
    % Note that MATLAB allows functions to return multiple arguments.
    [completions(run), ... notice that everything past the '...' is a comment
        times(run) ] = ...
        feval( fPtrSearch, data, 6001 );
        % This is how to call a function pointer. 'feval' takes N + 1
        % arguments. The first argument is the string to the function you
        % want to call. The rest of the N arguments are as normal.
end

display( [ 'Completion rate of: ' num2str( sum(completions) ./ N ) ] );
display( [ 'Averate time in ms: ' num2str( mean(times) * 10^3 ) ] );