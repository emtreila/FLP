% 1.2 Let L be a numerical list and consider the following PROLOG
% definition for the predicate f(integer,integer) with the flow model
% (i, o):

f(0,0):- !.
f(I,Y):-
    J is I-1,
    f(J,V),
    V > 1, !,
    K is I - 2,
    Y is K.
f(I,Y):-
    J is I-1,
    f(J,V),
    Y is V+1.

% Give a solution to avoid the recursive call f(J,V) in both clauses
% without redefining the predicate. Justify the answer.

g(V,I,Y):-
    V > 1, !,
    K is I - 2,
    Y is K.

g(V,_,Y):-
    Y is V + 1.

f(0,0):- !.
f(I,Y):-
    J is I-1,
    f(J,V),
    g(V,I,Y).

% The recursive call f(J,V) was executed in multiple clauses. To avoid
% repeated execution, we compute only once the recursive call and its
% result is given as a parameter to an auxiliary function and cut,
% preserving the same logic but making everything more efficient.
