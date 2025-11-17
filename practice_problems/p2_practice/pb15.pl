% 15. a. Define a predicate to determine the predecessor of a number
% represented as digits in a list. Example: [1, 9, 3, 6, 0, 0] => [1, 9,
% 3, 5, 9, 9]
% b. For a heterogeneous list, formed from integer numbers
% and list of numbers, define a predicate to determine the predecessor
% of every sublist considered as numbers. Example: [1, [2, 3], 4, 5, [6,
% 7, 9], 10, 11, [1, 2, 0], 6] => [1, [2, 2], 4, 5, [6, 7, 8], 10, 11,
% [1, 1, 9], 6]


% reverse_list(l1...ln) = {  [], n = 0
%   reverse_list(l2...ln) U [l1], otherwise
% reverse_list(i,o)
reverse_list(L, R):- reverse_acc(L, [], R).
reverse_acc([], A, A).
reverse_acc([H|T], A, R):-
    reverse_acc(T, [H|A], R).


% predecessor(l1...ln, borrow) = {  [], n = 0
%[(l1 - 1 + borrow) mod 10] U predecessor(l2...ln, new_borrow), otherwise
% predecessor(i,i,o)
predecessor([], _, []).
predecessor([H|T], B, [D|R]):-
    N is H - 1 + B,
    (N < 0 -> D is 9, B1 is -1 ; D is N, B1 is 0),
    predecessor(T, B1, R).


% predecessor_main(l1...ln) = {
%   reverse_list(l1...ln) -> predecessor -> reverse_list(result)
% predecessor_main(i,o)
predecessor_main(L, R):-
    reverse_list(L, Rev),
    predecessor(Rev, 0, RevRes),
    reverse_list(RevRes, R).


% het_list(l1...ln) = { [], n = 0
%   [predecessor_main(l1)] U het_list(l2...ln), if l1 is a list
%   [l1] U het_list(l2...ln), otherwise
% het_list(i,o)
het_list([], []).
het_list([H|T], [R1|R]):-
    is_list(H), !,
    predecessor_main(H, R1),
    het_list(T, R).
het_list([H|T], [H|R]):-
    het_list(T, R).
