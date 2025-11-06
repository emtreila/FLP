% 7. a. Write a predicate to compute the intersection of two sets.
% b. Write a predicate to create a list (m, ..., n) of all integer
% numbers from the interval [m, n].

% is_in_list(l1...ln,l) = { false, n = 0
%                           true, l1 = e
%                           is_in_list(l2...ln,l), otherwise
% is_in_list(i,i)
is_in_list([H|_],H):-!.
is_in_list([_|T],E):-
    is_in_list(T,E).

% intersection(a1...an,b1...bm) = { [], n=0
%                          [a1] U intersection(a2...an,b1...bm),
%                                   is_in_list(b1...bm,a1)=true
%                          intersection(a2...an,b1...bm), otherwise
% intersection(i,i,o)
intersection([],_,[]).
intersection([H1|T1],B,[H1|R]):-
    is_in_list(B,H1), !,
    intersection(T1,B,R).
intersection([_|T1],B,R):-
    intersection(T1,B,R).

% create_list(m,n) = { [n], m=n
%                      [m] U create_list(m+1,n), m < n
%                      [m] U create_list(m-1,n), m > n
% create_list(i,i,o)
create_list(M,M,[M]).
create_list(M,N,[M|R]):-
    M < N, !,
    M1 is M + 1,
    create_list(M1,N,R).
create_list(M,N,[M|R]):-
    M > N,
    M1 is M - 1,
    create_list(M1,N,R).

