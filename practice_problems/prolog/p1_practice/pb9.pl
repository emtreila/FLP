%9. a. Insert an element on the position n in a list.
% b. Define a predicate to determine the greatest common divisor of all
% numbers from a list.

%insert_pos(l1...ln,pos,elem,cnt) = { [], n = 0
%                         [l1] U insert_pos(l2...ln,pos,elem,cnt),pos!=cnt
%                         [l1,elem] U insert_pos(l2...ln,pos,elem,cnt),
%                                                            pos=cnt
% insert_pos(i,i,i,i,o)
insert_pos([],_,_,_,[]).
insert_pos([H|T],P,E,P,[E,H|R]):- !,
    C1 is P+2,
    insert_pos(T,P,E,C1,R).
insert_pos([H|T],P,E,C,[H|R]):-
    C1 is C+1,
    insert_pos(T,P,E,C1,R).

insert_main([H|T],POS,ELEM,R):- insert_pos([H|T],POS,ELEM,1,R).


% cmmdc(X,Y) = { X, Y = 0
%                cmmdc(Y,X mod Y), otherwise
% cmmdc(i,i,o)
cmmdc(X,0,X):- !.
cmmdc(X,Y,R):-
    Y1 is X mod Y,
    cmmdc(Y,Y1,R).

% cmmdc_list(l1...ln) = { 0, n = 0
%                      l1, n = 1
%                      cmmdc(l1, cmmdc_list(l2...ln)), otherwise

cmmdc_list([],0).
cmmdc_list([H],H).
cmmdc_list([H1,H2|T],R):-
    cmmdc(H1,H2,R1),
    cmmdc_list([R1|T],R).


