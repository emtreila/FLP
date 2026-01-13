% A. Given the following PROLOG predicate definition f(integer,
% integer), with the flow model (i, o):

f(100, 0) :- !.
f(I, Y) :- J is I + 1, f(J, V), V > 2, !, K is I - 2, Y is K + V - 1.
f(I, Y) :- J is I + 1, f(J, V), Y is V + 1.


% Rewrite the definition in order to avoid the recursive call f(J, V) in
% both clauses. Do NOT redefine the predicate. Justify your answer.

g(Y,V,I):-
    V > 2, !,
    K is I - 2,
    Y is K + V - 1.
g(Y,V,_):-
    Y is V + 1.

f(100,0):- !.
f(I,Y):-
    J is I + 1,
    f(J,V),
    g(Y,V,I).

% The recursive call f(J,V) was executed in multiple clauses.
% To avoid repeated recursive calls, we compute once the recursive call
% and the result is given as a parameter to an auxiliary predicat and
% cut, preserving the original semantics while improving efficiency.
