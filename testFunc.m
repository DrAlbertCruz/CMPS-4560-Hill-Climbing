% Function that will call a search function and get completeness and search
% results

load data % Load data

runFor = 1000;                   % Run the algorithm this many times
funStr = 'simulatedAnnealing';  % There are no function pointers in matlab
% ... instead you will have to run feval( funStr, ARG1, ARG2, ARG3, ... )

times = zeros( 1, runFor );         % Initialize double array
completions = false( 1, runFor );   % Initialize logical array

for run = 1:runFor
    [~,~,... % ~ causes MATLAB to ignore a returned value
        completions(run), ...
        times(run) ] = ...
        feval( funStr, data, 6001 );
end

display( [ 'Completion rate of: ' num2str( sum(completions) ./ runFor ) ] );
display( [ 'Averate time in ms: ' num2str( mean(times) * 10^3 ) ] );