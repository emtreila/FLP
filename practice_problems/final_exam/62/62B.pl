% B. Given a list composed of integer numbers and sublists of integer
% numbers, write a SWI-Prolog program that verifies if all the elements
% of the list (including those in sublists) form a symmetrical sequence.

% For example, for the list: [1, 5, [2,4], 7, 11, 25, [11,7,4], 2, 5, 1]
% the result will be: true


% append_lists(a1...an,b1...bm) = { b1...bm, n = 0
%                       [a1] U append_lists(a2...an,b1...bm),otherwise
% append_lists(i,i,o)
append_lists([],L,L).
append_lists([H|T],L,[H|R]):-
    append_lists(T,L,R).

% flatten(l1...ln) = { [], n = 0
%                     flatten(l1) U flatten(l2...ln), l1 = list
%                     l1 U flatten(l2...ln), l1 = integer
% flatten(i,o)
flatten([],[]).
flatten([H|T],[H|R]):-
    integer(H),
    flatten(T,R).
flatten([H|T],R):-
    is_list(H),
    flatten(H,R1),
    flatten(T,R2),
    append_lists(R1,R2,R).

% get_last(l1...ln) = { get_last(l2...ln), l1 is not the last elem
%                       ln, otherwise
% get_last(i,o)
get_last([X],X).
get_last([_|T],X):-
    get_last(T,X).

% remove_last(l1...ln) = { l1 U remove_last(l2..ln-1)
% remove_last(i,o)
remove_last([_],[]).
remove_last([H|T],[H|R]):-
    remove_last(T,R).
symmetric([]).
symmetric([_]).
symmetric([H|T]):-
    get_last([H|T],L),
    H =:= L,
    remove_last(T,R),
    symmetric(R).

solve(L):-
    flatten(L,R),
    symmetric(R).

