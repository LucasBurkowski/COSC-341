% Author:
% Date: 4/16/2017

suml([],0).
suml([H|T], Sum) :-
suml(T, Next),
Sum is H + Next.