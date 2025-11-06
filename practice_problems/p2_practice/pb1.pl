% 1.a. Sort a list with removing the double values. E.g.: [4 2 6 2 3 4] --> [2 3 4 6]
% b. For a heterogeneous list, formed from integer numbers and list of
% numbers, write a predicate to sort every
%sublist with removing the doubles.
%Eg.: [1, 2, [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7] =>
%[1, 2, [1, 4], 3, 6, [1, 3, 7, 9, 10], 5, [1], 7].


% is_in_list(l1...ln,l) = { false, n = 0
%                           true, l1 = e
%                           is_in_list(l2...ln,l), otherwise
% is_in_list(i,i)
is_in_list([H|_],H):-!.
is_in_list([_|T],E):-
    is_in_list(T,E).

% remove_dup(l1...ln) = { [], n = 0
%                 [l1] U remove_dup(l2...ln), is_in_list(l2...ln,l1)=false
%                 remove_dup(l2...ln), is_in_list(l2...ln,l1)=true
%remove_dup(i,o)
remove_dup([], []).
remove_dup([H|T], [H|R]) :-
    not(is_in_list(T, H)), !,
    remove_dup(T, R).
remove_dup([_|T], R) :-
    remove_dup(T, R).

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

% final(l1...ln) = { sort_list(remove_dup(l1...ln))
% final(i,o)
final(L, R) :-
    remove_dup(L, L1),
    sort_list(L1, R).

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
