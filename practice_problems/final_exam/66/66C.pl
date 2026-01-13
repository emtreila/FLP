% C. Write a PROLOG program that generates the list of all combinations
% of k elements with numbers from 1 to N, with the property that the
% difference between two consecutive numbers from a combination has an
% even value. Write the mathematical models and flow models for the
% predicates used.

% For example, for N = 4, k = 2 -> [[1, 3], [2, 4]]

% range(a,b) = { [b], a = b
%                a U range(a+1, b), otherwise
% range(i,i,o)
range(B,B,[B]).
range(A,B,[A|R]):-
    A < B,
    A1 is A + 1,
    range(A1,B,R).

comb(_, 0, []).
comb([H|T], K, [H|R]) :-
    K > 0,
    K1 is K - 1,
    comb(T, K1, R).
comb([_|T], K, R) :-
    K > 0,
    comb(T, K, R).

even_dif([_]).
even_dif([A,B|T]):-
    D is B - A,
    D mod 2 =:= 0,
    even_dif([B|T]).

final(N,K,C):-
    range(1,N,R),
    comb(R,K,C),
    even_dif(C).
