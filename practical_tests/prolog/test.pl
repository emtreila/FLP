% Define a predicate that returns a list containing all the positions
% of the minimum element from a list of integer numbers.
% Example: [10,-14,12,13,-14] -> [2,5]

% min(l1...ln) = { l1, n == 1
%                  min(l1,min(l2...ln)), otherwise
%
% min(List, Minimum)
% List = the given list
% Minimum = the smallest element found in the given list
%
% flow model -> min(i,o)
min([H],H).
min([H|T],MIN):-
    min(T,MIN2),
    ( H < MIN2 -> MIN=H; MIN=MIN2).

% positions(l1...ln,elem,cnt) = { [], n == 0
%             [cnt] U positions(l2...ln), l1 == elem
%             positions(l2...ln), otherwise
%
% positions(List, Element, Count, Result)
% List = the given list
% Element = the element we compare with
% Count = used to keep track of the current position
% Result = list which contains the positions where an element
%          from List is equal with Elem
%
% flow model -> positions(i,i,i,o)
positions([],_,_,[]).
positions([H|T],H,Cnt,[Cnt|R]):- !,
    Cnt1 is Cnt + 1,
    positions(T,H,Cnt1,R).
positions([_|T],E,Cnt,R):-
    Cnt1 is Cnt + 1,
    positions(T,E,Cnt1,R).

% main(l1...ln) = { [], if n = 0
%      positions(l1...ln, min(l1...ln ),1), otherwise
%
% main(List, Result)
% List = the given list
% Result = list containing all the positions of the minimum element
%          from a List
%
% flow model -> main(i,o)
main([],[]).
main(L,RES):-
    min(L,MIN),
    positions(L,MIN,1,RES).
