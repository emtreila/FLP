% 4. a. Write a predicate to determine the sum of two numbers written in
% list representation.
% b. For a heterogeneous list, formed from integer numbers and list of
% digits, write a predicate to compute the sum of all numbers
% represented as sublists.
% Eg.: [1, [2, 3], 4, 5, [6, 7, 9], 10, 11, [1, 2, 0], 6] => [8, 2, 2].


% reverse_list(l1...ln) = { [], n = 0
%                     reverse_list(l2...ln) U [l1], otherwise
% reverse_list(i,i,o)
reverse_list([],R,R).
reverse_list([H|T],R,Res):-
    reverse_list(T,[H|R],Res).

reverse_main(L,R):- reverse_list(L,[],R).

% add_lists(a1...an,b1...bn,carry) = { [], n=0 && m=0 && carry=0
%                           [carry], n=0 && m=0 && carry!=0
%     [(a1+b1+carry)%10] U add_lists(a2...an,b2...bn,(a1+b1+carry)//10
%                                  ,otherwise
% add_lists(i,i,i,o)
add_lists([],[],0,[]):- !.
add_lists([],[],C,[C]):- !.
add_lists([A|T1],[B|T2],C,[D|R]):-
    SUM is A+B+C,
    D is SUM mod 10,
    C1 is SUM//10,
    add_lists(T1,T2,C1,R).
add_lists([],[B|T2],C,[D|R]):-
    SUM is B+C,
    D is SUM mod 10,
    C1 is SUM//10,
    add_lists([],T2,C1,R).
add_lists([A|T1],[],C,[D|R]):-
    SUM is A+C,
    D is SUM mod 10,
    C1 is SUM//10,
    add_lists(T1,[],C1,R).

add_main(A,B,RES):- add_lists(A,B,0,RES).

% sum_list(a1...an,b1...bm) = { add_main(reverse_main(A),reverse_main(B))
% sum_list(i,i,o)
sum_list(A,B,RES):-
    reverse_main(A,AR),
    reverse_main(B,BR),
    add_main(AR,BR,R),
    reverse_main(R,RES).

% het_list(l1...ln) = { [0], n = 0
%                sum_list(l1,het_list(l2...ln)), l1=list
%                het_list(l2...ln), otherwise
% het_list(i,o)
het_list([],[0]).
het_list([H|T],RES):-
    is_list(H), !,
    het_list(T,R),
    sum_list(H,R,RES).
het_list([_|T],RES):-
    het_list(T,RES).
