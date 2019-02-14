clear all; 
close all; 
clc; 

timer = tic;
%% Test solve_eq function here:
% equation: u'(x) - ku''(x) = 5x - 10
% solve_eq(n,k), where: n - elements, k - equation const
solve_eq( 10, 0.2 );

SolutionTimer = toc(timer)