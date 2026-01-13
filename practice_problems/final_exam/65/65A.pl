%A. Let L be a list of numbers and given the following PROLOG predicate
% definition f(list, integer), with the flow model (i, o):

f([], 0).
f([H|T], S) :- f(T, S1), H < 1, !, S is H + S1.
f([_|T], S) :- f(T, S1), S is S1 + 2.


% Rewrite the definition in order to avoid the recursive call f(T, S) in
% both clauses. Do NOT redefine the predicate.

g(S1,H,S):-
    H < 1, !,
    S is H + S1.

g(S1,_,S):-
    S is S1 + 2.

f([],0).
f([H|T],S):-
    f(T,S1),
    g(S1,H,S).

% The recursive call f(T,S1) was executed in multiple clauses. To avoid
% repeated recursive calls, it is computed only once and its result
% is passed as a parameter to an auxiliary predicate and cut, preserving
% the original semantics while improving efficiency.
