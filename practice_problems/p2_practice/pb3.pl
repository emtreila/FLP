% 3. a. Merge two sorted lists with removing the double values.
% b. For a heterogeneous list, formed from integer numbers and list of
% numbers, merge all sublists with removing the double values.
% [1, [2, 3], 4, 5, [1, 4, 6], 3, [1, 3, 7, 9, 10], 5, [1, 1, 11], 8] =>
% [1, 2, 3, 4, 6, 7, 9, 10, 11].

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
final_list(L, R) :-
    remove_dup(L, L1),
    sort_list(L1, R).

% append_lists(a1...an,b1...bm) = { b1...bm, n = 0
%                       [a1] U append_lists(a2...an,b1...bm),otherwise
% append_lists(i,i,o)
append_lists([],L,L).
append_lists([H|T],L,[H|R]):-
    append_lists(T,L,R).

% merge_without_dup(a1...an,b1...bm) = { append_lists(A,B)
%                                        final_list(R,FIN)
% merge_without_dup(i,i,o)
merge_without_dup(A,B,RES):-
    append_lists(A,B,AB),
    final_list(AB,RES).

% het_list(l1...ln) = { [], n = 0
%                  merge_without_dup(l1, het_list(l2...ln)), is_list(l1)=true
%                  het_list(l2...ln), otherwise
% het_list(i,o)
het_list([],[]).
het_list([H|T],R):-
    is_list(H), !,
    het_list(T,R1),
    merge_without_dup(H,R1,R).
het_list([_|T],R):-
    het_list(T,R).
