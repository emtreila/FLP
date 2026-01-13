%C. Write a PROLOG program that generates the list of all subsets with
% values between the interval [a,b], having an even number of even
% values and an odd number of odd values in each subset.
% Write the mathematical models and flow models for the predicates used.

% For example, for a=2 and b=4 -> [[2,3,4]].

% range(a,b) = { [b], a = b
%                a U range(a+1,b), otherwise
% range(i,i,o)
range(B,B,[B]).
range(A,B,[A|R]):-
    A < B,
    A1 is A + 1,
    range(A1,B,R).

% even_nr(l1...ln) = { 1 + even_nr(l2...ln), l2 % 2 == 0
%                      even_nr(l2...ln), otherwise
% even_nr(i,o)
even_nr([],0).
even_nr([H|T],E):-
    0 is H mod 2, !,
    even_nr(T,E1),
    E is E1 + 1.
even_nr([_|T],E):-
    even_nr(T,E).

% odd(l1...ln) = { 1 + odd_nr(l2...ln), l2 % 2 == 1
%                      odd_nr(l2...ln), otherwise
% odd_nr(i,o)
odd_nr([],0).
odd_nr([H|T],O):-
    1 is H mod 2, !,
    odd_nr(T,O1),
    O is O1 + 1.
odd_nr([_|T],O):-
    odd_nr(T,O).

% subsets(l1...ln) = { [], n = 0
%                      l1 U subsets(l2...ln)
%                      subsets(l2...ln)
% subsets(i,o)
subsets([],[]).
subsets([H|T],[H|R]):-
    subsets(T,R).
subsets([_|T],R):-
    subsets(T,R).

solve(A,B,R):-
    range(A,B,R),
    even_nr(R,E),
    0 is E mod 2,
    odd_nr(R,O),
    1 is O mod 2.
