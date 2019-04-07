% derive: derive the given function.
%   Input variables
%       function_handle : handle of function to be derived
%       x_values : x values of function to be derived
%       h : very small value for numerical derivative
%   Output variables
%       derivative : derivative for the given function.
%
%   created : 2019/04/07
%   modified : 2019/04/07
function [derivative]=derive(function_handle, x_values, h)
    derivative = (function_handle(x_values + h) - function_handle(x_values)) / h;
end