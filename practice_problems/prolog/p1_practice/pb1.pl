% 1. a. Write a predicate to determine the lowest common multiple of a
% list formed from integer numbers.
%  b. Write a predicate to add a value v after 1-st, 2-nd, 4-th, 8-th, …
% element in a list.


% cmmdc(X,Y) = { X, Y = 0
%                cmmdc(Y,X mod Y), otherwise
% cmmdc(i,i,o)
cmmdc(X,0,X):- !.
cmmdc(X,Y,R):-
    Y1 is X mod Y,
    cmmdc(Y,Y1,R).

% cmmmc(X,Y) = { X*Y / cmmdc(X,Y)
% cmmmc(i,i,o)
cmmmc(X,Y,R):-
    cmmdc(X,Y,D),
    R is (X*Y) // D.

% cm_list(l1...ln) = { 0, n = 0
%                      l1, n = 1
%                      cmmmc(l1, cm_list(l2...ln)), otherwise

cm_list([],0).
cm_list([H],H).
cm_list([H1,H2|T],R):-
    cmmmc(H1,H2,R1),
    cm_list([R1|T],R).

% add_after(l1...ln,v,curr,valPos) = { [], n = 0
%                      [l1,v] U add_after(l2...ln,v,curr+1,valPos*2),
%                               curr == valPos
%                      [l1] U add_after(l2...ln,curr+1,valPos),otherwise
% add_after(i,i,i,i,o)
add_after([],_,_,_,[]).
add_after([H|T],V,C,P,[H,V|R]):-
    C =:= P, !,
    C1 is C+1,
    P1 is P*2,
    add_after(T,V,C1,P1,R).

add_after([H|T],V,C,P,[H|R]):-
    C1 is C+1,
    add_after(T,V,C1,P,R).


% add_after_main(l1...ln,v) = { add_after(l1...ln,v,pos,vPos)
% add_after_main(i,i)

add_after_main(L,V,R):- add_after(L,V,1,1,R).
