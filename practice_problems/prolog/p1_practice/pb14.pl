% 14. a. Write a predicate to test equality of two sets without using the set difference.
% b. Write a predicate to select the n-th element of a given list.

% is_in_list(l1...ln,l) = { false, n = 0
%                           true, l1 = e
%                           is_in_list(l2...ln,l), otherwise
% is_in_list(i,i)
is_in_list([H|_],H):-!.
is_in_list([_|T],E):-
    is_in_list(T,E).

% all_in(a1...an,B) = { true, n = 0
%                is_in_list(B,a1) and all_in(a2...an,B), otherwise
% all_in(i,i)
all_in([],_).
all_in([H|T],B):-
    is_in_list(B,H),
    all_in(T,B).

% equality(a1...an,b1...bm) = { true, if all_in(A,B) and all_in(B,A)
% equality(i,i)
equality([],[]).
equality(A,B):-
    all_in(A,B),
    all_in(B,A).

% select_nth(l1...lm,n,cnt) = { [], m=0
%                               select_nth(l2...lm,n,cnt),cnt!=n
%                               l1 , cnt == n
% select_nth(i,i,i,o)
select_nth([H|_],N,N,H):-!.
select_nth([_|T],N,Cnt,R):-
    Cnt1 is Cnt + 1,
    select_nth(T,N,Cnt1,R).


select_nth_main([H|T],N,R):- select_nth([H|T],N,1,R).
