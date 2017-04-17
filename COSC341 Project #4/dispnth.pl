% Author:
% Date: 4/16/2017

dispnth([H|_],0,H) :-
    !.
dispnth([_|T],N,H) :-
    N > 0,
    N1 is N-1,
    dispnth(T,N1,H).