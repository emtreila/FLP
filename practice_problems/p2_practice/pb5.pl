% 5. a. Substitute all occurrences of an element of a list with all the
% elements of another list.
% Eg. subst([1,2,1,3,1,4],1,[10,11],X) produces
% X=[10,11,2,10,11,3,10,11,4].
% b. For a heterogeneous list, formed from integer numbers and list of
% numbers, replace in every sublist all
% occurrences of the first element from sublist it a new given list.
%  Eg.: [1, [4, 1, 4], 3, 6, [7, 10, 1, 3, 9], 5, [1, 1, 1], 7] si [11,
% 11] =>
% [1, [11, 11, 1, 11, 11], 3, 6, [11, 11, 10, 1, 3, 9], 5, [11 11 11 11
% 11 11], 7]


% append_lists(a1...an,b1...bm) = { b1...bm, n = 0
%                       [a1] U append_lists(a2...an,b1...bm),otherwise
% append_lists(i,i,o)
append_lists([],L,L).
append_lists([H|T],L,[H|R]):-
    append_lists(T,L,R).

% sub_with_list(l1...ln,s1...sm,elem) = { [], n = 0
%                           [l1] U sub_with_list(l2...ln,S,elem),l1!=elem
%                            S U sub_with_list(l2...ln,S,elem), l1=elem
% sub_with_list(i,i,i,o)
sub_with_list([],_,_,[]).
sub_with_list([H|T],S,H,R):- !,
    sub_with_list(T,S,H,R1),
    append_lists(S,R1,R).
sub_with_list([H|T],S,E,[H|R]):-
    sub_with_list(T,S,E,R).

% het_list(l1...ln,sub1...subm) = { [], n = 0
%        sub_with_list(l1,sub1...subm,l1.1) U het_list(l2...ln),l1=list
%        [l1] U het_list(l2...ln), otherwise
% het_list(i,i,o)
het_list([],_,[]).
het_list([H|T],S,[RSUB|R]):-
    is_list(H), !,
    H = [First|_],
    sub_with_list(H,S,First,RSUB),
    het_list(T,S,R).
het_list([H|T],S,[H|R]):-
    het_list(T,S,R).
