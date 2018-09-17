%% [VALUE INDEX RESULT TIME] = HILLCLIMB( DATA )
%   Hill climb search. As we discussed in lecture, this will get stuck
%   You may want to use this as a framework for your method.

function [isComplete,time] = hillClimb( data, iterations )
%% Initialization
% Start the timer after some book keeping not related to the algorithm
% itself, e.g. get global maxima

globalMax = max( data );        % Goal value
n = length( data );             % Length of data
initial = ceil( rand * n );     % Initial position
isComplete = false;             % Set complete flag to false
prev = -1;                      % Initialize previous index

%% Go
tic % Starts MATLAB's timer

position = initial;
for k = 1:iterations
    % Check if we did not move (we got stuck) ...
    if position == prev 
        % ... also if we're stuck on the goal state ...
        if data(position) == globalMax
            isComplete = true; % ... set completion flag ...
        end
        break; % ... then break.
    end
    
    % Look left
    if position - 1 >= 1 && ... Make sure we don't go out of bounds
            data( position - 1 ) > data( position )
        position = position - 1; 
    % Look right
    elseif position + 1 <= n  && ... Make sure we don't go out of bounds
            data( position + 1 ) > data( position )
        position = position + 1;
    end
    
    prev = position;     % Keep track of the previous so we know if were stuck
end

%% Stop
time = toc; % Save toc to t, return it