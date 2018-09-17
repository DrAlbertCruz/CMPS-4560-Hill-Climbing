%% [VALUE INDEX RESULT TIME] = HILLCLIMB( DATA )
%   Local beam search

function [val,current,res,t] = localBeam( data, beams )
%% Initialization
% Start the timer after some book keepin not related to the algorithm
% itself, e.g. get global maxima

globalMax = max( data );        % Goal value
n = length( data );             % Length of data
current = ceil( rand(1,beams) * n );     % Initial positions
res = false;                    % Set complete flag to false
change = true;
goal = false;

%% Go
tic % Starts MATLAB's timer

while change && ~goal
    change = false; % Reset if there was a change or not
    
    % For each beam
    for i=1:beams
        if data( current(i) ) == globalMax
            goal = true; % ... if it somehow found the global optimum.
            break;      % ... also break from beam search
        end
        
        if( current(i) > 2 && current(i) <= n-1 )
            if( data( current(i) - 1 ) > data( current(i) )  )
                current(i) = current(i) - 1; 
                change = true;
            elseif( data( current(i) + 1 ) > data( current(i) )  )
                current(i) = current(i) + 1; 
                change = true;
            end
        end
    end
end

%% Stop
t = toc;                    % Save toc to t, return it
val = data( current );      % Return the value, not set above to save computation