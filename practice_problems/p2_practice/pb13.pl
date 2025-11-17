% 13. a. Given a linear numerical list write a predicate to remove all
% sequences of consecutive values.
% Eg.: remove([1, 2, 4, 6, 7, 8, 10], L) => L = [4, 10].
% b. For a heterogeneous list (ints + sublists), delete from every
% sublist all sequences of consecutive values.



% skip_seq(prev, l1...ln) = {
%   l1...ln,            if n = 0 or l1 != prev + 1
%   skip_seq(l1, rest), if l1 = prev + 1
% }
% skip_seq(i,i,o)
skip_seq(_, [], []).
skip_seq(Prev, [H|T], R) :-
    H =:= Prev + 1, !,
    skip_seq(H, T, R).
skip_seq(_, rest, rest).

% remove_seq(l1...ln) = {
%   [],                         n = 0
%   [l1],                       n = 1
%   remove_seq(rest),           if l2 = l1 + 1   (drop whole sequence)
%   [l1] U remove_seq(l2...ln), otherwise
% }
% remove_seq(i,o)
remove_seq([], []).
remove_seq([X], [X]).
remove_seq([X,Y|T], R) :-
    Y =:= X + 1, !,
    % start of consecutive sequence: skip it entirely
    skip_seq(Y, T, Rest),
    remove_seq(Rest, R).
remove_seq([X,Y|T], [X|R]) :-
    remove_seq([Y|T], R).

% Wrapper for (a)
% remove(i,o)
remove(L, R) :-
    remove_seq(L, R).

% het_list(l1...ln) = {
%   [], n = 0
%   [ remove_seq(l1) ] U het_list(l2...ln), if l1 is list
%   [ l1 ] U het_list(l2...ln),             otherwise
% }
% het_list(i,o)
het_list([], []).
het_list([H|T], [RH|R]) :-
    is_list(H), !,
    remove_seq(H, RH),
    het_list(T, R).
het_list([H|T], [H|R]) :-
    het_list(T, R).






