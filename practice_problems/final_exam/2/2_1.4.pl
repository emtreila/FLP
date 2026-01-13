% 1.4 Consider the PROLOG predicate f(list, integer) with the flow model
% (i,o).
f([],0).
f([H|T],S):-
    f(T,S1),
    S is S1 - H.
% Give the result of the evaluation f([1,2,3,4,5,6,7,8], S).

f([1|T],S): f(T,S1), S is S1-H -> S = -35 - 1 = -36
f([2|T],S): f(T,S1), S is S1-H -> S = -33 - 2 = -35
f([3|T],S): f(T,S1), S is S1-H -> S = -30 - 3 = -33
f([4|T],S): f(T,S1), S is S1-H -> S = -26 - 4 = -30
f([5|T],S): f(T,S1), S is S1-H -> S = -21 -5 = -26
f([6|T],S): f(T,S1), S is S1-H -> S = -15 - 6 = -21
f([7|T],S): f(T,S1), S is S1-H -> S = -8 - 7 = -15
f([8|T],S): f(T,S1), S is S1-H -> S = 0 - 8 = -8
f([],S) -> S = 0

result = -36
