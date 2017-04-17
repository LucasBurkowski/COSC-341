% Author:
% Date: 4/16/2017

remv(X, [], []) :- !.
remv(X, [X|Xs], Y) :- !,
remv(X, Xs, Y).
remv(X, [T|Xs],Y) :- !,
remv(X, Xs, Y2), append([T], Y2, Y).