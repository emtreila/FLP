%A. Let L be a list of numbers and given the following PROLOG predicate
% definition with flow model (i, o):

%f([], 0).
%f([H|T], S) :- f(T, S1), S1 >= 2, !, S is S1 + H.
%f([_|T], S) :- f(T, S1), S is S1 + 1.


% Rewrite the definition in order to avoid the recursive call f(T, S) in
% both clauses.
% Do NOT redefine the predicate. Justify your answer.

f([],0).
f([H|T],S):-
    f(T,S1),
    (   S1 >= 2 -> S is S1 + H;
    S is S1 + 1
    ).

% The recursive call f(T, S1) appears in multiple clauses. To prevent
% that, it it somputed only once and its result is reused in a
% conditional statement construct, avoiding repeated recursion.

g(S,H,S1):-
    S1 >= 2, !,
    S is S1 + H.
g(S,_,S1):-
    S is S1 + 1.

f([],0).
f([H|T],S):-
    f(T,S1),
    g(S,H,S1).
