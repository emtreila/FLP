% 8. a. Determine the successor of a number represented as digits in a
% list.
% Eg.: [1 9 3 5 9 9] --> [1 9 3 6 0 0]
% b. For a heterogeneous list, formed from integer numbers and list of
% numbers, determine the successor of a
% sublist considered as a number.
% [1, [2, 3], 4, 5, [6, 7, 9], 10, 11, [1, 2, 0], 6] =>
% [1, [2, 4], 4, 5, [6, 8, 0], 10, 11, [1, 2, 1], 6]

% reverse_list(l1...ln) = { [], n = 0
%                     reverse_list(l2...ln) U [l1], otherwise
% reverse_list(i,i,o)
reverse_list([],R,R).
reverse_list([H|T],R,Res):-
    reverse_list(T,[H|R],Res).

reverse_main(L,R):- reverse_list(L,[],R).

% successor(l1...ln,carry) = { [], n = 0 && carry = 0
%                         [carry], n=1 && carry!=0
%          [(l1+carry)%10] U successor(l2...ln,(l1+carry)//10),
%                               otherwise
% successor(i,i,o)
successor([],0,[]):- !.
successor([],C,[C]):-
    C > 0, !.
successor([H|T],C,[D|R]):-
    N is H+C,
    D is N mod 10,
    C1 is N//10,
    successor(T,C1,R).

successor_main(L,RES):-
    reverse_list(L,[],R),
    successor(R,1,R1),
    reverse_list(R1,[],RES).

% het_list(l1...ln) = { [], n = 0
%       successor_main(l1) U het_list(l2...ln), l1=list
%       l1 U het_list(l2...ln), otherwise
het_list([],[]).
het_list([H|T],[R|RES]):-
    is_list(H), !,
    successor_main(H,R),
    het_list(T,RES).
het_list([H|T],[H|RES]):-
    het_list(T,RES).
