% Author:
% Date: 4/12/2017
list([0,1,2,3,5,6,5,3,2,1]).

len([G|T], 0).
len([H|T], Ans) :- len(T, Ans2),Ans is Ans2 + 1.

