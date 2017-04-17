% Author:
% Date: 4/16/2017

maxl([X],X) :- !, true.
%max_l([X],X). %unuse cut
%max_l([X],X):- false.
maxl([X|Xs], M):- maxl(Xs, M), M >= X.
maxl([X|Xs], X):- maxl(Xs, M), X >  M.