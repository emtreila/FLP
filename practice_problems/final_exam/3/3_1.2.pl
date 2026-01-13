% 1.2 Let L be a numerical list and consider the following PROLOG
% definition for the predicate with the flow model (i, o):

f([],-1).
f([H|T],S):-
    f(T,S1),
    S1 > 0, !,
    S is S1 + H.
f([_|T],S):-
    f(T,S1),
    S is S1.

% Give a solution to avoid the recursive call f(T, S1) in both clauses
% without redefining the predicate. Justify the answer.

g(H,S1,S):-
    S1 > 0, !,
    S is S1 + H.
g(_,S1,S):-
    S is S1.

f([],-1).
f([H|T],S):-
    f(T,S1),
    g(H,S1,S).

% The recursive call f(T,S1) was executed in multiple clauses. To avoid
% repeated execution, we compute only once the recursive call and its
% result is used in an auxiliary function with a cut, keeping the same
% idea, but improving the efficiency.
