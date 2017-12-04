function [image] =  averaging_filter(r_image, kernel_size)

% ------- 2D Spatial Averaging Filter -------
% Created by Harrison Cattell, 2017
%
% Description
% -----------
%   Self-made implementation of a 2D spatial averaging filter
%    
%   input parameters are: 
%   Image
%           Image to be affected by algorithm
%
%   Neighbourhood size (Kernel)
%           The size of the neighbourhood that the filter will be applied
%           to
%           Must be a negative number!
%
% -------------------------------------------------------------------------

% -------------------------------------------------------------------------
%
% Initalise matrix dimensions
[o_row, o_col] = size(r_image);

% Validates neighbourhood size
if (mod(kernel_size,2) == 0)

    exp = 'Neighbourhood size innappropiate!';
    error(exp);

else

    % Calcuates padding size
    padding_size = floor(kernel_size/2);
    
    % Creates padded array
    padded_array = padarray(r_image, [padding_size, padding_size], 0);
    
    % Calculates area of neighbourhood
    n_area = kernel_size*kernel_size;
    
    % Calculates matrix start position
    start = padding_size+1;
    
    for row = start: (o_row + padding_size) % Accounts for padding and new start position
        for col = start: (o_col + padding_size) % Accounts for padding and new start position
            
            % Create sub matrix
            sub_mat = padded_array((row-padding_size:row+padding_size), (col-padding_size:col+padding_size));

            % Reshape matrix to 1d vector
            sub_vector = reshape(sub_mat, 1, []);

            % Finding sum of vector
            sum_of_vec = sum(sub_vector);

            % Finding average
            avg = round(sum_of_vec/n_area);

            padded_array(row, col) = avg;

        end
    end   
    
    image = padded_array;
    
    disp('Mean Filter Complete!');
    
end

% -------------------------------------------------------------------------

