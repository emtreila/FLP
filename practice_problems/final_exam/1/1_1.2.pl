% 1.2 Let L be a numerical list and consider the following PROLOG
% definition for the predicate
% f(list, integer), with the flow model (i, o):

f([], 0).
f([H|T], S) :- f(T, S1), H < S1, !, S is H + S1.
f([_|T], S) :- f(T, S1), S is S1 + 2.


% Give a solution to avoid the recursive call f(T, S1) in both clauses
% without redefining the predicate. Justify the answer.

g(H,S,S1):-
    H < S1, !,
    S is H + S1.
g(_,S,S1):-
    S is S1 + 2.

f([],0).
f([H|T], S):-
    f(T, S1),
    g(H,S,S1).

% The recursive call f(T,S1) was executed in multiple clauses.
% To avoid repeated recursive calls, we compute only once the call
% f(T,S1) and give the result as a parameter to an auxiliary function
% and cut, improving the efficiency.
