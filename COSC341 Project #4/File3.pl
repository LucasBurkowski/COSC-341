% Author:
% Date: 4/16/2017
dispnth([],_,[]).
dispnth([_|T],0,T) :- !.
dispnth([H|T],N,[H|TR]):-
 N1 is N-1,
 dispnth(T,N1,TR).
