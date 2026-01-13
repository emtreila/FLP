% 3. a. Define a predicate to remove from a list all repetitive
% elements. Eg.: l=[1,2,1,4,1,3,4] => l=[2,3])
% b. Remove all occurrence of a maximum value from a list on integer
% numbers.

% remove(l1...ln,a) = { [], n = 0
%		        [l1] U remove([l2...ln],a), l1 != a
%			remove([l2...ln]), otherwise
% remove(i,i,o)
remove([],_,[]).
remove([H|T],A,R):-
    H == A, !,
    remove(T,A,R).
remove([H|T],A,[H|R]):-
    remove(T,A,R).

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

% remove_rep(l1...ln) = { [], n = 0
%                      [l1] U remove_rep(l2...ln), nr_occ(l1...ln,l1)=1
%                      remove_rep(remove(l1...ln),l1), otherwise
% remove_rep(i,o)
remove_rep([],[]).
remove_rep([H|T],[H|R]):-
    nr_occ([H|T],H,Cnt),
    Cnt =:= 1, !,
    remove_rep(T,R).
remove_rep([H|T],R):-
    remove([H|T],H,L),
    remove_rep(L,R).

% max(l1...ln) = { l1, n=1
%                  maximum(l1,max(l2...ln)), otherwise
% max(i,o)
max([H], H).
max([H|T], M) :-
    max(T, M1),
    (H > M1 -> M = H ; M = M1).

% remove_max(l1...ln) = { [], n = 0
%                         remove(l1...ln, max(l1...ln)), otherwise
% remove_max(i,o)
remove_max([H],H).
remove_max([H|T],L):-
    max([H|T],MAX),
    remove([H|T],MAX,L).


