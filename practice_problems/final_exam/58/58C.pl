% C. Write a PROLOG program that generates the list of all subsets with
% at least N elements such that the value of the sum of all elements
% from each subset is divisible by 3, from a list of integers.

% Write the mathematical models and flow models for the predicates used.

% For example, for the list L = [2,3,4] and N = 1
% the result is[[3], [2,4], [2,3,4]](not necessarily in this order).

% subset(l1...ln) = { [], n = 0
%                     l1 U subset(l2...ln), include l1
%                     subset(l2...ln), exclude l1
% subset(i,o)
subset([],[]).
subset([H|T],[H|R]):-
    subset(T,R).
subset([_|T],R):-
    subset(T,R).

% len(l1...ln) = { 0, n = 0
%                  1 + len(l2...ln)
% len(i,o)
len([],0).
len([_|T],S):-
    len(T,S1),
    S is S1 + 1.

% sum_all(l1...ln) = { 0, n = 0
%                      l1 + sum_all(l2...ln), otherwise
% sum_all(i,o)
sum_all([],0).
sum_all([H|T],S):-
    sum_all(T,S1),
    S is H + S1.

% main(l1...ln, N) = { subset(l1...ln) && len(sub_i)=N
%                               && sum_all(sub_i) mod 3 = 0
% main(i,i,o)
main(L,N,R):-
    subset(L,R),
    len(R,Len),
    Len >= N,
    sum_all(R,S),
    0 is S mod 3.
