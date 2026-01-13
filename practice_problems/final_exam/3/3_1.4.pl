% 1.4 Let L be a numerical list and consider the following PROLOG
% definition for the predicate
% g(list, list), with the flow model (i, o):

g([],[]).
g([_|T],S):-
    !, g(T,S).
g([H|T],[H|S]):-
    H mod 2 =:= 0,
    g(T,S).

% Give the result of the following goal: g([1,2,3],L)

-> empty list because of ! it cant go to g([H|T],[H|S]).
