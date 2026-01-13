% 12. a. Write a predicate to substitute in a list a value with all the
% elements of another list.
% b. Remove the n-th element of a list.

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

% remove_nth(l1...lm,n,cnt) = { [], m=0
%                    [l1] U remove_nth(l2...lm,n,cnt),cnt!=n
%                    remove(l2...lm,n,cnt), cnt == n
% remove_nth(i,i,i,o)
remove_nth([],_,_,[]).
remove_nth([_|T],N,N,R):- !,
    Cnt1 is N+1,
    remove_nth(T,N,Cnt1,R).
remove_nth([H|T],N,Cnt,[H|R]):-
    Cnt1 is Cnt + 1,
    remove_nth(T,N,Cnt1,R).


remove_nth_main([H|T],N,R):- remove_nth([H|T],N,1,R).
