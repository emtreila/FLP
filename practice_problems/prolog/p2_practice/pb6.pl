% 6. a. Determine the product of a number represented as digits in a
% list to a given digit.
% Eg.: [1 9 3 5 9 9] * 2 => [3 8 7 1 9 8]
%  b. For a heterogeneous list, formed from integer numbers and list of
% numbers, write a predicate to replace
% every sublist with the position of the maximum element from that
% sublist.
% [1, [2, 3], [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7] =>
% [1, [2], [1, 3], 3, 6, [2], 5, [1, 2, 3], 7]

% reverse_list(l1...ln) = { [], n = 0
%                     reverse_list(l2...ln) U [l1], otherwise
% reverse_list(i,i,o)
reverse_list([],R,R).
reverse_list([H|T],R,Res):-
    reverse_list(T,[H|R],Res).

reverse_main(L,R):- reverse_list(L,[],R).

% multiply(l1...ln,x,carry) = { 0, x = 0 || n = 0
%                              [l1...ln], x = 1
%          [(l1*2+carry)%10] U multiply(l2...ln,x,(l1*2+carry)//10),
%                               otherwise
% multiply(i,i,i,o)
multiply(_,0,_,[]):-!.
multiply([],_,_,[]):-!.
multiply([H|T],X,C,[D|R]):-
    P is H*X+C,
    D is P mod 10,
    C1 is P//10,
    multiply(T,X,C1,R).

multiply_main(L,X,RES):-
    reverse_list(L,[],R),
    multiply(R,X,0,R1),
    reverse_list(R1,[],RES).


% max(l1...ln) = { l1, n=1
%                  maximum(l1,max(l2...ln)), otherwise
% max(i,o)
max([H], H).
max([H|T], M) :-
    max(T, M1),
    (H > M1 -> M = H ; M = M1).

% pos(l1...ln,cnt,elem) = { [], n = 0
%           [cnt] U pos(l2...ln), l1=elem
%           pos(l2...ln), otherwise
% pos(i,i,o)
pos([],_,_,[]).
pos([H|T],C,H,[C|R]):- !,
    C1 is C+1,
    pos(T,C1,H,R).
pos([_|T],C,E,R):-
    C1 is C+1,
    pos(T,C1,E,R).

% pos_max(l1...ln) = { pos(l1...ln,1,max(l1...ln))
% pos_max(i,o)
pos_max([],[]).
pos_max(L,RES):-
    max(L,MAX),
    pos(L,1,MAX,RES).

% het_list(l1...ln) = { [], n = 0,
%              pos_max(l1) U het_list(l2...ln), l1=list
%              [l1] U het_list(l2...ln), otherwise
% het_list(i,o)
het_list([],[]).
het_list([H|T],[RES|R]):-
    is_list(H), !,
    pos_max(H,RES),
    het_list(T,R).
het_list([H|T],[H|R]):-
    het_list(T,R).
