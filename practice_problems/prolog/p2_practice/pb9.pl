% 9. a. For a list of integer number, write a predicate to add in list
% after 1-st, 3-rd, 7-th, 15-th element a given value e.
% b. For a heterogeneous list, formed from integer numbers and list of
% numbers; add in every sublist after 1-st,
% 3-rd, 7-th, 15-th element the value found before the sublist in the
% heterogenous list. The list has the particularity
% that starts with a number and there aren’t two consecutive elements
% lists.
% Eg.: [1, [2, 3], 7, [4, 1, 4], 3, 6, [7, 5, 1, 3, 9, 8, 2, 7], 5] =>
% [1, [2, 1, 3], 7, [4, 7, 1, 4, 7], 3, 6, [7, 6, 5, 1, 6, 3, 9, 8, 2, 6,
% 7], 5].


% add_elem(l1...ln,elem,cnt,p) = { [], n = 0
%                [elem,l1] U add_elem(l2...ln,elem,cnt+1,p), cnt=p
%                [l1] U add_elem(l2...an,elem,cnt+1,p), otherwise
% add_elem(i,i,i,i,o)
add_elem([],_,_,_,[]).
add_elem([H|T],E,P,P,[H,E|R]):- !,
    P1 is P*2+1,
    C1 is P+1,
    add_elem(T,E,C1,P1,R).
add_elem([H|T],E,C,P,[H|R]):-
    C1 is C+1,
    add_elem(T,E,C1,P,R).

add_main(L,E,R):- add_elem(L,E,1,1,R).

% het_list(l1...ln,prev) = { [], n = 0
%            add_elem(l1,prev,1,1) U het_list(l2...ln,prev), l1=list
%            l1 U het_list(l2...ln,l1), l1 = not list
% het_list(i,i,o)
het_list([],_,[]).
het_list([H|T],Prev,[RES|R]):-
    is_list(H), !,
    add_main(H,Prev,RES),
    het_list(T,Prev,R).
het_list([H|T],_,[H|R]):-
    het_list(T,H,R).

het_main([H|T],R):- het_list([H|T],H,R).
