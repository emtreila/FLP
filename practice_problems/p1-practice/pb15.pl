% 15. a. Write a predicate to transform a list in a set, considering the first occurrence.
% Eg: [1,2,3,1,2] is transform in [1,2,3].
% b. Write a predicate to decompose a list in a list respecting the
% following: [list of even numbers list of odd numbers] and also
% return the number of even numbers and the numbers of odd numbers.

% is_in_list(l1...ln,l) = { false, n = 0
%                           true, l1 = e
%                           is_in_list(l2...ln,l), otherwise
% is_in_list(i,i)
is_in_list([H|_],H):-!.
is_in_list([_|T],E):-
    is_in_list(T,E).

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

% transform(l1...ln) = { [], n = 0
%                      l1 U transform(remove(l2...ln,l1)),otherwise
% transform(i,o)
transform([],[]).
transform([H|T],[H|R]):-
    remove([H|T],H,S),
    transform(S,R).


% append_lists(a1...an,b1...bm) = { b1...bm, n = 0
%                       [a1] U append_lists(a2...an,b1...bm),otherwise
% append_lists(i,i,o)
append_lists([],L,L).
append_lists([H|T],L,[H|R]):-
    append_lists(T,L,R).

% even_odd(l1...ln) = { [][], n=0
%                 ([l1] U E,O), l1%2=0, (E,O)=even_odd(l2...ln)
%                 (E, [l1] U O), l1%2=1,(E,O)=even_odd(l2...ln)
%
% even_odd(i,o,o)
even_odd([],[],[]).
even_odd([H|T],[H|E],O):-
    H mod 2 =:= 0, !,
    even_odd(T,E,O).
even_odd([H|T],E,[H|O]):-
    even_odd(T,E,O).

% len(l1...ln) = { 0, n = 0
%                  1 + len(l2...ln), otherwise
% len(i,o)
len([],0).
len([_|T],L):-
    len(T,L1),
    L is L1+1.

% final(l1...ln) = { ([],0,0), n = 0
%                     R = E | O
%                     NRE = len(E)
%                     NRO = len(O)
% final(i,o,o,o)
final([H|T],R,NRE,NRO):-
    even_odd([H|T],E,O),
    len(E,NRE),
    len(O,NRO),
    append_lists(E,O,R).
