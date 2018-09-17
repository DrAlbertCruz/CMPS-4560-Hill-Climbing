%% [VALUE INDEX RESULT TIME] = SIMULATEDANNEALING( DATA, ITERATIONS )
%   Simulated annealing search for maximum of DATA. Cuts off after number
%   of ITERATIONS. At the end of the run, the function returns the maxima
%   VALUE at INDEX. RESULT is a boolean indicating whether or not the run
%   found the global maxima (complete).
%
%   In this case ITERATIONS is related to the temperature of search.

function [val,current,res,t] = simulatedAnnealing( data, iterations )
%% Initialization
% Start the timer after some book keepin not related to the algorithm
% itself, e.g. get global maxima

globalMax = max( data );        % Goal value
n = length( data );             % Length of data
initial = ceil( rand * n );     % Initial position
res = false;                    % Set complete flag to false

%% Go
tic % Starts MATLAB's timer

current = initial;
for k = 1:iterations
    % Check if goal state ...
    if data( current ) == globalMax
        res = true;
        break; % ... if so, break right away.
    end
    
    % Get some random index in the data
    i = ceil( rand * n );
    
    if( data( i ) - data( current ) > 0 )
        current = i; % If its better accept it.
    else 
        % Tendency to accept bad decision
        if rand <= exp( data( i ) - data( current ) * k )
            current = i;
        end
    end     
end

%% Stop
t = toc;                    % Save toc to t, return it
val = data( current );      % Return the value, not set above to save computation