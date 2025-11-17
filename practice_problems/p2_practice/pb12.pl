% 12. a. Define a predicate to add after every element from a list, the
% divisors of that number.
% b. For a heterogeneous list, formed from integer numbers and list of
% numbers, define a predicate to add in
% every sublist the divisors of every element.
% Eg.: [1, [2, 5, 7], 4, 5, [1, 4], 3, 2, [6, 2, 1], 4, [7, 2, 8, 1], 2]
% =>
% [1, [2, 5, 7], 4, 5, [1, 4, 2], 3, 2, [6, 2, 3, 2, 1], 4, [7, 2, 8, 2,
% 4, 1], 2]

% append_lists(a1...an,b1...bm) = { b1...bm, n = 0
%                       [a1] U append_lists(a2...an,b1...bm),otherwise
% append_lists(i,i,o)
append_lists([],L,L).
append_lists([H|T],L,[H|R]):-
    append_lists(T,L,R).

% divisors(nr,div) = { [], div>nr
%                   div U divisors(nr,div+1), nr%div=0
%                   divisors(nr,div+1), otherwise
% divisors(i,i,o)
divisors(N,D,[]):- D > (N//2), !.
divisors(N,D,[D|R]):-
    D =< (N//2),
    N mod D =:= 0, !,
    D1 is D + 1,
    divisors(N,D1,R).
divisors(N,D,R):-
    D1 is D + 1,
    divisors(N,D1,R).

% add_div(l1...ln) = { [], n = 0
%                 [l1] U divisors(l1,2) U add_div(l2...ln), otherwise
% add_div(i,o)
add_div([],[]).
add_div([H|T],R):-
    divisors(H,2,D),
    append_lists([H|D],R1,R),
    add_div(T,R1).


% het_list(l1...ln) = { [], n = 0
%             [l1] U het_list(l2...ln), l1!=list
%             add_div(l1) U het_list(l2...ln), l1=list
% het_list(i,o)
het_list([],[]).
het_list([H|T],[RES|R]):-
    is_list(H), !,
    add_div(H,RES),
    het_list(T,R).
het_list([H|T],[H|R]):-
    het_list(T,R).
