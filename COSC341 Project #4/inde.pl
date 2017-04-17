% Author:
% Date: 4/16/2017

inde(X, [], 0).
inde([_|T], X, Index):-
inde(T, X, Index1),
Index is Index1+1.