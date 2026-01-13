% C. Given a list composed of integer numbers, generate in PROLOG the
% list of arrangements of N elements ending with an odd value and having
% the sum S given.
% Write the mathematical models and flow models for the predicates used.

% For example, for the list: L = [2,7,4,5,3], N = 2 and S = 7
% the result is: [[2,5], [4,3]]

% get_last(l1...ln) = { get_last(l2...ln), l1 is not the last elem
%                       ln, otherwise
% get_last(i,o)
get_last([X],X).
get_last([_|T],X):-
    get_last(T,X).

remove(X,[X|T],T).
remove(X,[H|T],[H|R]):-
    remove(X,T,R).

arr(_,[]).
arr(L,[H|T]):-
    remove(H,L,R),
    arr(R,T).

sum([],0).
sum([H|T],S):-
    sum(T,S1),
    S is S1 + H.

len([_],1).
len([_|T],L):-
    len(T,L1),
    L is L1 + 1.

solve(Li,N,S,A):-
    arr(Li,A),
    len(A,LA),
    LA =:= N,
    sum(A,SA),
    SA =:= S,
    get_last(A,NR),
    1 is NR mod 2.
