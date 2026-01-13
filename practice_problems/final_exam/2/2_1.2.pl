% 1.2 Let L be a numerical list and consider the following PROLOG
% definition for the predicate
% f(list, integer), with the flow model (i, o):

f([], -1).
f([H|T], S) :- H > 0, f(T, S1),S1 < H, !, S is H.
f([_|T], S) :- f(T, S1), S is S1.


% Give a solution to avoid the recursive call f(T, S1) in both clauses
% without redefining the predicate. Justify the answer.

g(S,S1,H):-
    S1 < H, !,
    S is H.
g(S,S1,_):-
    S is S1.

f([],-1).
f([H|T],S):-
    H > 0,
    f(T,S1),
    g(S,S1,H).

% The recursive call f(T,S1) appears in multiple clauses. To avoid
% repeated execution, we compute the recursive call once and the result
% is given as a parameter to an auxiliary predicate and cut that keep
% the same structure and improve efficiency.
