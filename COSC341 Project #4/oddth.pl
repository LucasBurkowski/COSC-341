% Author:
% Date: 4/16/2017

oddths([_,E|_], E).
oddths([_,_|Es], E) :-
oddths(Es, E).