% 14. a. Define a predicate to determine the longest sequences of
% consecutive even numbers (if exist more maximal sequences one of them).
% b. For a heterogeneous list, formed from integer numbers and list of
% numbers, define a predicate to replace
% every sublist with the longest sequences of even numbers from that
% sublist.
% Eg.: [1, [2, 1, 4, 6, 7], 5, [1, 2, 3, 4], 2, [1, 4, 6, 8, 3], 2, [1,
% 5], 3] => [1, [4, 6], 5, [2], 2, [4, 6, 8], 2, [], 3]

% append_lists(a1...an,b1...bm) = { b1...bm, n = 0
%              [a1] U append_lists(a2...an,b1...bm), otherwise
% append_lists(i,i,o)
append_lists([], L, L).
append_lists([H|T], L, [H|R]) :-
    append_lists(T, L, R).


% longest_even(l1...ln, current_seq, best_seq) = {
%   best_seq, n = 0
%   longest_even(l2...ln, current_seq + [l1], best_seq), if l1 is even
%   longest_even(l2...ln, [], new_best_seq), if l1 is odd
% longest_even(i,i,o)
longest_even([], Cur, Cur).
longest_even([H|T], Cur, Max) :-
    H mod 2 =:= 0, !,
    append_lists(Cur, [H], Cur1),
    longest_even(T, Cur1, Max1),
    length(Cur1, L1),
    length(Max1, L2),
    (L1 > L2 -> Max = Cur1 ; Max = Max1).
longest_even([_|T], _, Max) :-
    longest_even(T, [], Max).


% get_longest_even(l1...ln) = longest_even(l1...ln, [], R)
% get_longest_even(i,o)
get_longest_even(L, R) :-
    longest_even(L, [], R).


% het_list(l1...ln) = {   [], n = 0
%   [get_longest_even(l1)] U het_list(l2...ln), if l1 is a list
%   [l1] U het_list(l2...ln), otherwise
% het_list(i,o)
het_list([], []).
het_list([H|T], [R1|R]) :-
    is_list(H), !,
    get_longest_even(H, R1),
    het_list(T, R).
het_list([H|T], [H|R]) :-
    het_list(T, R).





