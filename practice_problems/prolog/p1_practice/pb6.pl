% 6. a. Write a predicate to test if a list is a set.
% b. Write a predicate to remove the first three occurrences of an
% element in a list. If the element occurs less
% than three times, all occurrences will be removed.

% nr_occ(l1...ln,l) = { 0, n = 0
%                       1 + nr_occ(l2...ln,l), 11==l
%                       nr_occ(l2...ln), otherwise
% nr_occ(i,i,o)
nr_occ([],_,0).
nr_occ([H|T],H,R):-
     !,
     nr_occ(T,H,R1),
     R is R1 + 1.

nr_occ([_|T],L,R):-
    nr_occ(T,L,R).

% is_set(l1...ln) = { true, nr_occ(l1)=1 && is_list(l2...ln)=true
%                      false, otherwise
% is_set(i)
is_set([]).
is_set([H|T]):-
    nr_occ([H|T],H,Cnt),
    Cnt =:= 1,
    is_set(T).

%remove_first3(l1...ln,elem,cnt) = { [], n = 0
%                       remove_first3(l2...ln,elem,cnt-1), elem=l1,cnt>0
%                      [l1] U remove_first3(l2...ln,elem,cnt), otherwise
%remove_first3(i,i,i,o)

remove_first3([],_,_,[]).
remove_first3([H|T],E,K,R):-
     H =:= E,
     K > 0, !,
     K1 is K-1,
     remove_first3(T,E,K1,R).
remove_first3([H|T],E,K,[H|R]):-
     remove_first3(T,E,K,R).

%remove_main(l1...ln,elem) = { remove_first3(l1...ln,elem,3)
%remove_main(i,i,o)
remove_main([H|T],E,R):- remove_first3([H|T],E,3,R).
