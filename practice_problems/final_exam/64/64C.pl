% C. Write a PROLOG program that generates the list of all subsets of k
% elements (all elements being odd numbers) in arithmetic progression.
% Write the mathematical models and flow models for the predicates used.

% For example, for L=[1,5,2,9,3] and k=3 -> [[1,5,9],[1,3,5]]

% subsets(l1...ln) = { [], n = 0
%                      l1 U subsets(l2...ln)
%                      subsets(l2...ln)
% subsets(i,o)
subsets([],[]).
subsets([H|T],[H|R]):- subsets(T,R).
subsets([_|T],R):- subsets(T,R).

len([],0).
len([_|T],L):-
    len(T,L1),
    L is L1 + 1.

% ap_dif(l1...ln, d) = { true, n = 1
%                       true, l2 - l1 == d and ap_dif(l2...ln, d)
%                       false, otherwise
% ap_dif(i,i)
ap_dif([_],_).
ap_dif([A,B|T],D):-
    B - A =:= D,
    ap_dif([B|T],D).

% ap(l1...ln) = { true, n = 0,1,2
%                 true, l2 - l1 = d and ap_dif(l2...ln, d)
%                 false, otherwise
% ap(i)
ap([]).
ap([_]).
ap([_,_]).
ap([A,B|T]):-
    D is B - A,
    ap_dif([B|T],D).

% all_odd(l1..ln) = { true, l1%2==1 and all_odd(l2...ln)
%                     false, otherwise
% all_odd(i)
all_odd([]).
all_odd([H|T]):-
    1 is H mod 2,
    all_odd(T).

solve(L,K,R):-
    subsets(L,R),
    len(R,Len),
    K =:= Len,
    all_odd(R),
    ap(R).
