% 2. a. Sort a list with keeping double values in resulted list. E.g.:
% [4 2 6 2 3 4] --> [2 2 3 4 4 6]
% b. For a heterogeneous list, formed from integer numbers and list of
% numbers, write a predicate to sort every sublist, keeping the doubles.
% Eg.: [1, 2, [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7] =>
% [1, 2, [1, 4, 4], 3, 6, [1, 3, 7, 9, 10], 5, [1, 1, 1], 7].

% insert_sorted(l1...ln, e) = { [e], n = 0
%                       [e,l1] U insert_sorted(l2...ln,e), e<l1
%                       [l1] U insert_sorted(l2...ln,e), otherwise
% insert_sorted(i,i,o)
insert_sorted([], E, [E]).
insert_sorted([H|T], E, [E,H|T]) :-
    E < H, !.
insert_sorted([H|T], E, [H|R]) :-
    insert_sorted(T, E, R).

% sort_list(l1...ln) = { [], n = 0
%                      insert_sorted(sort_list(l2...ln),l1),otherwise
% sort_list(i,o)
sort_list([], []).
sort_list([H|T], R) :-
    sort_list(T, R1),
    insert_sorted(R1, H, R).

% final(l1...ln) = { sort_list(l1...ln)
% final(i,o)
final(L, R) :- sort_list(L, R).

% het_list(l1...ln) = { [], n = 0
%                  final(l1) U het_list(l2...ln), is_list(l1)=true
%                  l1 U het_list(l2...ln), otherwise
% het_list(i,o)
het_list([],[]).
het_list([H|T],[R1|R]):-
    is_list(H), !,
    final(H,R1),
    het_list(T,R).
het_list([H|T],[H|R]):-
    het_list(T,R).
