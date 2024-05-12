% Assuming trial_data contains your original data (e.g., from 'gait_data.xlsx')
trial_data = xlsread('Untitled 1.xlsx');

% trial_datasize = size(trial_data);
ncols = size(trial_data, 2);
nrows = size(trial_data, 1);
cycle_start = min(trial_data(:, 1)); % Start time of cycle
cycle_end = max(trial_data(:, 1));   % End time of cycle
d_rate = (cycle_end - cycle_start) / (nrows - 1);
trialdata_norm = (0:1:100)';

% Linear length normalization using a spline
for ik_iter2 = 2:ncols
    tempdata = trial_data(:, ik_iter2);
    tempdata_norm = interp1(cycle_start:d_rate:cycle_end, tempdata, cycle_start:((cycle_end - cycle_start) / 100):cycle_end, 'spline');
    trialdata_norm = cat(2, trialdata_norm, tempdata_norm');
end

% The normalized data is stored in trialdata_norm
% Now you can write this normalized data back to an Excel file if needed
% xlswrite('normalized_gait_data.xlsx', trialdata_norm, 'Sheet1', 'A1');
