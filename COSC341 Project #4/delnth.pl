% Author:
% Date: 4/16/2017

delnth([],_,[]).
delnth([_|T],0,T) :-
     !.
delnth([H|T],N,[H|TR]) :-
     N1 is N-1,
     delnth(T,N1,TR).