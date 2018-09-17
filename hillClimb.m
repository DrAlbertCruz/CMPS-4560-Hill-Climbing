%% [VALUE INDEX RESULT TIME] = HILLCLIMB( DATA )
%   Hill climb search. As we discussed in lecture, this will get stuck
%   You may want to use this as a framework for your method instead.

function [val,current,res,t] = hillClimb( data, iterations )
%% Initialization
% Start the timer after some book keepin not related to the algorithm
% itself, e.g. get global maxima

globalMax = max( data );        % Goal value
n = length( data );             % Length of data
initial = ceil( rand * n );     % Initial position
res = false;                    % Set complete flag to false
prev = [];

%% Go
tic % Starts MATLAB's timer

current = initial;
for k = 1:iterations
    % Check if goal state ...
    if current == prev
        if data( current ) == globalMax
            res = true; % ... if it somehow found the global optimum.
        end
        break;
    end
    
    if( current > 2 && current <= n-1 )
        if( data( current - 1 ) > data( current ) )
            current = current - 1; 
        elseif( data( current + 1 ) > data( current ) )
            current = current + 1; 
        end
    end
    
    prev = current;     % Keep track of the previous so we know if were stuck
end

%% Stop
t = toc;                    % Save toc to t, return it
val = data( current );      % Return the value, not set above to save computation