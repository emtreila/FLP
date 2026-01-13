% 11. a. Replace all occurrences of an element from a list with another
% element e.
% b. For a heterogeneous list, formed from integer numbers and list of
% numbers, define a predicate to determine
% the maximum number of the list, and then to replace this value in
% sublists with the maximum value of sublist.
% Eg.: [1, [2, 5, 7], 4, 5, [1, 4], 3, [1, 3, 5, 8, 5, 4], 5, [5, 9, 1],
% 2] =>
% [1, [2, 7, 7], 4, 5, [1, 4], 3, [1, 3, 8, 8, 8, 4], 5, [9, 9, 1], 2]

% substitute(l1..ln, elem, sub) = { [], n = 0
%                              [l1] U substitute(l2...ln,elem,sub),
%                                                     l1!=elem
%                              [sub] U substitute(l2...ln,elem,sub),
%                                                     l1=elem
%substitute(i,i,i,o)
substitute([],_,_,[]).
substitute([H|T],H,S,[S|R]):- !,
    substitute(T,H,S,R).
substitute([H|T],E,S,[H|R]):-
    substitute(T,E,S,R).

% max_list(l1...ln) = { l1, n=1;
%                  max(l1, max_list(l2...ln)), otherwise
% max_list(i,o)

max_list([H], H).
max_list([H|T], M) :-
    max_list(T, M1),
    (H > M1 -> M = H ; M = M1).

% get_global_max(l1...ln) = { 0, n = 0
%                       get_global_max(l2...ln), l1 = list
%                       maximum(l1, get_global_max(l2...ln)), otherwise
% get_global_max(i,o)
get_global_max([], 0).
get_global_max([H|T], M) :-
    is_list(H), !,
    get_global_max(T, M).
get_global_max([H|T], M) :-
    get_global_max(T, M1),
    (H > M1 -> M = H ; M = M1).

% het_list(l1...ln, m) = { [], n = 0
%     substitute(l1, m, max_list(l1)) U het_list(l2...ln, m), l1 = list
%   [l1] U het_list(l2...ln, m), otherwise
% het_list(i,i,o)
het_list([], _, []).
het_list([H|T], M, [R1|R]) :-
    is_list(H), !,
    max_list(H, SM),
    substitute(H, M, SM, R1),
    het_list(T, M, R).
het_list([H|T], M, [H|R]) :-
    het_list(T, M, R).

% het_main(l1...ln) = { het_list(l1...ln, get_global_max(l1...ln))
% het_main(i,o)
het_main(L, R) :-
    get_global_max(L, M),
    het_list(L, M, R).

