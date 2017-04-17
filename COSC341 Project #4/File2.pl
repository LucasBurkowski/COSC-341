% Author:
% Date: 4/16/2017

member(X,[X|R]).
member(X,[Y|R]) :- member(X,R).