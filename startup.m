% set userpath to 
% userpath('/home/jacob/.matlab/R2013a/')
% place this file (startup.m) in /home/jacob/.matlab/R2013a/

% cvx
% first time run cvx_setup, check userpath
run /home/jacob/.matlab/R2013a/cvx/cvx_startup.m

% Peter corcs robotics toolbox
run /home/jacob/.matlab/R2013a/rvctools/startup_rvc.m

% V-rep matlab bindings
run /home/jacob/documents/trs/matlab/startup_robot.m

format long
format compact

addpath /home/jacob/documents/svn/p6_2/code/matlab_generic
addpath /home/jacob/documents/svn/p6_2/code/matlab_gfsk_workbench
addpath /home/jacob/documents/svn/p6_2/code/matlab_gfsk_workbench/modulator
addpath /home/jacob/documents/svn/p6_2/code/matlab_gfsk_workbench/demodulator
