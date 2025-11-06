% 11. a. Write a predicate to substitute an element from a list with another element
% in the list.
% b. Write a predicate to create the sublist (lm, …, ln) from the list
% (l1,…, lk).


% substitute(l1..ln, elem, sub) = { [], n = 0
%                              [l1] U substitute(l2...ln,elem,sub),
%                                                     l1!=elem
%                              [sub] U substitute(l2...ln,elem,sub),
%                                                     l1=elem
%substitute(i,i,i,o)
substitute([],_,_,[]).
substitute([H|T],H,S,[S|R]):- !,
    substitute(T,H,S,R).
substitute([H|T],E,S,[H|R]):-
    substitute(T,E,S,R).

% sublist(l1...lk,m,n,cnt) = { [ln], m = n
%                             sublist(l2...lk), cnt<m
%                             [lm] U sublist(l2...lk),m<=cnt<=n
% sublist(i,i,i,i,o)
sublist([],_,_,_,[]).
sublist([H],_,N,N,[H]).
sublist([H|T],M,N,Cnt,[H|R]):-
    Cnt >= M,
    Cnt =< N, !,
    Cnt1 is Cnt + 1,
    sublist(T,M,N,Cnt1,R).
sublist([_|T],M,N,Cnt,R):-
    Cnt1 is Cnt + 1,
    sublist(T,M,N,Cnt1,R).

sublist_main([H|T],M,N,R):- sublist([H|T],M,N,1,R).
