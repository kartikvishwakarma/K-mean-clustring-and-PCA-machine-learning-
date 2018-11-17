function [X, label] = input_data(  )
filename2='label.txt';
filename = 'data.txt';
[X]=importdata(filename);
[Y]=importdata(filename2);
label=Y;
end

