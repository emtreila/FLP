% 1.2 Let L be a numerical list and consider the following PROLOG
% definition for the predicate f(list, integer), with the flow model (i, o):
%
% f([], 0).
% f([H|T], S) :- f(T, S1), S1 < H, !, S is H.
% f([_|T], S) :- f(T, S1), S is S1.
%
% Rewrite the predicate in order to have only one recursive call f(T, S1)
% in all clauses. You may write auxiliary predicates.
% You may not write a new subalgorithm to achieve the same thing.
% Justify the answer.

g(H,S1,S):-
    S1 < H, !,
    S is H.
g(_,S1,S):-
    S is S1.

f([],0).
f([H|T],S):-
    f(T,S1),
    g(H,S1,S).
