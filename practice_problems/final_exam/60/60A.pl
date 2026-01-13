%A. Let L be a list of numbers and given the following PROLOG predicate
% definition f(list, integer), with the flow model (i, o):

%f([], 0).
%f([H|T], S) :- f(T, S1), S1 < H, !, S is H.
%f([_|T], S) :- f(T, S1), S is S1.


% Rewrite the definition in order to avoid the recursive call f(T, S) in
% both clauses.
%Do NOT redefine the predicate. Justify your answer.

f([],0).
f([H|T],S):-
    f(T,S1),
    ( S1 < H -> S is H;
    S is S1
    ).
% The recursive call f(T,S1) appears in multiple clauses. It is computed
% once and its result is reused in a conditional construct, avoiding
% repeated recursion.
