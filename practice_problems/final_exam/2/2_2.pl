% II. For any given positive natural number N, generate all the sets of
% prime numbers that add up to N (including N if applicable). Write the
% mathematical and flow model and the meaning of all variables for each
% predicate used.
% Ex: N = 18 -> [[2,3,13],[2,5,11],[5,13],[7,11]]


% divisible_by_any(nr, div) = { true, nr mod div == 0
%                               false, otherwise 2<= div <= nr/2
% divisible_by_any(i,i)
divisible_by_any(N,D):-
    D =< (N/2),
    N mod D =:= 0.
divisible_by_any(N,D):-
    D =< (N/2),
    N mod D =\= 0,
    D1 is D + 1,
    divisible_by_any(N,D1).

% is_prime(nr) = { true, divisible_by_any(nr,2) = false
%                       false, otherwise
% is_prime(i)
is_prime(N):-
    not(divisible_by_any(N,2)).

% prime_range(A,B) = { A U prime_range(A+1,B),is_prime(A)=true and A<=B
%                     prime_range(A+1,B), otherwise
% prime_range(i,i,o)
prime_range(A,B,[]):-
    A > B.
prime_range(A,B,[A|R]):-
    A =< B,
    A =\= 1,
    is_prime(A), !,
    A1 is A + 1,
    prime_range(A1,B,R).
prime_range(A,B,R):-
    A =< B,
    A1 is A + 1,
    prime_range(A1,B,R).


% subsets(l1...ln) = { [], n = 0
%          l1 U subsets(l2...ln), when we generate subsets that have l1
%          subsets(l2...ln), generate subsets without l1
% subsets(i,o)
% subsets(L:list, Output:List)
subsets([],[]).
subsets([H|T],[H|R]):-
    subsets(T,R).
subsets([_|T],R):-
    subsets(T,R).


% sum(l1...ln) = { 0, n = 0
%                  l1 + sum(l2...ln), otherwise
% sum(i,o)
% sum(L:list, Output:integer)
sum([],0).
sum([H|T],S):-
    sum(T,S1),
    S is S1 + H.

final(N, R):-
    prime_range(2,N,P),
    subsets(P,R),
    sum(R,S),
    S =:= N.

main(N,L):-
    findall(R,
           final(N,R),
           L
           ).

